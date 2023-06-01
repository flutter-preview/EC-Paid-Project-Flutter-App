import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  final String image;
  const ProductImage({Key? key,required this.image}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
       color: Color.fromARGB(41, 64, 195, 255),
      boxShadow: [
        BoxShadow(color: Colors.black12,spreadRadius: 5,blurRadius: 5,blurStyle: BlurStyle.outer)
      ]),
      height: MediaQuery.of(context).size.height * 0.35,
      padding: const EdgeInsets.only(bottom: 30),
      width: double.infinity,

      child: Image.network(image,colorBlendMode: BlendMode.softLight,fit: BoxFit.cover,),
      
    );
  }
}

