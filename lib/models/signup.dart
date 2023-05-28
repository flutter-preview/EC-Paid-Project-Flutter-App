class SignupUser {
  String username = '';
  String email = '';
  String password = '';
  String confirmPassword = '';
  String address = '';
SignupUser();
  SignupUser.fromJson(Map<String, dynamic> json)
      : email = json['email'],
        username = json['username'],
        password= json['password'],
        confirmPassword = json['confirmPassword'],
        address = json['address'];

  Map<String, dynamic> toJson() => {
        'email': email,
        'username': username,
        'password': password,
        'address': address,
      };

}
