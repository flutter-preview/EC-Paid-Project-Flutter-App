import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/models/user.dart';
import 'package:flutter_ecommerce_app/pages/profilePage/components/profile_icon_widget.dart';
import 'package:flutter_ecommerce_app/pages/profilePage/components/profile_menu_widget.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../urls/urls.dart';

// class ProfileData {
  // String name;
  // String email;
  // String password;
  // String phoneNo;
  // String address;

  // ProfileData();
// }

class ProfilePage extends StatelessWidget {
  // final Future<User> userProfileFuture;

  // const ProfilePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Profile'),
      ),
      body: FutureBuilder<User>(
        future: loadUserProfile(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (snapshot.hasData) {
            final User user = snapshot.data as User;
            return SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    ProfileIconWidget(),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(user.username),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(user.email),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: 200,
                      child: ElevatedButton(
                        onPressed: () async{
                          await bank();
                          // Navigator.pushNamed(context, '/updateProfilePage');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.cyan,
                          side: BorderSide.none,
                          shape: const StadiumBorder(),
                        ),
                        child: const Text('Edit Profile'),
                      ),
                    ),
                    const SizedBox(height: 30),
                    const Divider(),
                    const SizedBox(
                      height: 10,
                    ),
                    ProfileMenuWidget(
                      name: 'Billing Details',
                      leadingIcon: LineAwesomeIcons.wallet,
                      onTap: () {
                        Navigator.pushNamed(context, '/billingDetailsPage');
                      },
                      trailingIcon: true,
                      textColor: Colors.black,
                    ),
                    ProfileMenuWidget(
                      name: 'Terms of Service',
                      leadingIcon: LineAwesomeIcons.info,
                      onTap: () {
                        Navigator.pushNamed(context, '/tos');
                      },
                      trailingIcon: true,
                      textColor: Colors.black,
                    ),
                    ProfileMenuWidget(
                      name: 'Rate the App',
                      leadingIcon: LineAwesomeIcons.star,
                      onTap: () {},
                      trailingIcon: true,
                      textColor: Colors.black,
                    ),
                    const SizedBox(height: 10),
                    const Divider(),
                    const SizedBox(height: 10),
                    ProfileMenuWidget(
                      name: 'Logout',
                      leadingIcon: LineAwesomeIcons.alternate_sign_out,
                      onTap: () async{
                        final prefs = await SharedPreferences.getInstance();
                        prefs.remove('lpguser');
                        Navigator.pushNamed(context, '/login');
                      },
                      trailingIcon: false,
                      textColor: Colors.red,
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Center(child: Text('No user profile data found.'));
          }
        },
      ),
    );
  }
}

Future<User> loadUserProfile() async {
  final prefs = await SharedPreferences.getInstance();

  final userData = prefs.getString('lpguser');
  if (userData != null) {
       final userMap = jsonDecode(userData);
    print(userData);
    final userMap1=jsonDecode(userMap);
    print(userMap1);
    // String b=userMap["email"] as String;
User user=User(email: userMap1["email"], username: userMap1["first_name"]);
    return user;
  } else {
    throw Exception('User profile data not found in shared preferences.');
  }
}
