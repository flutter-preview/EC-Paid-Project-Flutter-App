import 'package:redux/redux.dart';

import '../models/cart.dart';
import '../models/food_and_category.dart';
import '../models/user.dart';
import 'reducer.dart';

// Define the state class that holds the data
class AppState {
  final Food food;
  final List<Food> foodList;
  // final User user;
  final Cart cart;

  AppState({required this.food, 
  required this.foodList, 
  
  // required this.user,

  required this.cart});
  factory AppState.initialState()=> AppState(food: Food(1,"",3.4,""), foodList: [],
   
  //  user: User(-1,"","",""),
   
   cart:Cart());



}

// Combine the reducers


// Create the Redux store
final store = Store<AppState>(
  appReducer,
  initialState: AppState.initialState()
  );
