import 'food_and_category.dart';

class Cart {
  List<Food> food =[];

  void addItem(Food item) {
      food.add(item);
  }


  void clearCart() {
    food.clear();
  }

  double getSubtotal() {
    double subtotal = 0;
    for (var item in food) {
      subtotal += item.price;
    }
    return subtotal;
  }

  double getDeliveryCharges() {
    return 5;
  }

  double getTotal() {
    return getSubtotal() + getDeliveryCharges();
  }

  int getItemCount(int  id) {
  int count = 0;
  for (var item in food) {
    if (item.foodId == id) {
      count += 1;
    }
  }
  return count;
}
void removeItem(int id) {
  for (int i = food.length - 1; i >= 0; i--) {
    if (food[i].foodId == id) {
      food.removeAt(i);
      break;
    }
  }
}

}
