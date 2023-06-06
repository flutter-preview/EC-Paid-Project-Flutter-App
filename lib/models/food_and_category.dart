
class LPG {
  int id=-1;
  int categoryId=-1;
  String title="";
  int  quantity=0;
  String image="";
  int price;

  LPG( {this.id=-1,this.categoryId=-1, this.title="", this.price=0,this.image='',this.quantity=0});

  LPG.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        // categoryId = json['category_id'],
        title = json['title'],
        image = json['thumbnail'],
        price = json['price'];

  Map<String, dynamic> toJson() => {
        // 'category_id': categoryId,
        'title': title,
        'id': id,
        'quantity': quantity,
        'price': price,
        'thumbnail': image,
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