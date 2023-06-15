import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';

import '../../models/signup.dart';
import '../../urls/urls.dart';
import 'components/google_apple_button.dart';
import 'components/my_input_column.dart';

class SignupPage extends StatefulWidget {
  SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final SignupUser user = SignupUser();
  final TextEditingController phoneNumberController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _isPasswordVisible = false;
  String? _errorMessage;

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

   _signup()async {
 
  
    final signu =await signup(user);

  if (_formKey.currentState!.validate()) {
      final data=await signup(user);
        bool isValid = validateFields();
    if (isValid 
    && data
    )  {
      setState(() {
        _errorMessage = 'Signup successful!';
      });
    } else {
      setState(() {
        _errorMessage = 'Please fill in all the required fields correctly.';
      });
    }
  }
}
 bool validateFields() {
  final RegExp specialCharsRegex = RegExp(r'[!@#$%^&*(),.?":{}|<>]');

  if (user.email.contains('@') &&
      user.password.length >= 8 &&
      specialCharsRegex.hasMatch(user.password) &&
      user.confirmPassword == user.password &&
      user.phone.toString().length == 12 &&
      user.address.isNotEmpty) {
    return true;
  } else {
    return false;
  }
}


  @override
  void dispose() {
    phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  'https://w.forfun.com/fetch/59/59eea5bf2b204449655f734f3ea97a9c.jpeg?h=300&r=0.5',
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      child: CircleAvatar(
                        radius: 60,
                        backgroundImage: NetworkImage(
                          'https://images.unsplash.com/photo-1637079421287-2336e69d3257?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80',
                        ),
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                    const SizedBox(height: 30),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            border: Border.all(
                              style: BorderStyle.solid,
                              width: 2,
                              color: Colors.black.withOpacity(0.2),
                            ),
                            boxShadow: const <BoxShadow>[
                              BoxShadow(
                                blurRadius: 10,
                                spreadRadius: 40.0,
                                offset: Offset(0, 10),
                                color: Color.fromARGB(8, 247, 240, 240),
                              )
                            ],
                            color: Colors.white.withOpacity(0.0),
                          ),
                          child: Form(
                            key: _formKey,
                            child: MyInputColumn(user: user),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: 200,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: _signup,
                        child: const Text('Signup'),
                        style: ElevatedButton.styleFrom(
                          elevation: 9.9,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40.0),
                          ),
                        ),
                      ),
                    ),
                    if (_errorMessage != null)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          _errorMessage!,
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    Expanded(child: const SizedBox()),
                    GoogleAndAppleButtonSignup(),
                    Expanded(child: const SizedBox()),
                    SafeArea(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/login');
                            },
                            child: Text("Already signed up yet? login"),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
