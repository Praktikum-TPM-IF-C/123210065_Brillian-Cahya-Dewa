import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'cart_page.dart';
import "cart_provider.dart";

class DetailPage extends StatelessWidget {
  final int indeks;

  DetailPage({required this.indeks});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 11, 5, 31).withOpacity(0.8), // Match the color with HomePage AppBar
        leading: IconButton(
          icon: FaIcon(FontAwesomeIcons.arrowLeft),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Detail Image'),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Color.fromRGBO(0, 0, 0, 0.7), // Background color with opacity
          image: DecorationImage(
            image: AssetImage('images/detail_beg.png'), // Ubah path gambar sesuai kebutuhan
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  width: 240, // Atur lebar gambar
                  height: 360, // Atur tinggi gambar
                  child: Image.network(
                    itemCart[indeks].imageUrl,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      print('Error loading image: $error');
                      return const Center(child: Text('Error loading image'));
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(10),
                color: Colors.black.withOpacity(0.5), // Background color with opacity
                child: Text(
                  'Price Per Unit :\n\$${itemCart[indeks].cardMarketPrice}',
                  textAlign: TextAlign.center, // Align teks ke tengah
                  style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 9, 230, 127), fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 20),
              if (itemCart[indeks].isSet == true)
                Text('Item Sudah Ditambah ke Keranjang', 
                style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 189, 209, 6), fontWeight: FontWeight.bold),)
              else
                ElevatedButton.icon(
                  onPressed: () {
                    itemCart[indeks].isSet = true;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CartDetailPage(),
                      ),
                    );
                  },
                  icon: FaIcon(FontAwesomeIcons.shoppingCart),
                  label: Text(
                    'Add to Cart',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.white, // Text color
                    padding: EdgeInsets.symmetric(vertical: 18.0, horizontal: 12.0), // Padding
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
