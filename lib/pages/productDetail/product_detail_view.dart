import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import 'components/bottomnavigation.dart';
import 'components/productImage.dart';
import 'components/product_detail.dart';

class ProductDetailsView extends StatelessWidget {
  ProductDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      backgroundColor: Colors.white,
      appBar: PlatformAppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.adaptive.arrow_back,
            color: Colors.black,
          ),
        ),
        trailingActions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.shopping_bag_outlined,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          ProductImage(),
          Expanded(
            child: Stack(
              children: [
                ProductDetails(),
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    margin: const EdgeInsets.only(top: 10),
                    width: 50,
                    height: 5,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Expanded(child: SizedBox()),
          ProductBottomNavigationBar()
        ],
      ),
      // bottomNavBar: PlatformNavBar(),
    );
  }
}



