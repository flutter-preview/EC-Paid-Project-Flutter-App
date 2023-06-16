import 'package:encrypt/encrypt.dart';
import 'urlsClass/url_class.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'dart:async';

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



getOffer()async{
  final res=await apiClient3.get('/offers');
  print(res.body);

}





//send addresss



// Function to initiate handshake
 initiateHandshake() async {
  final url = Uri.parse('/HS/api/HSAPI/HSAPI');

  final encryptionKey = Key.fromUtf8('your_encryption_key');
  final iv = IV.fromLength(16);
  final encrypter = Encrypter(AES(encryptionKey, mode: AESMode.cbc));

  final requestData = {
    'HS_ChannelId': '1002',
    'HS_MerchantId': '197',
    'HS_StoreId': '000001',
    'HS_ReturnURL': 'http://sample.com/SamplePage',
    'HS_MerchantHash': '0aFsbiT8uYBQKWZnuLKZtzGNl6kaNW7l7nMQMAEe7qg=',
    'HS_MerchantUsername': 'cahaca',
    'HS_MerchantPassword': 'caXHKlksZUtvFzk4yqF7CA==',
    'HS_TransactionReferenceNumber': 'a100',
    'HS_RequestHash': 'BgfY8+t5rCC+oXhl5mrLuJ434+kb+76t6Ju6w1gXPvjWNjHMIltfC4N1M26WWVZrElutixOLePTwqarYEMOiDRxkMMXuEQRHSE2GFxgtmMYez1YQRa5kCsvsOU4GlRUqElv+BgLkA6uFNWAhqSg5Sq7IR59rnKk2MngAUF+6NO3aMkNEx4FtoxjwADfSa2EIFHYdBq5Vxi1DTIa0zfz1OCfB54wB52RvV49wrNcgfSn0FfK1bC5NkjjGf9UYCjd6BsjuMCLDaN8Fj/gtgI34kCZzP4PKPKI9pqCMOgy3mnkaBDrvn73f3GUTvms95EyV1ZL1pcz1gxjb7r4pfXOhztWtX28TbtLTCP4HuePdXGAEbzlNrorUDJHvQ3MBXkj8dPQRQA1gANNe2JIgq601lwDIadR7tBybf5M/mh846bP7y/hv/KeEx6UBjA9w8sKnsE5LCwqSNGYsnGd6zdJMFA==',
  };

  final encryptedData = encrypter.encrypt(jsonEncode(requestData), iv: iv);
  final encryptedBase64 = base64.encode(encryptedData.bytes);

  final response = await apiClient2.post("/HS/api/HSAPI/HSAPI", {"body": {'data': encryptedBase64}});

  final encryptedResponse = base64.decode(response.body);
  final decryptedResponse = encrypter.decrypt64(encryptedResponse as String, iv: iv);
  final jsonResponse = jsonDecode(decryptedResponse);

  if (jsonResponse['success'] == 'true') {
    final transactionId = jsonResponse['TransactionId'];

    // Proceed with the next API calls or operations
    // ...
  } else {
    final errorMessage = jsonResponse['ErrorMessage'];
    print('Error: $errorMessage');
  }
}

// Function to initiate transaction
 initiateTransaction() async {
  final url = Uri.parse('https://sandbox.bankalfalah.com/API/Transaction/Initiate');

  final encryptionKey = Key.fromUtf8('your_encryption_key');
  final iv = IV.fromLength(16);
  final encrypter = Encrypter(AES(encryptionKey, mode: AESMode.cbc));

  final requestData = {
    'MerchantUsername': 'cahaca',
    'AuthToken': '9b23e9b6-af76-4a32-a2bb-d4d29af5ccdd',
    'Amount': '100.00',
    'Currency': 'PKR',
    'TransactionReferenceNumber': 'a100',
    'RequestHash': 'BUjB0XpZFn1AdRZmShLyc1CzmM1mdrGeL2BZDBzgWfSZW55yItq1i+hrmy+ztSSSnfX2sEf+TKyhlTw5B/9EXKnLMng1tZTN',
  };

  final encryptedData = encrypter.encrypt(jsonEncode(requestData), iv: iv);
  final encryptedBase64 = base64.encode(encryptedData.bytes);

  final response = await apiClient2.post("/API/Transaction/Initiate", {"body": {'data': encryptedBase64}});

  final encryptedResponse = base64.decode(response.body);
  final decryptedResponse = encrypter.decrypt64(encryptedResponse as String, iv: iv);
  final jsonResponse = jsonDecode(decryptedResponse);

  if (jsonResponse['success'] == 'true') {
    final transactionId = jsonResponse['TransactionId'];

    // Proceed with the next API calls or operations
    // ...
  } else {
    final errorMessage = jsonResponse['ErrorMessage'];
    print('Error: $errorMessage');
  }
}

// Call the functions to test the APIs

