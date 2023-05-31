import 'dart:convert';

class Food {
  int foodId=-1;
  int categoryId=-1;
  String title;
  String image;
  double price;

  Food( this.categoryId, this.title, this.price,this.image);

  Food.fromJson(Map<String, dynamic> json)
      : foodId = json['id'],
        // categoryId = json['category_id'],
        title = json['title'],
        image = json['thumbnail'],
        price = json['price'];

  Map<String, dynamic> toJson() => {
        'category_id': categoryId,
        'title': title,
        'price': price,
        'image': price,
      };
}





class Category {
  int categoryId=-1;
  String name;

  Category( this.name);

  Category.fromJson(Map<String, dynamic> json)
      : categoryId = json['category_id'],
        name = json['name'];

  Map<String, dynamic> toJson() => {
        'name': name,
      };
}