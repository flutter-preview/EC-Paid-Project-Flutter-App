import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../urls/urls.dart';

Future<List<String>> fetchImageList() async {
  // Replace with your API endpoint URL

  try {
    final response = await getCrousel();
      final jsonResponse = jsonDecode(response);
      final List<String> imageList = jsonResponse
        .map<String>((item) => item['image'].toString())
        .toList();

    return imageList;
    
  } catch (error) {
    throw Exception('Error: Something Went Wrong!');
  }
}
