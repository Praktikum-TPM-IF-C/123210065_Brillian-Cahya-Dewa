import 'package:flutter/material.dart';
import 'package:jkt48/main.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget{
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage>{
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String? errorMessage;
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title : Text("Login Page"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Padding(padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 250,
                child: TextField(
                  controller: usernameController,
                  decoration: InputDecoration(
                    labelText: 'Username',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(height: 20),

              SizedBox(
                width: 250,
                child: TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(height: 20),

              ElevatedButton(
                onPressed: (){
                  String username = usernameController.text;
                  String password = passwordController.text;
                  if (username == 'brillian' && password == '123210065'){
                    Navigator.push(context,
                     MaterialPageRoute(builder: (context) => HomePage())
                    );
                  }
                  else{
                    setState(() {
                      errorMessage = 'Username atau Password Salah';
                    });
                  }
                }, child: Text('Login'),
              ),
              SizedBox(height: 10),
              if(errorMessage != null)
                Text(errorMessage!,
                style: TextStyle(color: Colors.red),
                )
            ],
          ),
        ),
      )
    );
  }
}