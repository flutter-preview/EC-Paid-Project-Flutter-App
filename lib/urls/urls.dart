import 'urlsClass/url_class.dart';

final apiClient = ApiClient(
  baseUrl: "https://dummyjson.com",
  headers: {'Content-Type': 'application/json'},
);
final apiClient2 = ApiClient(
  baseUrl: "https://sandbox.bankalfalah.com",
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

login2() async {
  final response=await apiClient2.post("//HS/api/HSAPI/HSAPI",{
	"HS_ChannelId": "1002",
	"HS_MerchantId": "23063",
	"HS_StoreId": "030678",
	"HS_ReturnURL": "http://localhost:8080/#/",
	"HS_MerchantHash": "0aFsbiT8uYBQKWZnuLKZtzGNl6kaNW7l7nMQMAEe7qg=",
	"HS_MerchantUsername": "cahaca",
	"HS_MerchantPassword": "caXHKlksZUtvFzk4yqF7CA==",
	"HS_TransactionReferenceNumber": "1",
	"HS_RequestHash": "AiuvyURbFEs9rahFS9j++y4p6JwQ9ZIoQtTT5c/hyTqbfctTjPXX8Adw10MZH1jUVLl96S4omMZYQa9FYfF7ROQhXV3zYH1Py5Am+n0dbTs/fuKhSCv8c5lid5tZo2OIkf6sFIhV8VvjLAUdgCuEzskCma4GsfU1Wg6bdJcQ07zamkcOwDHSkGVL25D/uTHpLnrRqDzRT1IvMLynpYLdezvRnUhxLgD68bLIktXl+fR4BPHh+S3dzGlvCpJbCYbF4Nybohu5KD+clLz/3G8SK+tDddsC1o+8JWAh0wcGpIi0SxT0tRJWHbNunafETy0oZ4BieSIz4HmUA+jzfsZMSKjLLWgdp4tH40jMq1jGPKA="
});
  print(response);
  }
login(body) async {

  final response=await apiClient2.post("/login", body);
  }
signup(body) async {
  print(body);
  // final response=await apiClient2.post("/signup", body);
}