  import 'dart:convert';

import 'package:flutter/material.dart';

import '../../../models/orderDetailModel.dart';

Future<Order> getOrderData(BuildContext context) async {
    final args = ModalRoute.of(context)!.settings.arguments as String;
    await Future.delayed(Duration(seconds: 2));

    // Simulated parsing of JSON data
    final jsonData = '{"order_info":{"id":1,"date":"2023-06-12T09:22:17.876343+05:00","status":"Pending","total_items_qty":2,"address":"Plot R 803 (\'Gulberg Town\', {\'Karachi\'})","total_price":63,"order":12,"distributor":1},"order_item":[{"id":5,"quantity":1,"price":20,"order":12,"cylinder":1},{"id":6,"quantity":1,"price":43,"order":12,"cylinder":2}]}';
    final decodedData = jsonDecode(jsonData) ;
    print(decodedData);
    final order = Order.fromJson(decodedData);

    return order;

  }