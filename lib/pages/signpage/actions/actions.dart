 import '../../../models/signup.dart';

Function(dynamic value)? getOnChangedFunction(String type,SignupUser user) {
    final fieldMap = {
      'username': (value) => user.username = value,
      'email': (value) => user.email = value,
      'password': (value) => user.password = value,
      'phone': (value) => user.phone =  int.tryParse(value) ?? 0,
      'confirmPassword': (value) => user.confirmPassword = value,
      'address': (value) => user.address = value,
      'last_name': (value) => user.last_name = value,
    };
    return fieldMap[type];
  }