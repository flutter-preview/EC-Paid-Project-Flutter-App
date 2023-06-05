import 'package:redux/redux.dart';

import '../models/cart.dart';
import '../models/food_and_category.dart';
import '../models/user.dart';
import 'reducer.dart';

// Define the state class that holds the data
class AppState {
  final LPG lpg;
  final List<LPG> lpgList;
  // final User user;
  final Cart cart;

  AppState({required this.lpg, 
  required this.lpgList, 
  
  // required this.user,

  required this.cart});
  factory AppState.initialState()=> AppState(lpg: LPG(1,"",3,"",0), lpgList: [],
   
  //  user: User(-1,"","",""),
   
   cart:Cart());



}

// Combine the reducers


// Create the Redux store
final store = Store<AppState>(
  appReducer,
  initialState: AppState.initialState()
  );
