
import 'package:flutter_ecommerce_app/models/distributor.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../urls/urls.dart';

fetchDistributorData() async {
  //aplly delay 
  await Future.delayed(const Duration(seconds: 2));
  final response = await getDistrbutor();

  if (response!=null){
    final data = json.decode(response) as List<dynamic>;
    return data.map<Distributor>((item) => Distributor.fromJson(item)).toList();
  } else {
    throw Exception('Failed to fetch distributor data');
  }
}
