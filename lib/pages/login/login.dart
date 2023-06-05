import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import '../../models/user.dart';
import '../../urls/urls.dart';
import 'components/google_apple_button.dart';
import 'components/input_box.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginUser loginuser = LoginUser();
  String message = '';

  void _login() {
    if (loginuser.email.contains('@') &&
        loginuser.password.length >= 8 &&
        RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(loginuser.password) &&
        loginuser.password != loginuser.password.toLowerCase()) {
      setState(() {
        message = 'Login successful';
      });
    } else {
      setState(() {
        message = 'Invalid credentials';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
        backgroundColor: Colors.transparent,
      ),
      body: ListView(
        padding: const EdgeInsets.all(0.0),
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/loginPage.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Expanded(child: SizedBox()),
                  const SizedBox(
                    child: CircleAvatar(
                      radius: 60,
                      backgroundImage: NetworkImage(
                        'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8Mnx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=400&q=60',
                      ),
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                  const SizedBox(height: 40),
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
                              color: Color.fromARGB(4, 247, 240, 240),
                            )
                          ],
                          color: Colors.white.withOpacity(0.0),
                        ),
                        child: MyInputBox(loginuser: loginuser),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: 200,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: _login,
                      style: ElevatedButton.styleFrom(
                        elevation: 9.9,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                      ),
                      child: const Text('Login'),
                    ),
                  ),
                  if (message.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Text(
                        message,
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  const Expanded(child: SizedBox()),
                  GoogleAndAppleButton(),
                  const Expanded(child: SizedBox()),
                  SafeArea(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: const Text("Not signed up yet? Signup"),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
