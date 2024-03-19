import 'package:flutter/material.dart';
import 'package:jkt48/DataDummy.dart';

class DetailPage extends StatefulWidget {
  final Member member;
  DetailPage({required this.member});
  @override
  // DetailPageState createState() => DetailPageState();
  State<DetailPage> createState() => _DetailPageState();

}
class _DetailPageState extends State<DetailPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Member"),
      )
      // body: //Image(
      //   //Image.network("https://jkt48.com/profile/amanda_sukma.jpg"),
      //   //Image.network(Member.photoUrl),
      // );
    // );
    );
  }
    

  }