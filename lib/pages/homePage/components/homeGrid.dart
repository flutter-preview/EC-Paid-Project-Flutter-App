import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/appTheme/apptheme.dart';
import 'package:flutter_ecommerce_app/models/food_and_category.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import '../../../reduxStore/action.dart';
import '../../../reduxStore/app_state.dart';
import '../../../urls/urls.dart';
import '../actions/homegride.dart';
import 'gridItems.dart';

class GridContainer extends StatelessWidget {
  final List<String> images = [
    'LPG1.jpeg',
    'LPG2.jpeg',
    'LPG3.jpg',
    'LPG4.jpeg',
    'LPG5.png',
    'LPG6.jpeg',
  ];

  final List<String> texts = [
    '0.5Kg',
    '1.0Kg',
    '1.5Kg',
    '2.0Kg',
    '2.5Kg',
    '3.0Kg',
  ];

  @override
  Widget build(BuildContext context) {
    double containerHeight = MediaQuery.of(context).size.height / 4;
    double containerWidth = MediaQuery.of(context).size.width;

    return FutureBuilder(
      future: homePageProducts(context),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Display a loading indicator while waiting for data
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          // Display an error message if there's an error
          return Text('Error: ${snapshot.error}');
        } else if (snapshot.hasData) {
          // Retrieve the products from the snapshot
          final List<LPG> products = snapshot.data! as List<LPG>;

          // Update the store with all the products
         

          return Padding(
            padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
            child: Container(
              height: containerHeight,
              width: containerWidth,
              color: Theme.of(context).appBarTheme.backgroundColor,
              child: GridView.count(
                padding: EdgeInsets.all(0),
                crossAxisCount: 3,
                childAspectRatio: containerWidth / (containerHeight * 1.5),

                children: products.map((product) {
    final index = products.indexOf(product);
    final lpg = products[index];
    return PopularGridItem(
     lpg:lpg
    );
  }).toList(),
              ),
            ),
          );
        } else {
          // Handle the case when no data is available
          return Text('No data available.');
        }
      },
    );
  }

}
