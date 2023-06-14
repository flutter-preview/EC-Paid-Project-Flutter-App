
import 'dart:convert';
import 'package:flutter/material.dart';

import '../../models/orderDetailModel.dart';
import 'action/orderDetailAction.dart';

class OrderDetailPage extends StatelessWidget {
  OrderDetailPage({super.key,required String arguments});
    // Fetch the order data from an API or any other source
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Detail'),
      ),
      body: FutureBuilder<Order>(
        future: getOrderData(context),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } 
          else if (snapshot.hasError) {
            return Center(
            child: Text('Error loading order data ${snapshot.error}'),
            );
          } 
          else if (snapshot.hasData) {
            final order = snapshot.data!;
            return ListView(
              children: [
                ListTile(
                  title: Text('Order ID: ${order.orderInfo.id}'),
                ),
                ListTile(
                  title: Text('Time: ${order.orderInfo.date}'),
                ),
                ListTile(
                  title: Text('Distributor: ${order.orderInfo.distributor}'),
                ),
                ListTile(
                  title: Text('Status: ${order.orderInfo.status}'),
                ),
                ListTile(
                  title: Text('Address: ${order.orderInfo.address}'),
                ),
                ListTile(
                  title: Text('Total Items Qty: ${order.orderInfo.totalItemsQty}'),
                ),
                ListTile(
                  title: Text('Total Price: ${order.orderInfo.totalPrice}'),
                ),
                ListTile(
                  title: Text('Order Items:'),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: order.orderItems.length,
                  itemBuilder: (context, index) {
                    final item = order.orderItems[index];
                    return ListTile(
                      title: Text('Product ID: ${item.id}'),
                      subtitle: Text('Quantity: ${item.quantity}'),
                    );
                  },
                ),
              ],
            );
          } else {
            return Center(
              child: Text('No order data found'),
            );
          }
        },
      ),
    );
  }
}