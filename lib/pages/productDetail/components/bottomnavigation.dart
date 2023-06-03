import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../../../models/food_and_category.dart';
import '../../../reduxStore/action.dart';
import '../../../reduxStore/app_state.dart';

class ProductBottomNavigationBar extends StatelessWidget {
  final Food food;
  const ProductBottomNavigationBar({super.key,  required this.food});
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState,dynamic>(
      converter: (store) => store.state.cart,
      builder: (context, cart) {

      return Container(
        height: 70,
        color: Colors.white,
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 50,
              height: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey),
              ),
              child: Icon(
                Icons.favorite_border,
                size: 30,
                color: Colors.grey,
              ),
            ),
            SizedBox(width: 20),
            Expanded(
              child: InkWell(
                onTap: (){
                  final bool itemExists = store.state.cart.food.any(
  (item) => item.foodId == food.foodId,
);

  if (itemExists == true) {
    Navigator.of(context).pushNamed("/cart");
  } else {
    // Item does not exist in the cart, add it and navigate to the cart page
    store.dispatch(CartAction(CartActionType.addItem, payload: food));
    Navigator.of(context).pushNamed("/cart");
  }
                },
              child:Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  '+ Add to Cart',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),),
            ),
          ],
        ),);
        }
      );
  }
}
