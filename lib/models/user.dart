class User {
  int userId;
  String name;
  String address;
  String phoneNumber;

  User(this.userId, this.name, this.address, this.phoneNumber);

  User.fromJson(Map<String, dynamic> json)
      : userId = json['user_id'],
        name = json['name'],
        address = json['address'],
        phoneNumber = json['phone_number'];

  Map<String, dynamic> toJson() => {
        'user_id': userId,
        'name': name,
        'address': address,
        'phone_number': phoneNumber,
      };
}