import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../../../reduxStore/app_state.dart';


class SmallProduct {
  final String image;

  SmallProduct(this.image);
}

List<SmallProduct> smProducts = [
  SmallProduct('https://images.unsplash.com/photo-1546069901-ba9599a7e63c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8Mnx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=400&q=60'),
  SmallProduct('https://images.unsplash.com/photo-1546069901-ba9599a7e63c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8Mnx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=400&q=60'),
  SmallProduct('https://images.unsplash.com/photo-1546069901-ba9599a7e63c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8Mnx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=400&q=60'),
];
// ignore: must_be_immutable
class ProductDetails extends StatelessWidget {
   String title;
   String price;
   String description;
  ProductDetails({super.key, required this.title,required this.price,required this.description});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 40, right: 14, left: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color.fromARGB(122, 158, 158, 158)),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Chanel',
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  '\$$price',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            Text(
              description,
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 15),
            Text(
              'Similar This',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 110,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (context, index) { 
                   final lpg= StoreProvider.of<AppState>(context).state.lpgList[index];
                 return InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, "/productDetail",arguments: lpg.id.toString());
                  },
                   child: Container(
                 
                    margin: const EdgeInsets.only(right: 6),
                    width: 110,
                    height: 110,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Image.network(
                        lpg.image,
                        height: 70,
                      ),
                    ),
                                 ),
                 );}
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

