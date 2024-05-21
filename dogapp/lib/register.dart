import 'package:dogapp/login_page.dart';
import 'package:flutter/material.dart';
import 'data_akun.dart';
//import 'home_page.dart';

class RegisterPage extends StatefulWidget{
  @override
  RegisterPageState createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage>{
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String? errorMessage;
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title : Text("Register Page"),
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
                    
                  if (username != akun[i].username && password != akun[i].password){
                    Akun akunew = new Akun(username: username, password: password);
                    akun.add(akunew);
                    Navigator.push(context,
                       MaterialPageRoute(builder: (context) => LoginPage())
                      );
                      return;
                  }
                  }
                  
                }, child: Text('Create Account'),
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
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
                }, child: Text('Login Instead'),
              ),
            ],
          ),
        ),
      )
    );
  }
}