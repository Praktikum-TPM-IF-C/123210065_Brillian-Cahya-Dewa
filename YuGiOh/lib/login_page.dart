import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'constants/palette.dart';
import 'home_page.dart';
import 'register_page.dart';
import 'widgets/background_image.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscurePassword = true;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> login() async {
  var url = Uri.parse("http://192.168.171.200/YuGiOh/login.php");
  //ip config device

  try {
    var response = await http.post(url, body: {
      "username": _usernameController.text,
      "password": _passwordController.text,
    });
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      var data = json.decode(response.body);

      if (data['message'] == "Error") {
        Fluttertoast.showToast(
          msg: data['description'] ?? 'Error',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.green, 
          textColor: Colors.red,
          fontSize: 18.0,
        );
      } else if (data['message'] == "Success") {
        // Save login status
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setBool('isLoggedIn', true);
        //await prefs.setString('username', _usernameController.text);

        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
      }
    } else {
      Fluttertoast.showToast(
        msg: 'Server error: ${response.statusCode}',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: Colors.green, 
        textColor: Colors.red,
        fontSize: 18.0,
      );
    }
  } catch (error) {
    print('Error: $error');
    Fluttertoast.showToast(
      msg: 'Error: $error',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: Colors.green, 
      textColor: Colors.red,
      fontSize: 18.0,
    );
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          backgroundImage(),
          SingleChildScrollView(
            child: SafeArea(
              child: Column(
                children: [
                  const SizedBox(height: 100),
                  const Center(
                    child: Text(
                      'Yu Gi Oh!',
                      style: kHeading,
                    ),
                  ),
                  const SizedBox(height: 100),
                  Form(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 40),
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 5),
                            decoration: BoxDecoration(
                              color: Colors.grey[600]!.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: TextFormField(
                              controller: _usernameController,
                              showCursor: true,
                              decoration: const InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 15),
                                border: InputBorder.none,
                                prefixIcon: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: Icon(
                                    FontAwesomeIcons.user,
                                    color: Colors.white,
                                    size: 25,
                                  ),
                                ),
                                hintText: 'Username',
                                hintStyle: kBodyText,
                              ),
                              style: kBodyText,
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.next,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 5),
                            decoration: BoxDecoration(
                              color: Colors.grey[600]!.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: TextFormField(
                              controller: _passwordController,
                              obscureText: _obscurePassword,
                              showCursor: true,
                              autocorrect: false,
                              decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 15),
                                border: InputBorder.none,
                                prefixIcon: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: Icon(
                                    FontAwesomeIcons.lock,
                                    color: Colors.white,
                                    size: 25,
                                  ),
                                ),
                                hintText: 'Password',
                                hintStyle: kBodyText,
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _obscurePassword
                                        ? FontAwesomeIcons.eye
                                        : FontAwesomeIcons.eyeSlash,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _obscurePassword = !_obscurePassword;
                                    });
                                  },
                                ),
                              ),
                              style: kBodyText,
                              textInputAction: TextInputAction.done,
                            ),
                          ),
                    
                          const SizedBox(height: 60),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: TextButton(
                              onPressed: login,
                              child: const Text(
                                'Login',
                                textAlign: TextAlign.center,
                                style: kBodyText,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 50),
                  Text("Don't have account?", 
                  style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          decoration: TextDecoration.underline),
                  ),
                  
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterPage()),
                );
                    },
                    child: const Text(
                      'Create New Account',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          decoration: TextDecoration.underline),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
