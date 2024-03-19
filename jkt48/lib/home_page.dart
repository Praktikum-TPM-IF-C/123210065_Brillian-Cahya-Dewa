import 'package:flutter/material.dart';
import 'package:jkt48/DataDummy.dart';
import 'package:jkt48/detail_page.dart';
import 'package:jkt48/main.dart';

class HomePage extends StatelessWidget {  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home JKT48 App"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          ), 
          itemCount: members.length,
        itemBuilder: (context, index){
          return InkWell(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => 
                DetailPage(member : members[index]),
                )
              );
            },
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(child: Image.network(members[index].photoUrl
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(8.0),
                    child: Text(
                      members[index].name,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}
