import 'package:flutter/material.dart';
import '../searchBar/searchbar.dart';
import 'components/gird_items.dart';

class GridPage extends StatelessWidget {
  GridPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final itemWidth = (screenWidth - 30) / 2; // Subtracting padding and spacing
    final itemHeight = itemWidth * 1.2; // Adjust the aspect ratio as needed

    return Scaffold(
      appBar: AppBar(
        title: Text('Grid Page'),
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate([
              SearchBar(),
            ]),
          ),
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
                  image:
                      "https://images.unsplash.com/photo-1546069901-ba9599a7e63c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8Mnx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=400&q=60",
                  title: "Item ${index + 1}",
                  price: "10",
                  width: itemWidth,
                  height: itemHeight,
                );
              },
              childCount: 100,
            ),
          ),
        ],
      ),
    );
  }
}
