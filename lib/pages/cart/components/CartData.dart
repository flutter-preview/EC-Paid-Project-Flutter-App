import 'package:flutter/material.dart';

class CartItem {
  String name;
  String image;
  int quantity;
  int price;

  CartItem(
      {required this.name,
      required this.image,
      this.quantity = 1,
      this.price = 0});
}

class Cart {
  List<CartItem> cartItems = [];

  void addItem(CartItem item) {
    final existingItemIndex =
        cartItems.indexWhere((cartItem) => cartItem.name == item.name);
    if (existingItemIndex != -1) {
      cartItems[existingItemIndex].quantity++;
    } else {
      cartItems.add(item);
    }
  }

  void removeItem(CartItem item) {
    final existingItemIndex =
        cartItems.indexWhere((cartItem) => cartItem.name == item.name);
    if (existingItemIndex != -1) {
      cartItems[existingItemIndex].quantity--;
      if (cartItems[existingItemIndex].quantity == 0) {
        cartItems.remove(item);
      }
    } else {
      cartItems.remove(item);
    }
  }

  void clearCart() {
    cartItems.clear();
  }

  double getSubtotal() {
    double subtotal = 0;
    for (var item in cartItems) {
      subtotal += item.quantity * item.price;
    }
    return subtotal;
  }

  double getDeliveryCharges() {
    return 5;
  }

  double getTotal() {
    return getSubtotal() + getDeliveryCharges();
  }
}
