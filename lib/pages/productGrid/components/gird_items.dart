import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/urls/urls.dart';

import '../../../models/food_and_category.dart';

class GridItem extends StatelessWidget {
 final LPG lpg;
  final double width;
  final double height;

  const GridItem({
    super.key,
    required this.width,
    required this.height,
    required this.lpg,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //  final a =await getOne(id);
        // final store=StoreProvider.of<AppState>(context);
        Navigator.of(context)
            .pushNamed("/productDetail", arguments: lpg.id.toString());
        // store.dispatch(setFood());
      },
      child: Container(
        width:
            width, // Reduce width by twice the margin value (13 pixels on each side)
        height: height -
            26, // Reduce height by twice the margin value (13 pixels on each side)
        margin: EdgeInsets.symmetric(vertical: 13),
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 244, 244, 244),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.black12,
                  blurRadius: 2,
                  spreadRadius: 2,
                  offset: Offset(3, 3))
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              child: Image.network(
                lpg.image,
                width: width,
                isAntiAlias:
                    true, // Adjust the width of the image to fit within the container
                height: (height - 26) *
                    0.6, // Adjust the height of the image to fit within the container
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    lpg.title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    '\$${lpg.price}',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
