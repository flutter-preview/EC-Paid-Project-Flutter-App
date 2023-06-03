 import '../../../models/signup.dart';

Function(dynamic value)? getOnChangedFunction(String type,SignupUser user) {
    final fieldMap = {
      'username': (value) => user.username = value,
      'email': (value) => user.email = value,
      'password': (value) => user.password = value,
      'phone': (value) => user.phone = value,
      'confirmPassword': (value) => user.confirmPassword = value,
      'address': (value) => user.address = value,
    };
    return fieldMap[type];
  }