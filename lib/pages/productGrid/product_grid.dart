import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/pages/productGrid/actions/actions.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import '../../models/food_and_category.dart';
import '../searchBar/searchbar.dart';
import 'components/gird_items.dart';

class GridPage extends StatelessWidget {
  GridPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final itemWidth = (screenWidth - 30) / 2; // Subtracting padding and spacing
    final itemHeight = itemWidth * 1.2; // Adjust the aspect ratio as needed

    return PlatformScaffold(
      backgroundColor: Color.fromARGB(255, 171, 226, 252),
      appBar: PlatformAppBar(
        title: Text('Grid page'),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomSearchBar(),
          Expanded(
            child: FutureBuilder(
              future: getAllProduct(context),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<Food> food = snapshot.data as List<Food>;
                  return CustomScrollView(
                    slivers: [
                      SliverGrid(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: itemWidth / itemHeight,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                        ),
                        delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                            return GridItem(
                              image: food[index].image,
                              title: food[index].title,
                              price: food[index].price.toString(),
                              width: itemWidth,
                              height: itemHeight,
                              id: food[index].foodId,
                            );
                          },
                          childCount: food.length,
                        ),
                      ),
                    ],
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
