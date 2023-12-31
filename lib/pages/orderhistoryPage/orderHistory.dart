import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/urls/urls.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import '../../models/orderHistory.dart';
import '../homePage/components/middleContainer.dart';
import 'actions/orderHistoryActions.dart';

class OrderHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(title: Text("App")),
      body: Column(
        children: [
          GradientContainer(
            text: "Order Detail",
            image:
                "https://www.shutterstock.com/image-vector/wallet-mascot-character-design-vector-1660276741",
          ),
          Expanded(
            child: FutureBuilder(
              future: fetchOrderHistory(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  // Show a loading indicator while waiting for the data
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  // Show an error message if the data fetching failed
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  // Data has been successfully fetched
                  if (snapshot.hasData) {
                    // print(snapshot.data);
                    List<OrderHistoryData> orderHistory =
                        snapshot.data as List<OrderHistoryData>;
                    if (orderHistory.length == 0) {
                      return Center(child: Text("No Data Found"));
                    }
                    // snapshot.data as List<OrderHistoryData>;
                    return ListView.builder(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      itemCount: orderHistory.length,
                      itemBuilder: (context, index) {
                        OrderHistoryData order = orderHistory[index];
                        return Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 255, 255, 255),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.5),
                                offset: Offset(0, 2),
                                blurRadius: 4,
                                spreadRadius: 2,
                              ),
                            ],
                          ),
                          child: ListTile(
                            onTap: () {
                              Navigator.pushNamed(context, '/orderDetail',
                                  arguments: (order.id).toString());
                            },
                            leading: Container(
                              width: 48,
                              height: 48,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.orange.withOpacity(0.5),
                                    offset: Offset(0, 2),
                                    blurRadius: 4,
                                  ),
                                ],
                              ),
                              child: ClipOval(
                                child: Icon(
                                  Icons.shopping_bag,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            title: Text('Order ID: ${order.id}'),
                            subtitle: Text('Status: ${order.status}'),
                            trailing: Text('Qty: ${order.totalItemsQty}'),
                          ),
                        );
                      },
                    );
                  } else {
                    return Center(child: Text("No Data Found"));
                  }
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
