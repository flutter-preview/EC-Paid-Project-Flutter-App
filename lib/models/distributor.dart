class Distributor {
  int id=-1;
  String name;
  String email="";
  String location;

  Distributor( this.name, this.location,this.email);

  Distributor.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        email = json['email'],
        location = json['location'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'location': location,
      };
}