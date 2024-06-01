import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'cart_page.dart';
import 'data_dummy.dart';
import 'detail_page.dart';
import 'profile_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<CardInfo>> futureCardInfo;
  late ScrollController _scrollController;
  bool _isAppBarScrolled = false;
  int? _hoveredIndex;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.offset > 0 && !_isAppBarScrolled) {
        setState(() {
          _isAppBarScrolled = true;
        });
      } else if (_scrollController.offset <= 0 && _isAppBarScrolled) {
        setState(() {
          _isAppBarScrolled = false;
        });
      }
    });
    futureCardInfo = fetchCardInfo();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<List<CardInfo>> fetchCardInfo() async {
    final List<Future<CardInfo>> cardFutures = [];

    for (String link in DummyData.cardLinks) {
      final response = await http.get(Uri.parse(link));

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        final List<dynamic> data = jsonData['data'];
        final cardInfo = CardInfo.fromJson(data[0]);
        cardFutures.add(Future.value(cardInfo));
      } else {
        throw Exception('Failed to load card info');
      }
    }

    return Future.wait(cardFutures);
  }

  void _onBottomNavTapped(int index) {
    switch (index) {
      case 0:
        // Do nothing, already on Home Page
        break;
      case 1:
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => CartDetailPage()));
        break;
      case 2:
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ProfilPage()));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: AppBar( 
          backgroundColor: _isAppBarScrolled
              ? Color.fromARGB(255, 11, 5, 31).withOpacity(0.8)
              : Color.fromARGB(255, 11, 5, 31).withOpacity(0.8),
          elevation: 0,
          flexibleSpace: Center(
            child: Container(
              width: 140, 
              height: 70, 
              child: Image.asset(
                'images/appbar_image.png',
                fit: BoxFit.contain, 
                errorBuilder: (context, error, stackTrace) {
                  print('Error loading image: $error');
                  return const Center(child: Text('Error loading image'));
                },
              ),
            ),
          ),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0), 
          child: FutureBuilder<List<CardInfo>>(
            future: futureCardInfo, 
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text('No data found'));
              } else {
                final cards = snapshot.data!;
                return ListView.builder(
                  controller: _scrollController,
                  itemCount: cards.length,
                  itemBuilder: (context, index) {
                    final card = cards[index];
                    return MouseRegion(
                      onEnter: (_) {
                        setState(() {
                          _hoveredIndex = index;
                        });
                      },
                      onExit: (_) {
                        setState(() {
                          _hoveredIndex = null;
                        });
                      },
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailPage(indeks: index),
                            ),
                          );
                        },
                        child: Card(
                          color: _hoveredIndex == index ? Colors.grey[700] : Colors.grey[800], 
                          margin: const EdgeInsets.symmetric(vertical: 10), 
                          child: Padding(
                            padding: const EdgeInsets.all(8.0), 
                            child: Row(
                              children: [
                                Container(
                                  width: 60, 
                                  height: 90, 
                                  child: Image.network(
                                    card.imageUrl,
                                    fit: BoxFit.cover, // Sesuaikan ukuran gambar
                                    errorBuilder: (context, error, stackTrace) {
                                      print('Error loading image: $error');
                                      return const Center(child: Text('Error loading image'));
                                    },
                                  ),
                                ),
                                const SizedBox(width: 13), // Spasi antara gambar dan teks
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(card.name, style: const TextStyle(fontSize: 20, color: Colors.white)), 
                                      Text(card.desc, style: const TextStyle(fontSize: 14, color: Colors.white)), 
                                    ],
                                  ),
                                ),
                                Text('\$${card.cardMarketPrice}', style: const TextStyle(
                                  fontSize: 18, color: Color.fromARGB(255, 8, 136, 3), 
                                  fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              }
            },
          ),
        ),
      
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromARGB(255, 11, 5, 31).withOpacity(0.8),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.home, color: Colors.white),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.shoppingCart, color: Colors.white),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.user, color: Colors.white),
            label: 'Profile',
          ),
        ],
        currentIndex: 0, // Ubah sesuai dengan halaman saat ini
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.white,
        onTap: _onBottomNavTapped,
      ),
    );
  }
}

class CardInfo {
  final String name;
  final String desc;
  final String imageUrl;
  final String cardMarketPrice;
  int count;

  CardInfo({required this.name, required this.desc, required this.imageUrl, required this.cardMarketPrice, required this.count});

  factory CardInfo.fromJson(Map<String, dynamic> json) {
    return CardInfo(
      name: json['name'],
      desc: json['desc'],
      imageUrl: json['card_images'][0]['image_url'],
      cardMarketPrice: json['card_prices'][0]['cardmarket_price'],
      count: 1
    );
  }
}
