import 'package:flutter/material.dart';
import 'components/CartData.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  Cart cart = Cart();

  @override
  void initState() {
    super.initState();
    cart.addItem(CartItem(name: 'Item 1', image: 'images/shoe.png', price: 10));
    cart.addItem(CartItem(name: 'Item 2', image: 'images/shoe.png', price: 20));
    cart.addItem(CartItem(
      name: 'Item 1',
      image: 'images/shoe.png',
      price: 10,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text('Cart'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                cart.clearCart();
              });
            },
            icon: Icon(Icons.delete_rounded),
            tooltip: 'Empty the entire cart',
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cart.cartItems.length,
              itemBuilder: (context, index) {
                final item = cart.cartItems[index];
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
                  child: ListTile(
                    title: Text(
                      '${item.name} (${item.quantity})',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    leading: Container(
                        height: 80,
                        width: 80,
                        padding: EdgeInsets.all(4.0),
                        decoration: BoxDecoration(
                          color: Colors.cyan[300],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Image.asset(item.image)),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          margin: EdgeInsets.all(5),
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              color: Colors.cyan[300],
                              borderRadius: BorderRadius.circular(4.0)),
                          child: IconButton(
                            icon: Icon(Icons.remove_circle),
                            color: Colors.white,
                            onPressed: () {
                              setState(() {
                                cart.removeItem(item);
                              });
                            },
                          ),
                        ),
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              color: Colors.cyan[300],
                              borderRadius: BorderRadius.circular(4.0)),
                          child: IconButton(
                            icon: Icon(Icons.add_circle),
                            color: Colors.white,
                            onPressed: () {
                              setState(() {
                                cart.addItem(item);
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          ListTile(
            title: Text('Subtotal'),
            trailing: Text('${cart.getSubtotal().toStringAsFixed(2)} PKR'),
          ),
          ListTile(
            title: Text('Delivery Charges'),
            trailing:
                Text('${cart.getDeliveryCharges().toStringAsFixed(2)} PKR'),
          ),
          ListTile(
            title: Text('Total'),
            trailing: Text('${cart.getTotal().toStringAsFixed(2)} PKR'),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: MaterialButton(
            color: Colors.cyan,
            height: 50,
            minWidth: double.infinity,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            onPressed: () {},
            child: TextButton(
              child: Text(
                'Proceed to Checkout',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              onPressed: (){
                Navigator.pushNamed(context, "/qr");
              },
            ),
          ),
        
        ),
        
      ),
    );
  }
}
