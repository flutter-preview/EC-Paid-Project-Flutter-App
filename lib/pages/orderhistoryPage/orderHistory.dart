import 'package:flutter/material.dart';

import 'package:flutter_ecommerce_app/pages/homePage/components/middleContainer.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class OrderHistory extends StatelessWidget {
  final List<User> userList = [
    User(name: "Valarie", status: "on the way", avatar: "assets/images/avatar3.png"),
    User(name: "Elyse", status: "pending", avatar: "assets/images/avatar4.png"),
    User(name: "Ethel", status: "delivered", avatar: "assets/images/avatar5.png")
  ];

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(title: Text("App"),),
      body: Column(
        children: [
          GradientContainer(text:"Order Detail",image:"https://www.shutterstock.com/image-vector/wallet-mascot-character-design-vector-1660276741"),
          Expanded( // Wrap ListView with Expanded widget
            child: ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 8),
              itemCount: userList.length,
              itemBuilder: (context, index) {
                User user = userList[index];
                return Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
            color: Color.fromARGB(255, 255, 255, 255),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            offset: Offset(0, 2),
                            blurRadius: 4,
                            spreadRadius: 2,
                          ),
                        ],),
                  child: ListTile(
                    leading: Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            offset: Offset(0, 2),
                            blurRadius: 4,
                          ),
                        ],
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          user.avatar,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    title: Text(user.name),
                    trailing: Text(user.status),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class User {
  final String name;
  final String status;
  final String avatar;

  User({required this.name, required this.status, required this.avatar});
}
