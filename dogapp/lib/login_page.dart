import 'package:dogapp/home_page.dart';
import 'package:dogapp/register.dart';
import 'package:flutter/material.dart';
import 'data_akun.dart';
//import 'home_page.dart';

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
                    hintText: '',
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
                    hintText: '',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(height: 20),

              ElevatedButton(
                onPressed: (){
                  String username = usernameController.text;
                  String password = passwordController.text;

                  for(int i = 0; i < akun.length; i++){
                    if (username == akun[i].username && password == akun[i].password){
                      
                      Navigator.push(context,
                       MaterialPageRoute(builder: (context) => HomePage())
                      );
                      return; 
                    }
                  }
                  setState(() {
                    errorMessage = 'Username atau Password Salah';
                  });
                  
                }, child: Text('Login'),
              ),
              SizedBox(height: 10),
              if(errorMessage != null)
                Text(errorMessage!,
                style: TextStyle(color: Colors.red),
                ),
                
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: (){ 
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterPage()),
                );
                }, child: Text('Register'),
              ),
            ],
          ),
        ),
      )
    );
  }
}