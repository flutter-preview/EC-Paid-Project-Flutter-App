import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/models/food_and_category.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import '../../../reduxStore/action.dart';
import '../../../reduxStore/app_state.dart';
import '../../../urls/urls.dart';

Future<dynamic> getAllProduct(BuildContext context) async {
  final Store<AppState> store = StoreProvider.of<AppState>(context);
  final List<LPG> storedProducts = store.state.lpgList;

  final jsonString = ModalRoute.of(context)?.settings.arguments as String?;
  await Future.delayed(const Duration(seconds: 2));

  if (jsonString != null && jsonString.isNotEmpty) {
    final jsonData = jsonDecode(jsonString);
    final search = jsonData['search'];
    final size = jsonData['size'];
    final price = jsonData['price'];

    if (search != null && storedProducts.isNotEmpty) {
      // Return filtered products from the store
      final filteredProducts = storedProducts
          .where((product) =>
              product.title.toLowerCase().contains(search.toLowerCase()))
          .toList();

      return filteredProducts;
    } else {
      final product = await getAll();
      final decoded = jsonDecode(product);

      if (decoded.length > 1) {
        final food = decoded as List<dynamic>;
        final products =
            food.map<LPG>((json) => LPG.fromJson(json)).toList();

        // Update the store with all the products
        store.dispatch(SetLPGListAction(products));

        if (search != null) {
          // Filter the products based on the search keyword
          final filteredProducts = products.where((product) =>
              product.title.toLowerCase().contains(search.toLowerCase()));

          return filteredProducts.toList();
        } else {
          return products;
        }
      }
      if (decoded.length == 1) {
        final product = LPG.fromJson(decoded);

        // Check if the product matches the search keyword
        if (search != null &&
            product.title.toLowerCase().contains(search.toLowerCase())) {
          // Update the store with the single matching product
          store.dispatch(SetLPGListAction([product]));

          return product;
        } else {
          return null; // No matching product found
        }
      }
    }
  } else {
    if (storedProducts.isNotEmpty) {
      // Return data from the store if available and no search query
      return storedProducts;
    } else {
      final product = await getAll();
      final decoded = jsonDecode(product);
      final food = decoded as List<dynamic>;
      final products =
          food.map<LPG>((json) => LPG.fromJson(json)).toList();

      // Update the store with all the products
      store.dispatch(SetLPGListAction(products));

      return products;
    }
  }
}
