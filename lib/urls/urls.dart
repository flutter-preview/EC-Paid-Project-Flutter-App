import 'urlsClass/url_class.dart';

final apiClient = ApiClient(
  baseUrl: "https://dummyjson.com",
  headers: {'Content-Type': 'application/json'},
);
final apiClient2 = ApiClient(
  baseUrl: "https://sandbox.bankalfalah.com",
  headers: {'Content-Type': 'application/json'},
);
getAll() async {
  final a = await apiClient.get('/products?limit=10');
  print(a.body);
  final b = a.body;
  return (b);
}

getOne(id) async {
  final a = await apiClient.get('/products/$id');
  // print(a.body);
  final b = a.body;
  print(b);
  return (b);
}

getSearch(searchItem) async {
  final a = await apiClient.get("/products/search?q=$searchItem");
  final b = a.body;
  return b;
}

login2() async {
  final response = await apiClient2.post("/HS/api/Tran/DoTran", {
    "ChannelId": "1002",
    "MerchantId": "23063",
    "StoreId": "030678",
    "MerchantHash": "0aFsbiT8uYBQKWZnuLKZtzGNl6kaNW7l7nMQMAEe7qg=",
    "MerchantUsername": "cahaca",
    "MerchantPassword": "caXHKlksZUtvFzk4yqF7CA==",
    "ReturnURL": "http://localhost:8080/#/",
    "Currency": "PKR",
    "AuthToken":
        "b1rPU6Gl+Q1/8pZgEzlwUiA05IxPeWMu9sPUi5hXv70wzVFCR15zMlhGaXKIXhn5KYEbUJIbGT00AbqV9CXly63kRmWyV43bQsEanbC6Ke5nENkZ6LpSdk+cBGbjsBttobb1PfMojAQ=",
    "TransactionTypeId": "2",
    "TransactionReferenceNumber": "1",
    "TransactionAmount": "1000",
    "MobileNumber": "03363042666",
    "AccountNumber": "933503363042666",
    "Country": "164",
    "EmailAddress": "owaisali246.soa@gmail.com",
    "RequestHash":
        "YwHCyfGUusZ47PxxQh/lwY52VPG/rv+DFG9ImfNQIqybt4K+Hjg3puHQLxuDkqn/6fblm/xA6lqwYakzc5bdHbnr03CC0ZXLScHqzEAyehCIGXlywiJZBCd2xYJ4BZAQYFfD3Fp4Vquea9fiqwCw/F7iUY/7o0Qr+lW7RYjHZ/H9QRrIl04mp2cLO+7DPD1QvvQEYQag2hGQ9k7BMYLJ/gTX40ZKtzjp72sqtKnvGQebW+0xKp3ulMILSZMoqGKAf1yoA2ZeariFPon63rkvWfxiQ9FBWadFRKgeejPcZ5b4irTY6RMXXljWu/r+ztTBU8KFKOzUv3zTYTSqKTc5VdCsESksstxIVqiDeM0xzPWTeUQv9RdnSIJrS7jZd8NL4O14vZn3zSqYrnZH6u7h3O5K7BmjQ+8TF4fNsTRbTnTruPZjlAYtRr87Sr1ugjx+MJKErtPjek9jG4axBJG/Ctsq0w56hLoYdSlgbOucgkmIdlQNoVAkqpboiJLYnoGTTCY8QQomwz9a9xGkEhNv4wAK4eAHt35UH6EabiUZzNvwQus9iyqMKOsD15kqpM33TepNLsS7OdQtVwOtoVAkXKbXWwQbrauVllb4sbz8kVDsldBxKP+ftJFvJ+QbuwQO"
  });
  print(response.body);
}

login(body) async {
  final response = await apiClient2.post("/login", body);
}

signup(body) async {
  print(body);
  // final response=await apiClient2.post("/signup", body);
}
