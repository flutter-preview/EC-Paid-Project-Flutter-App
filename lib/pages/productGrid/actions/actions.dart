import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/models/food_and_category.dart';

import '../../../urls/urls.dart';

getAllProduct (BuildContext context)async{
  Future.delayed(Duration(seconds: 2));
  final product=await getAll();
  final products=product.map<Food>((json)=>Food.fromJson(json)).loList();
  print(products+"ji");
// final store=StorePe
return products;
}