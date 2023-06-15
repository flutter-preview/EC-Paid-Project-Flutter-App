import 'urlsClass/url_class.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

 fun()async{

    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token=prefs.getString("authToken");
    return token;
}

final apiClient3 = ApiClient(

  baseUrl:"https://owaisali246.pythonanywhere.com",
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

    return response.body;

  } else {
    // Handle the case where the token is empty or null
    // return an appropriate value or throw an error
  }
}

  sendOrder(cart,address,type,id) async{
  
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString("authToken");
  if (token != null && token.isNotEmpty) {
     apiClient3.headers["Authorization"]="Token $token";
  }
  print(jsonEncode(address));
  
    final response=await apiClient3.post("/order/",{"cart":cart,"dis_id":int.parse(id),"type":type,"address":address});
    print(response.body);
    return response.body;
  }


sendAddress(address)async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString("authToken");
  if (token != null && token.isNotEmpty) {
     apiClient3.headers["Authorization"]="Token $token";
  }
  print(apiClient3.headers);
final response=await apiClient3.post("/address/",address);
print(response.body);
}
getOne(id) async{
  final id1=int.parse(id);
  final response = await apiClient3.get('/products/$id1');
  print(response.body);
  return response.body;

}

getSearch(search,size,price) async {
  print(search+size+price);
  // final response = await apiClient3.get("/products/search?search=$search&size=$size&price=$price");
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


  return response.body;
}

signup(body) async {
  print(body);
  final response=await apiClient3.post("/dj-rest-auth/registration/", body);

    // Retrieve the value associated with the key 'token'
}

getDistrbutor() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString("authToken");
  if(token!=null && token.isNotEmpty){
    apiClient3.headers["Authorization"]="Token $token";
  }
  final response = await apiClient3.get('/distributor');
  print(response.body);
  return response.body;

}

// make future builder in









// get order history
getOrderHistory() async{
  print("kjk");
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString("authToken");
  if(token!=null && token.isNotEmpty){
    apiClient3.headers["Authorization"]="Token $token";
  }
  final response = await apiClient3.get('/history');
  print(response.body);
return response.body;




}


//get order detail 
getOrderDetail(id)async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString("authToken");
  if(token!=null && token.isNotEmpty){
    apiClient3.headers["Authorization"]="Token $token";
  }

final id1=int.parse(id);
  final response = await apiClient3.get('/order/$id1');
  print(response.body);
  return response.body;


}


// forget pass function 
forgetPass()async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString("authToken");
  if(token!=null && token.isNotEmpty){
    apiClient3.headers["Authorization"]="Token $token";
  }
const email="mohb@gmail.com";
  final response = await apiClient3.post('/dj-rest-auth/password/reset/',{"email":email});
  print(response.body);
   return response.body;

}
getUser()async{
// const email="mohb@gmail.com";
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString("authToken");
  if(token!=null && token.isNotEmpty){
    apiClient3.headers["Authorization"]="Token $token";
  }
  final response = await apiClient3.get('/dj-rest-auth/user/',);
  print(response.body);
   return response.body;

}







//send addresss

login2(body) async {
final response = await apiClient2.post("/HS/api/Tran/DoTran",{
	"ChannelId": "1002",
	"MerchantId": "23063",
	"StoreId": "030678",
	"MerchantHash": "0aFsbiT8uYBQKWZnuLKZtzGNl6kaNW7l7nMQMAEe7qg=",
	"MerchantUsername": "cahaca",
	"MerchantPassword": "caXHKlksZUtvFzk4yqF7CA==",
	"ReturnURL": "http://localhost:8080/#/",
	"Currency": "PKR",
	"AuthToken": "zq0LxSauYpArYk3rHe0If7Sdn6Z+e8Aau80N7IW/Y5Zepea99gh0KRsG0YRu/5kxpX2w0wDOuCPDd7MPNYPY+2BOKbeHKbrPVst7GmTj6uGGqRaG6B4NCX9iYqh428fiyEMkzd7XekE=",
	"TransactionTypeId": "2",
	"TransactionReferenceNumber": "2222",
	"TransactionAmount": "3433",
	"MobileNumber": "03363042666",
	"AccountNumber": "00141004533666",
	"Country": "164",
	"EmailAddress": "owaisali246.soa@gmail.com",
	"RequestHash": "YwHCyfGUusZ47PxxQh/lwY52VPG/rv+DFG9ImfNQIqybt4K+Hjg3puHQLxuDkqn/6fblm/xA6lqwYakzc5bdHbnr03CC0ZXLScHqzEAyehCIGXlywiJZBCd2xYJ4BZAQYFfD3Fp4Vquea9fiqwCw/F7iUY/7o0Qr+lW7RYjHZ/H9QRrIl04mp2cLO+7DPD1QvvQEYQag2hGQ9k7BMYLJ/gTX40ZKtzjp72sqtKnvGQebW+0xKp3ulMILSZMoqGKAf1yoA2ZeariFPon63rkvWfxiQ9FBWadFRKgeejPcZ5aAuiQ2v6Si97TPpdubAQn3RvXTcl3EJz0U1XArtLmyP4gTSWk6swZYCBXe4JNDX5XLvenFuHcfd/pdHdmajMXTvFN+Njs2ruWr5Mfxy0QIYvRFxR9+/tcz6xm3Wa+0c5kS3D7NcVeKYfco6SFphA3YwxTpt47j3daMEgHcAEwkluNkoT36H0iogy3S2Eo7bZmFxHRa/Nym+Lo1rWwA4/8BY3Z7GcDuirB0cWsDCLm3Vi0TYEHYd5y3iM0vQjyBebXY/6yWkL4T6rvFJTEnsvWQ01qzjLGTTB7RXsbOAR8j+tUFLscKJfyQBVkkYMilm0D5psEQCOZGcC+TmzeAUIHZ"
});
  print(response.body);
}
