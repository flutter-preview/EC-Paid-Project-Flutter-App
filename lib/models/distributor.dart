class Distributor {
  int distributorId=-1;
  String name;
  String location;

  Distributor( this.name, this.location);

  Distributor.fromJson(Map<String, dynamic> json)
      : distributorId = json['distributor_id'],
        name = json['name'],
        location = json['location'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'location': location,
      };
}