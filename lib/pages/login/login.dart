// import 'dart:ui';

// import 'package:flutter/material.dart';
// import 'package:flutter_ecommerce_app/models/cart.dart';
// import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
// import 'package:flutter_redux/flutter_redux.dart';
// import '../../models/user.dart';
// import '../../stripe/stripe.dart';
// import '../../urls/urls.dart';
// import 'components/google_apple_button.dart';
// import 'components/input_box.dart';

// class LoginPage extends StatefulWidget {
//   LoginPage({Key? key}) : super(key: key);

//   @override
//   _LoginPageState createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final LoginUser loginuser = LoginUser();
//   String message = '';

//   _login(BuildContext context) async {
//     // await makePayment();
//     await login(loginuser);
//     // await getOffer();
//     // await initiateHandshake();
//     if (loginuser.email.contains('@') &&
//         loginuser.password.length >= 8 &&
//         RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(loginuser.password) &&
//         loginuser.password != loginuser.password.toLowerCase()) {
//       // final store=StoreProvider.of(context);
//       // store.state.cart= await getCartFromSession();
//       Navigator.pushNamed(context, "/mainPage");
//       setState(() {
//         message = 'Login successful';
//       });
//     } else {
//       setState(() {
//         message = 'password must contain Number Capital and Special character';
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Welcome!',
//           style: TextStyle(fontWeight: FontWeight.w700),
//         ),
//         centerTitle: true,
//         flexibleSpace: Container(
//           decoration: BoxDecoration(
//               image: DecorationImage(
//                   image: AssetImage('images/login-background.jpg'),
//                   fit: BoxFit.fill)),
//         ),
//       ),
//       body: ListView(children: [
//         Container(
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           height: MediaQuery.of(context).size.height,
//           decoration: const BoxDecoration(
//             image: DecorationImage(
//               image: AssetImage('images/login-background.jpg'),
//               fit: BoxFit.cover,
//             ),
//           ),
//           child: Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 ClipRRect(
//                   borderRadius: BorderRadius.circular(10),
//                   child: Container(
//                       width: double.infinity,
//                       padding: const EdgeInsets.all(10),
//                       decoration: BoxDecoration(
//                           gradient: LinearGradient(
//                               begin: Alignment.topLeft,
//                               end: Alignment.bottomRight,
//                               colors: [
//                                 Color.fromARGB(255, 95, 203, 230),
//                                 Color.fromARGB(255, 213, 238, 238),
//                               ]),
//                           border: Border.all(
//                               style: BorderStyle.solid,
//                               width: 5,
//                               color: Colors.white),
//                           color: Colors.white),
//                       child: Column(
//                         children: [
//                           Container(
//                             decoration: const BoxDecoration(
//                                 shape: BoxShape.circle,
//                                 image: DecorationImage(
//                                     image: AssetImage('images/logo2.jpg'),
//                                     fit: BoxFit.contain)),
//                             height: 180,
//                           ),
//                           MyInputBox(loginuser: loginuser),
//                         ],
//                       )),
//                 ),
//                 const SizedBox(height: 10),
//                 SizedBox(
//                   width: 200,
//                   height: 50,
//                   child: ElevatedButton(
//                     onPressed: () {
//                       _login(context);
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.cyan,
//                       elevation: 9.9,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(40.0),
//                       ),
//                     ),
//                     child: const Text('Login'),
//                   ),
//                 ),
//                 if (message.isNotEmpty)
//                   Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 10.0),
//                     child: Text(
//                       message,
//                       style: TextStyle(
//                         color: Colors.red,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 const SizedBox(height: 20),
//                 GoogleAndAppleButton(),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     TextButton(
//                       onPressed: () {
//                         Navigator.pushNamed(context, "/signup");
//                       },
//                       child: Container(
//                         padding: EdgeInsets.all(4),
//                         decoration: BoxDecoration(
//                             color: Colors.cyan,
//                             border: Border.all(width: 2, color: Colors.white)),
//                         child: const Text(
//                           "Not signed up yet? Signup",
//                           style: TextStyle(
//                               color: Colors.black,
//                               fontWeight: FontWeight.w700,
//                               fontSize: 15),
//                         ),
//                       ),
//                     )
//                   ],
//                 )
//               ],
//             ),
//           ),
//         ),
//       ]),
//     );
//   }
// }

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/models/cart.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import '../../models/user.dart';
import '../../stripe/stripe.dart';
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

  _login(BuildContext context) async {
    // await makePayment();
    await login(loginuser);
    // await getOffer();
    // await initiateHandshake();
    if (loginuser.email.contains('@') &&
        loginuser.password.length >= 8 &&
        RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(loginuser.password) &&
        loginuser.password != loginuser.password.toLowerCase()) {
      // final store=StoreProvider.of(context);
      // store.state.cart= await getCartFromSession();
      Navigator.pushNamed(context, "/mainPage");
      setState(() {
        message = 'Login successful';
      });
    } else {
      setState(() {
        message = 'password must contain Number Capital and Special character';
      });
    }
  }

  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text(
        'Welcome!',
        style: TextStyle(fontWeight: FontWeight.w700),
      ),
      centerTitle: true,
    ),
    body: OrientationBuilder(
      builder: (context, orientation) {
        final isPortrait = orientation == Orientation.portrait;

        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/login-background.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color.fromARGB(255, 95, 203, 230),
                                Color.fromARGB(255, 213, 238, 238),
                              ]),
                          border: Border.all(
                              style: BorderStyle.solid,
                              width: 5,
                              color: Colors.white),
                          color: Colors.white),
                      child: Column(
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: AssetImage('images/logo2.jpg'),
                                    fit: BoxFit.contain)),
                            height: 180,
                          ),
                          MyInputBox(loginuser: loginuser),
                        ],
                      )),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: 200,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      _login(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.cyan,
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
                const SizedBox(height: 20),
                GoogleAndAppleButton(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/signup");
                      },
                      child: Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            color: Colors.cyan,
                            border: Border.all(width: 2, color: Colors.white)),
                        child: const Text(
                          "Not signed up yet? Signup",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 15),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ]),
    );
  }
}