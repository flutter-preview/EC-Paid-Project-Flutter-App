import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/appTheme/apptheme.dart';
import 'package:flutter_ecommerce_app/homePage/components/gridItems.dart';

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
          children: List.generate(
            images.length,
            (index) => PopularGridItem(
              imagePath: 'images/${images[index]}',
              text: texts[index],
            ),
          ),
        ),
      ),
    );
  }
}
