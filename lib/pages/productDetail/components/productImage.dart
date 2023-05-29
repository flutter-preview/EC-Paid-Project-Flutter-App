import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
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

      child: Image.network('https://images.unsplash.com/photo-1546069901-ba9599a7e63c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8Mnx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=400&q=60',colorBlendMode: BlendMode.softLight,fit: BoxFit.cover,),
      
    );
  }
}

