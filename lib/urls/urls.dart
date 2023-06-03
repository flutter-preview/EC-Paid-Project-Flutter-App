import 'urlsClass/url_class.dart';

final apiClient = ApiClient(
  baseUrl: "https://dummyjson.com",
  headers: {'Content-Type': 'application/json'},
);
final apiClient2 = ApiClient(
  baseUrl: "https://dummyjson.com",
  headers: {'Content-Type': 'application/json'},
);
getAll()async{
  final a=await apiClient.get('/products?limit=10');
  print(a.body);
  final b=a.body;
  return (b);
}
getOne(id)async{
  final a=await apiClient.get('/products/$id');
  // print(a.body);
  final b=a.body;
  print(b);
  return (b);
}
getSearch(searchItem)async{
final a =await apiClient.get("/products/search?q=$searchItem");
final b=a.body;
return b;
}

login(body) async {
  final response=await apiClient.post("/login", body);
  }
signup(body) async {
  final response=await apiClient.post("/signup", body);
}