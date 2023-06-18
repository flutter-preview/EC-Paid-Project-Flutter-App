// Actions for a single LPG item
import '../pages/addressPage/address_add.dart';
import '../models/addressAndPhone.dart';
import '../models/cart.dart';
import '../models/food_and_category.dart';
import '../models/user.dart';

class SetAddressAndPhoneAction {
  final AddressAndPhone addressAndPhone;

  SetAddressAndPhoneAction(this.addressAndPhone);
}

class SetLPGAction {
  final LPG lpg;

  SetLPGAction(this.lpg);
}

// set address and phone
// Actions for a list of LPG items
class SetLPGListAction {
  final List<LPG> lpgList;

  SetLPGListAction(this.lpgList);
}

// Actions for a user
// class SetUserAction {
//   final User user;

//   SetUserAction(this.user);
// }

enum CartActionType {
  addItem,
  removeItem,
  clearCart,
}

class CartAction {
  final CartActionType type;
  final dynamic payload;

  CartAction(this.type, {this.payload});
}
