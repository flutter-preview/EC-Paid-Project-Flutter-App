import 'package:flutter/material.dart';

class PopularGridItem extends StatelessWidget {
  final String imagePath;
  final String text;

  const PopularGridItem({required this.imagePath, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 4.0, left: 4.0, top: 4.0),
      child: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Text(
            text,
            style: TextStyle(fontSize: 16.0),
          ),
        ],
      ),
    );
  }
}
