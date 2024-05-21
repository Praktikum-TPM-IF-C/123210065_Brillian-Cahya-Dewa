import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Breed> breeds = [];

  @override
  void initState() {
    super.initState();
    fetchPosts();   
  }

  Future<void> fetchPosts() async {
    final response =
        await http.get(Uri.parse('https://dogapi.dog/api/v2/breeds'));

    if (response.statusCode == 200) {
      
      final List<dynamic> responseData = jsonDecode(response.body);
      setState(() {
        breeds = responseData.map((json) => Breed.fromJson(json)).toList();
      });

      for(int i = 0; i<breeds.length; i++){
      
        final response =
        await http.get(Uri.parse('https://dogapi.dog/api/v2/breeds/${breeds[i].id}'));

        if (response.statusCode == 200) {
         
          var decodedObject = jsonDecode(response.body);
   
        } 
        else {
          throw Exception('Failed to load user');
        }
      }
    } 
    else {
      throw Exception('Failed to load posts');
    }
  }

  @override
  
  Widget build(BuildContext context) {
    
    return Scaffold(
      
      appBar: AppBar(
        title: Text(
  'Dogs Breed List',
  style: TextStyle(color: Color.fromARGB(255, 33, 88, 251), fontWeight: FontWeight.bold),
),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 255, 119, 114),
      ),
      backgroundColor:
          Color.fromARGB(255, 254, 254, 254), 
          
      body: ListView.builder(
        
        itemCount: breeds.length,
        itemBuilder: (context, index) {
  
          return Card(      
            elevation: 4,
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              //Title
              title: Text('Name : ${breeds[index].name}}',
              //style bold
              style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(breeds[index].description),
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => PostDetailPage(post: breeds[index]),
                //   ),
                // );
              },
            ),
          );
        },
      ),
    );
  }
}


class Breed {
  final int id;
  final String name, description;

  Breed({
    required this.id,
    required this.name,
    required this.description,
  });

  factory Breed.fromJson(Map<String, dynamic> json) {
    return Breed(
      id: json['data']['id'],
      name: json['data']['name'],
      description: json['data']['description'],
    );
  }
}




