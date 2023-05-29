import 'urlsClass/url_class.dart';

final apiClient = ApiClient(
  baseUrl: "https://dummyjson.com",
  headers: {'Content-Type': 'application/json'},
);
getAll()async{
  final a=await apiClient.get('/product');
  // print(a.body);
  return a.body;
}