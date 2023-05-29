// Actions for a single food item
import '../models/food_and_category.dart';
import '../models/user.dart';

class SetFoodAction {
  final Food food;

  SetFoodAction(this.food);
}

// Actions for a list of food items
class SetFoodListAction {
  final List<Food> foodList;

  SetFoodListAction(this.foodList);
}

// Actions for a user
class SetUserAction {
  final User user;

  SetUserAction(this.user);
}
