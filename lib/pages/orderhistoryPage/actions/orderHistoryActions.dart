 
 import 'dart:convert';

import '../../../models/orderHistory.dart';
import '../../../urls/urls.dart';

fetchOrderHistory() async {
  final response = await getOrderHistory();
  final decoded = jsonDecode(response);

  if (decoded is List<dynamic>) {
    final orderHistoryDataList = decoded
        .map<OrderHistoryData>((data) => OrderHistoryData.fromJson(data))
        .toList();
    return orderHistoryDataList;
  } else {
    // Handle the case where the response is not a list
    return <OrderHistoryData>[];
  }
}

