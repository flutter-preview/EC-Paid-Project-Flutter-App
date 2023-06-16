import 'package:flutter/material.dart';

class OrderPlacedPage extends StatefulWidget {
  @override
  OrderPlacedPageState createState() => OrderPlacedPageState();
}

class OrderPlacedPageState extends State<OrderPlacedPage> {
  @override
  void initState() {
    super.initState();
    
    // Wait for two seconds and navigate to the other page
    Future.delayed(Duration(seconds: 2), () {
      Navigator.popAndPushNamed(
        context,
        "/orderHistory"
      );
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

