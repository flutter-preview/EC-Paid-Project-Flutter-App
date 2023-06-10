import 'urlsClass/url_class.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

 fun()async{

    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token=prefs.getString("authToken");
    return token;
}

final apiClient3 = ApiClient(

  baseUrl: "https://04ef-154-81-253-15.ngrok-free.app",
  headers: {'Content-Type': 'application/json'},

);
final apiClient = ApiClient(
  baseUrl: "https://dummyjson.com",
  headers: {'Content-Type': 'application/json'},
);
final apiClient2 = ApiClient(
  baseUrl: "https://sandbox.bankalfalah.com",
  headers: {'Content-Type': 'application/json'},
);
getAll() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString("authToken");

  if (token != null && token.isNotEmpty) {

     apiClient3.headers["Authorization"]="Token $token";

    final response = await apiClient3.get('/products');
    print(response.body);

    final body = response.body;
    return body;
  } else {
    // Handle the case where the token is empty or null
    // return an appropriate value or throw an error
  }
}

  sendCart(cart) async{
  
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString("authToken");
  if (token != null && token.isNotEmpty) {
     apiClient3.headers["Authrization"]="Token $token";
  }
  print(cart.toJson());
    final response=await apiClient3.post("/send_cart/",cart);
print(response.body);
  }

getOne(id) async{
  final id1=int.parse(id);
  final a = await apiClient3.get('/products/$id1');
  print(a.body);
  final b = a.body;
  print(b);
  return (b);
}

getSearch(search,size,price) async {
  print(search+size+price);
  // final a = await apiClient3.get("/products/search?search=$search&size=$size&price=$price");
  // final b = a.body;
  // return b;
}

login(body) async {
  
    SharedPreferences prefs = await SharedPreferences.getInstance();


  final response = await apiClient3.post("/dj-rest-auth/login/", body);
    dynamic jsonData = jsonDecode(response.body);
    print(response);
    String token = jsonData['key'];
    prefs.setString("authToken",token);
    print(prefs.getString('authToken'));

    print(token);
  print(response.body);
}

signup(body) async {
  print(body);
  final response=await apiClient3.post("/dj-rest-auth/registration/", body);

    // Retrieve the value associated with the key 'token'
}






// from django.http import JsonResponse
// from yourapp.models import Product

// def search_products(request):
//     search = request.GET.get('search')
//     size = request.GET.get('size')
//     price = request.GET.get('price')

//     # Construct the initial queryset
//     queryset = Product.objects.all()

//     # Filter the queryset based on the parameters
//     if search:
//         queryset = queryset.filter(name__icontains=search)
//     if size:
//         queryset = queryset.filter(size=size)
//     if price:
//         queryset = queryset.filter(price=price)

//     # Retrieve all products if all parameters are null
//     if not search and not size and not price:
//         queryset = Product.objects.all()

//     # Do something with the filtered queryset
//     # ...

//     # Return a JSON response
//     response_data = {
//         'message': 'Success',
//         'products': list(queryset.values()),
//     }
//     return JsonResponse(response_data)
// }


























login2(body) async {
  final response = await apiClient2.post("/HS/api/Tran/DoTran", {
	"HS_ChannelId": "1002",
	"HS_MerchantId": "23063",
	"HS_StoreId": "030678",
	"HS_ReturnURL": "http://localhost:8080/#/",
	"HS_MerchantHash": "0aFsbiT8uYBQKWZnuLKZtzGNl6kaNW7l7nMQMAEe7qg=",
	"HS_MerchantUsername": "cahaca",
	"HS_MerchantPassword": "caXHKlksZUtvFzk4yqF7CA==",
	"HS_TransactionReferenceNumber": "2",
	"HS_RequestHash": "AiuvyURbFEs9rahFS9j++y4p6JwQ9ZIoQtTT5c/hyTqbfctTjPXX8Adw10MZH1jUVLl96S4omMZYQa9FYfF7ROQhXV3zYH1Py5Am+n0dbTs/fuKhSCv8c5lid5tZo2OIkf6sFIhV8VvjLAUdgCuEzskCma4GsfU1Wg6bdJcQ07zamkcOwDHSkGVL25D/uTHpLnrRqDzRT1IvMLynpYLdezvRnUhxLgD68bLIktXl+fR4BPHh+S3dzGlvCpJbCYbF4Nybohu5KD+clLz/3G8SK+tDddsC1o+8JWAh0wcGpIi0SxT0tRJWHbNunafETy0oZ4BieSIz4HmUA+jzfsZMSPEZGgaSxLN19GNd6t9URq0="
});
  print(response.body);
}
