import 'package:flutter/material.dart';

import '../actions.dart/googleLogin.dart';

class GoogleAndAppleButton extends StatelessWidget {
  const GoogleAndAppleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                      ),
                      onPressed: () {
                        signInWithGoogle(context);
                        // if (FirebaseAuth.instance.currentUser != null) {
                        //   Navigator.of(context).pushNamed("/gridpage");
                        // }
                      },
                      child: const CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(Icons.android),
                      ),
                    ),
                    const SizedBox(width: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                      ),
                      onPressed: () {
                        // signInWithGoogle();
                        signOut();
                      },
                      child: const CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(Icons.apple),
                      ),
                    ),
                  ],
                );
  }
}