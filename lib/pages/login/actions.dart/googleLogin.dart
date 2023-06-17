 import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

signOut() {
    FirebaseAuth.instance.signOut();
  }

signInWithGoogle(BuildContext context) async {
  try {
    GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,      
      idToken: googleAuth?.idToken,
    );

    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);
print(userCredential);
    if (userCredential.user != null) {
      // Navigate to the Homepage
      Navigator.pushReplacementNamed(context, '/mainPage');
      print(userCredential.user?.displayName);
    }
  } catch (e) {
    // Handle sign-in error
    print('Sign-in with Google failed: $e');
  }
}
