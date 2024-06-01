import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'home_page.dart';
import 'cart_provider.dart';
import 'note_page.dart';
import 'profile_page.dart';

class CartDetailPage extends StatefulWidget {
  @override
  _CartDetailPageState createState() => _CartDetailPageState();
}

class _CartDetailPageState extends State<CartDetailPage> {
  List<int> quantities = [];
  List<int> trueIndex = [];
  int count = 0;

  @override
  void initState() {
    super.initState();
    _initializeCart();
  }

  void _initializeCart() {
    for (int i = 0; i < itemCart.length; i++) {
      if (itemCart[i].isSet == true) {
        count += 1;
        trueIndex.add(i);
        quantities.add(itemCart[i].count);
      }
    }
  }

  void _onBottomNavTapped(int index) {
    switch (index) {
      case 0:
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
        break;
      case 1:
        // Do nothing, already on Cart page
        break;
      case 2:
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ProfilPage()));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Cart'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 11, 5, 31).withOpacity(0.8),
        automaticallyImplyLeading: false,
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: count == 0
                ? Center(
                    child: Text(
                      'Keranjang masih kosong.',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  )
                : ListView.builder(
                    itemCount: count,
                    itemBuilder: (context, index) {
                      return Card(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.green, width: 1.0),
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        margin: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 50,
                                height: 75,
                                child: Image.network(
                                  itemCart[trueIndex[index]].imageUrl,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    print('Error loading image: $error');
                                    return const Center(child: Text('Image'));
                                  },
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(itemCart[trueIndex[index]].name, style: const TextStyle(fontSize: 18, color: Colors.white)),
                                    Text('\$${itemCart[trueIndex[index]].cardMarketPrice}', style: const TextStyle(fontSize: 18, color: Colors.green)),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    icon: Icon(FontAwesomeIcons.minus, color: Colors.green),
                                    onPressed: () {
                                      setState(() {
                                        if (quantities[index] > 1) {
                                          quantities[index]--;
                                          itemCart[trueIndex[index]].count = quantities[index];
                                        }
                                      });
                                    },
                                  ),
                                  Text('${quantities[index]}', style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w200)),
                                  IconButton(
                                    icon: Icon(FontAwesomeIcons.plus, color: Colors.green),
                                    onPressed: () {
                                      setState(() {
                                        quantities[index]++;
                                        itemCart[trueIndex[index]].count = quantities[index];
                                      });
                                    },
                                  ),
                                ],
                              ),
                              IconButton(
                                icon: Icon(FontAwesomeIcons.times, color: Colors.black),
                                onPressed: () {
                                  setState(() {
                                    itemCart[trueIndex[index]].count = 1;
                                    itemCart[trueIndex[index]].isSet = false;
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => CartDetailPage(), 
                                      ),
                                    );
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
          if (count > 0)
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PaymentReceipt(count: count, trueIndex: trueIndex, quantities: quantities,)
                      ),
                    );
                  },
                  icon: Icon(Icons.money, color: Colors.white),
                  label: Text('Bayar', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: const Color.fromARGB(255, 14, 134, 18), padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ),
            ),
        ],
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
        currentIndex: 1, // Change according to the current page
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.white,
        onTap: _onBottomNavTapped,
      ),
    );
  }
}
