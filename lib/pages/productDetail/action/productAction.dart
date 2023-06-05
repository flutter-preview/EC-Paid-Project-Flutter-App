// ignore: file_names
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/urls/urls.dart';

import '../../../models/food_and_category.dart';

productDetailLoad(BuildContext context)async{

  //  final con=Uri.base.pathSegments.last;
  //  print(con);
  final args = ModalRoute.of(context)!.settings.arguments as String;
  await Future.delayed(Duration(seconds: 2));
  final a=await getOne(args);
  final decode=jsonDecode(a);
  final LPG lpg=LPG.fromJson(decode);
  // print(lpg.image+"sjk");
  // final store=StoreProvider.of<AppState>(context);
// final product=store.state.lpg;
// final a=product.map<LPG>((json)=>LPG.fromJson(json));
// LPG.fromJson(product);
return lpg;

}