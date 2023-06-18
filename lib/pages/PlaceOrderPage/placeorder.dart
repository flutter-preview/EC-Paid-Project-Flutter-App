import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/reduxStore/action.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../reduxStore/app_state.dart';

class OrderPlacedPage extends StatefulWidget {
  @override
  OrderPlacedPageState createState() => OrderPlacedPageState();
}

class OrderPlacedPageState extends State<OrderPlacedPage> {
  @override
  void initState() {
    super.initState();

    // Wait for two seconds and navigate to the other page
    Future.delayed(Duration(seconds: 2), () async {
      // clear cart
      final store = StoreProvider.of<AppState>(context);
      store.dispatch(CartAction(CartActionType.clearCart));
      Navigator.popAndPushNamed(context, "/orderHistory");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Your order has been placed!',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class OtherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Welcome to the Other Page!',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
