import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants/palette.dart';
import 'login_page.dart';
import 'widgets/background_image.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}


class _RegisterPageState extends State<RegisterPage> {
  bool _obscurePassword = true;
  bool _obscurePassword2 = true;

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  Future<void> register() async {
    var url = Uri.parse("http://192.168.110.200/YuGiOh/register.php");

    // Menambahkan logika untuk membandingkan password dengan konfirmasi password
    if (_passwordController.text != _confirmPasswordController.text) {
      Fluttertoast.showToast(
        msg: 'Konfirmasi password tidak cocok',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: Colors.green, 
        textColor: Colors.red,
        fontSize: 18.0,
      );
      return; 
    }

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
          Fluttertoast.showToast(
            msg: 'Success Buat Akun!',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 5,
            backgroundColor: Colors.green,
            textColor: Color.fromARGB(255, 255, 255, 255),
            fontSize: 18.0,
          );
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

  void _registerAndClearFields() {
    register();
    _usernameController.clear();
    _passwordController.clear();
    _confirmPasswordController.clear();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
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
                  const SizedBox(height: 67),
                  const Center(
                    child: Text(
                      'Yu Gi Oh!',
                      style: kHeading,
                    ),
                  ),
                  const SizedBox(height: 70),
                  Form(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 40),
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                            decoration: BoxDecoration(
                              color: Colors.grey[600]!.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: TextFormField(
                              controller: _usernameController,
                              showCursor: true,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.symmetric(vertical: 15),
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
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
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
                                contentPadding: EdgeInsets.symmetric(vertical: 15),
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
                          const SizedBox(height: 12),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                            decoration: BoxDecoration(
                              color: Colors.grey[600]!.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: TextFormField(
                              controller: _confirmPasswordController,
                              obscureText: _obscurePassword2,
                              showCursor: true,
                              autocorrect: false,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(vertical: 15),
                                border: InputBorder.none,
                                prefixIcon: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: Icon(
                                    FontAwesomeIcons.lock,
                                    color: Colors.white,
                                    size: 25,
                                  ),
                                ),
                                hintText: 'Confirm Password',
                                hintStyle: kBodyText,
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _obscurePassword2
                                        ? FontAwesomeIcons.eye
                                        : FontAwesomeIcons.eyeSlash,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _obscurePassword2 = !_obscurePassword2;
                                    });
                                  },
                                ),
                              ),
                              style: kBodyText,
                              textInputAction: TextInputAction.done,
                            ),
                          ),
                          const SizedBox(height: 50),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: TextButton(
                              onPressed: _registerAndClearFields,
                              child: const Text(
                                'Create Account',
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
                  Text(
                    "Already have an account?",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                    child: const Text(
                      'Login Here',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
