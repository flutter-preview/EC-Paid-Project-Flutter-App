import 'package:flutter_ecommerce_app/urls/urls.dart';

class LPG {
  int id = -1;
  int categoryId = -1;
  String title = "";
  int quantity = 1;
  String image = "";
  int price;
  double size=0;
  String description="";

  LPG(
      {this.id = -1,
      this.categoryId = -1,
      this.title = "",
      this.price = 0,
      this.image = '',
      this.quantity = 0});

  LPG.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        description = json['description'],
        size = json['size'],
        title = json['name'],
        image = baseUrl + json["image"],
        price = json['price'];

  Map<String, dynamic> toJson() => {
        // 'category_id': categoryId,
        'name': title,
        'id': id,
        'quantity': quantity,
        'price': price,
        'size': size,
        'description': description,
        'image': image,
      };
}

class Category {
  int categoryId = -1;
  String name;

  Category(this.name);

  Category.fromJson(Map<String, dynamic> json)
      : categoryId = json['category_id'],
        name = json['name'];

  Map<String, dynamic> toJson() => {
        'name': name,
      };
}
