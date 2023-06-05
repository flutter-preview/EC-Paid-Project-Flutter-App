class SignupUser {
  String username = '';
  String email = '';
  String password = '';
  String confirmPassword = '';
  String address = '';
  int phone =0;
SignupUser();
  SignupUser.fromJson(Map<String, dynamic> json)
      : email = json['email'],
        username = json['username'],
        password= json['password'],
        confirmPassword = json['confirmPassword'],
        phone = json['phone'],
        address = json['address'];

  Map<String, dynamic> toJson() => {
        'email': email,
        'username': username,
        'password1': password,
        'password2': confirmPassword,
        'address': address,
        'phone': phone,
      };

}
