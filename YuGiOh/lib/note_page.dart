import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'home_page.dart';
import 'cart_provider.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/standalone.dart' as tz;

// ignore: must_be_immutable
class PaymentReceipt extends StatelessWidget {
  final int count;
  List<int> trueIndex = [];
  List<int> quantities = [];
  double total = 0.0;
  double rupiah = 0.0;
  double yen = 0.0;

  PaymentReceipt({required this.count, required this.trueIndex, required this.quantities});

  final ScrollController _scrollController = ScrollController(); // Create a ScrollController

  @override
  Widget build(BuildContext context) {  
    // Initialize time zone data
    tz.initializeTimeZones();
    final DateTime now = DateTime.now();

    // Find the London time zone
  final tz.Location london = tz.getLocation('Europe/London');

  // Convert the current time to London time
  final DateTime londonTime = tz.TZDateTime.from(now, london);

  // Format the London time
  final String formattedDateLondon = DateFormat('dd MMM yyyy HH:mm:ss').format(londonTime);

  
  final tz.Location wita = tz.getLocation('Asia/Makassar');
  final DateTime witaTime = tz.TZDateTime.from(now, wita);
  final String formattedDateWita = DateFormat('dd MMM yyyy HH:mm:ss').format(witaTime);
  final tz.Location wit = tz.getLocation('Asia/Jayapura');
  final DateTime witTime = tz.TZDateTime.from(now, wit);
  final String formattedDateWit = DateFormat('dd MMM yyyy HH:mm:ss').format(witTime);

    final String formattedDate = DateFormat('dd MMM yyyy HH:mm:ss').format(now);
    return Material(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Scrollbar(
          controller: _scrollController, // Attach the ScrollController to the Scrollbar
          thumbVisibility: true,
          child: SingleChildScrollView(
            controller: _scrollController, // Attach the ScrollController to the SingleChildScrollView
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'WIB : $formattedDate',
                  style: TextStyle(fontSize: 16, color: Colors.blue),
                ),
                Text(
                  'WITA : $formattedDateWita',
                  style: TextStyle(fontSize: 16, color: Colors.blue),
                ),
                Text(
                  'WIT : $formattedDateWit',
                  style: TextStyle(fontSize: 16, color: Colors.blue),
                ),
                Text(
                  'London : $formattedDateLondon',
                  style: TextStyle(fontSize: 16, color: Colors.blue),
                ),
                SizedBox(height: 40),
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 49, 44, 44), 
                      borderRadius: BorderRadius.circular(12), 
                    ),
                    padding: const EdgeInsets.all(12.0), 
                    child: Text(
                      'Nota Pembayaran',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 255, 255, 255)
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 50),
                Table(
                  columnWidths: {
                    0: FlexColumnWidth(2), 
                    1: FlexColumnWidth(1), 
                    2: FlexColumnWidth(1), 
                    3: FlexColumnWidth(1), 
                  },
                  children: [
                    TableRow(children: [
                      _buildTableHeaderCell('Item Details'),
                      _buildTableHeaderCell('Jumlah'),
                      _buildTableHeaderCell('Harga'),
                      _buildTableHeaderCell('SubTotal'),
                    ]),
                    for(int i = 0; i < count; i++)
                      _buildTableRow(itemCart[trueIndex[i]].name, quantities[i], itemCart[trueIndex[i]].cardMarketPrice),
                  ],
                ),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerRight,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Total : \$${total.toStringAsFixed(3)}   ',
                        style: TextStyle(fontSize: 16,  color: Colors.white),
                      ),
                      Text(
                        '= Rp. ${rupiah.toStringAsFixed(0)}   ',
                        style: TextStyle(fontSize: 16,  color: Colors.white),
                      ),
                      Text(
                        '=  ¥${yen.toStringAsFixed(0)}   ',
                        style: TextStyle(fontSize: 16,  color: Colors.white),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Status : Lunas   ',
                        style: TextStyle(fontSize: 16,  color: Colors.white),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Center(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      for(int i = 0; i < count; i++){
                        itemCart[trueIndex[i]].isSet = false;
                        itemCart[trueIndex[i]].count = 1;
                      }
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ),
                      );
                    },
                    icon: Icon(Icons.home, color: Colors.black, size: 29,),
                    label: Text(
                      'Back Home',
                      style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 209, 185, 6), 
                      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0), // Set padding
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TableCell _buildTableHeaderCell(String content) {
    return TableCell(
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: Colors.white, width: 2), // Thick top border
            bottom: BorderSide(color: Colors.white, width: 2), // Thick bottom border
            left: BorderSide(color: Colors.white, width: 1), // Thin left border
            right: BorderSide(color: Colors.white, width: 1), // Thin right border
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            content,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  TableRow _buildTableRow(String item, int quantity, double price) {
    double subtotal = quantity * price;
    total += subtotal;
    rupiah = total * 16000;
    yen = total * 102;
    return TableRow(
      children: [
        _buildTableCell(item),
        _buildTableCell(quantity.toString(), isQuantity: true),
        _buildTableCell('\$${price.toStringAsFixed(2)}'),
        _buildTableCell('\$${subtotal.toStringAsFixed(2)}'),
      ],
    );
  }

  TableCell _buildTableCell(String content, {bool isQuantity = false}) {
    return TableCell(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 1), 
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ConstrainedBox(
            constraints: isQuantity
                ? BoxConstraints(maxWidth: 80) 
                : BoxConstraints(),
            child: Text(
              content,
              style: TextStyle(fontSize: 14, color: Colors.white),
              textAlign: isQuantity ? TextAlign.center : TextAlign.left,
            ),
          ),
        ),
      ),
    );
  }
}
