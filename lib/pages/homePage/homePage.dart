import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/pages/homePage/components/carousel.dart';
import 'package:flutter_ecommerce_app/pages/homePage/components/homeGrid.dart';
import 'package:flutter_ecommerce_app/pages/homePage/components/middleContainer.dart';
import 'package:flutter_ecommerce_app/pages/searchBar/searchbar.dart';

import '../bottomNavigationBar/bottomNavigationBar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[50],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 80,
        title: Text("LPG"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/orderHistory');
              },
              icon: Icon(Icons.history))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomSearchBar(
              filter: false,
            ),
            MyCarousel(),
            GradientContainer(
              text: "Fuel Your Homes",
              image:
                  "https://media.istockphoto.com/id/1090484242/photo/two-blue-gas-bottles.jpg?s=612x612&w=0&k=20&c=EJCLIrc1YOKv6x-ku1URu8FU-8Km8Ks5B7r5qcQvzE0=",
            ),
            Text(
              'Most Popular',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            GridContainer()
          ],
        ),
      ),
        // bottomNavigationBar: BottomNavigationBarForApp(indexNum: 0),
    );
  }
}
