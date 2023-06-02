import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/homePage/components/carousel.dart';
import 'package:flutter_ecommerce_app/homePage/components/homeGrid.dart';
import 'package:flutter_ecommerce_app/homePage/components/middleContainer.dart';
import 'package:flutter_ecommerce_app/pages/searchBar/searchbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[50],
      appBar: AppBar(
        toolbarHeight: 80,
        title: Padding(
          padding: const EdgeInsets.only(bottom: 4.0),
          child: CustomSearchBar(),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/cart');
              },
              icon: Icon(Icons.shopping_bag))
        ],
      ),
      body: Container(
        child: Column(
          children: [
            MyCarousel(),
            GradientContainer(),
            Text(
              'Most Popular',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            GridContainer()
          ],
        ),
      ),
    );
  }
}
