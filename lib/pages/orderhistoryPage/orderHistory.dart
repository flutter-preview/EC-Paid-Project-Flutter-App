import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/pages/homePage/components/carousel.dart';
import 'package:flutter_ecommerce_app/pages/homePage/components/middleContainer.dart';

class OrderHistory extends StatelessWidget {
  final List<User> userList = [
    User(name: "John", status: "Active", avatar: "assets/images/avatar1.png"),
    User(name: "Lindsey", status: "Away", avatar: "assets/images/avatar2.png"),
    User(name: "Valarie", status: "Offline", avatar: "assets/images/avatar3.png"),
    User(name: "Elyse", status: "Active", avatar: "assets/images/avatar4.png"),
    User(name: "Ethel", status: "Away", avatar: "assets/images/avatar5.png"),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GradientContainer(text:"Order Detail",image:"https://www.shutterstock.com/image-vector/wallet-mascot-character-design-vector-1660276741"),
        ListView.separated(
          padding: EdgeInsets.symmetric(vertical: 8),
          itemCount: userList.length,
          separatorBuilder: (context, index) => Divider(
            color: Colors.grey,
          ),
          itemBuilder: (context, index) {
            User user = userList[index];
            return Container(
              padding: EdgeInsets.all(8),
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
                subtitle: Text(user.status),
              ),
            );
          },
        ),
      ],
    );
  }
}

class User {
  final String name;
  final String status;
  final String avatar;

  User({required this.name, required this.status, required this.avatar});
}
