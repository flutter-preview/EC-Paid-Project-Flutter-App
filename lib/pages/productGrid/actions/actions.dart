import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/models/food_and_category.dart';

import '../../../urls/urls.dart';



getAllProduct (BuildContext context)async{
  await Future.delayed(Duration(seconds: 2));
  final product=await  getAll();
  final decoded=jsonDecode(product);
final   food = decoded['products'] as List<dynamic>;
  // final product2=product.products;
  // final m=product.products;
  // print(food);
  // print(food);
  final products=food.map<Food>((json)=>Food.fromJson(json)).toList();
  // print(products);
  // print(products[0].foodId);
// final store= StorePe
// print(products[0].title+"sdsjhjh");
return products;
}