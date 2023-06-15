import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/models/food_and_category.dart';

import '../../../urls/urls.dart';



getAllProduct (BuildContext context)async{

 final jsonString = ModalRoute.of(context)?.settings.arguments as String?;
  await Future.delayed(const Duration(seconds: 2));

 if (jsonString != null && jsonString.isNotEmpty) {
  final jsonData = jsonDecode(jsonString);
  final search = jsonData['search'];
  final size = jsonData['size'];
  final price = jsonData['price'];
  print(search);

  final product = await getAll();
  // 
  final decoded = jsonDecode(product);
  // print(decoded);
  if (decoded.length > 1) {
    final food = decoded as List<dynamic>;
    final products = food.map<LPG>((json) => LPG.fromJson(json)).toList();

    // Filter the products based on the search keyword
    final filteredProducts = products.where((product) =>
        product.title.toLowerCase().contains(search.toLowerCase()));
print(filteredProducts.length);
    return filteredProducts.toList();
  }
  if (decoded.length == 1) {
    final product = LPG.fromJson(decoded);

    // Check if the product matches the search keyword
    if (product.title.toLowerCase().contains(search.toLowerCase())) {
      return product;
    } else {
      return null; // No matching product found
    }
  }
}else{
  final product=await  getAll();
  final decoded=jsonDecode(product);
final   food = decoded as List<dynamic>;
  final products=food.map<LPG>((json)=>LPG.fromJson(json)).toList();
return products;
}
//   if(routeArgs != null){
//    final uri = Uri.parse(routeArgs);
//   final search = uri.queryParameters['param1'];


}