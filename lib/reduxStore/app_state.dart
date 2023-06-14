import 'package:redux/redux.dart';

import '../addressPage/address_add.dart';
import '../models/cart.dart';
import '../models/food_and_category.dart';
import '../models/user.dart';
import 'reducer.dart';

// Define the state class that holds the data
class AppState {
  final LPG lpg;
  final List<LPG> lpgList;
  // final User user;
  final AddressAndPhone addressAndPhone;
  final Cart cart; 

  AppState({required this.lpg, 
  required this.lpgList, 
  required this.addressAndPhone,
  // required this.user,

  required this.cart});
  factory AppState.initialState()=> AppState(lpg: LPG(), lpgList: [],
   addressAndPhone: AddressAndPhone(),
  //  user: User(-1,"","",""),
   
   cart:  Cart());



}

// Combine the reducers


// Create the Redux store
final store = Store<AppState>(
  appReducer,
  initialState: AppState.initialState()
  );
