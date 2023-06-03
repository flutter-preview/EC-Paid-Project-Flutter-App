import 'package:flutter/material.dart';

class OrderDetailPage extends StatelessWidget {
  final String orderId;
  final String time;
  final String distributorName;
  final String status;
  final List<ProductItem> products;

  OrderDetailPage({
    String? orderId,
    String? time,
    String? distributorName,
    String? status,
    List<ProductItem>? products,
  })  : orderId = orderId ?? 'ORD-2023-001',
        time = time ?? '2023-06-02 10:30 AM',
        distributorName = distributorName ?? 'ABC Distributors',
        status = status ?? 'Pending',
        products = products ?? [
          ProductItem(productId: 'P1', quantity: 2),
          ProductItem(productId: 'P2', quantity: 3),
          ProductItem(productId: 'P3', quantity: 1),
        ];

  bool get isPending => status.toLowerCase() == 'pending';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Detail'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    offset: Offset(0, 2),
                    blurRadius: 4,
                  ),
                ],
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.blue.shade100,
                    Colors.blue.shade200,
                  ],
                ),
              ),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Order ID: $orderId',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Time: $time',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Distributor: $distributorName',
                      style: TextStyle(fontSize: 18,),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Status: $status',
                      style: TextStyle(
                        fontSize: 16,
                        color: isPending ? Colors.orange : Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    offset: Offset(0, 2),
                    blurRadius: 4,
                  ),
                ],
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.orange.shade100,
                    Colors.orange.shade200,
                  ],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Products:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return ListTile(
                        title: Text('Product ID: ${product.productId}'),
                        subtitle: Text('Quantity: ${product.quantity}'),
                      );
                    },
                  ),
                ],
              ),
            ),
          Expanded(child: SizedBox()),
       Center(
         child: SafeArea(
           child: ElevatedButton(
           onPressed: status.toLowerCase() != 'delivered' ? () {
             // Handle button click event here
           } : null,
           style: ElevatedButton.styleFrom(
             shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(15),
             ),
             elevation: status.toLowerCase() != 'delivered' ? 2 : 0,
           ),
           child: IgnorePointer(
             ignoring: status.toLowerCase() == 'delivered',
             child: Padding(
               padding: const EdgeInsets.symmetric(vertical: 12),
               child: Text(
            'Cancel Order',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
               ),
             ),
           ),
                ),
         ),
       )



          ],
          
        ),
      ),

    );
  }
}

class ProductItem {
  final String productId;
  final int quantity;

  ProductItem({required this.productId, required this.quantity});
}
