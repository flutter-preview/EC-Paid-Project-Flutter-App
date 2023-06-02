import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/reduxStore/app_state.dart';
import 'package:flutter_redux/flutter_redux.dart';
import '../../models/cart.dart';
import '../../reduxStore/action.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, dynamic>(
      converter: (store) => store.state.cart,
      builder: (context, cart) {
        // print(cart.food[0].price);
        print(cart.food.length);
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.cyan,
            title: Text('Cart'),
            centerTitle: true,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            actions: [
              IconButton(
                onPressed: () {
                  store.dispatch(CartAction(CartActionType.clearCart));
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
                  itemCount: store.state.cart.food.length,
                  itemBuilder: (context, index) {
                    final item = store.state.cart.food[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
                      child: ListTile(
                        title: Text(
                          '${item.title}  ${cart.getItemCount(item.foodId)})',
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
                            child: Image.network(item.image)),
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
                                  store
                                      .dispatch(CartAction(CartActionType.removeItem, payload: item.foodId));
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
                                  StoreProvider.of<AppState>(context)
                                      .dispatch(CartAction(CartActionType.addItem, payload: item));
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
                // trailing:
                // Text('${cart.getDeliveryCharges().toStringAsFixed(2)} PKR'),
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
                  onPressed: () {
                    Navigator.pushNamed(context, "/qr");
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
