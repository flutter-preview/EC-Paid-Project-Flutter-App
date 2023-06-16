import 'dart:typed_data';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:encrypt/encrypt.dart';
import 'package:pointycastle/export.dart' as pointycastle;
import 'dart:math';

Future<void> initiateHandshakeAPI() async {
  final handshakeUrl = Uri.parse('https://sandbox.bankalfalah.com/HS/api/HSAPI/HSAPI');
  final handshakePayload = {
    "HS_ChannelId": "1002",
    "HS_MerchantId": "23063",
    "HS_StoreId": "030678",
    "HS_ReturnURL": "http://127.0.0.1:3000/",
    "HS_MerchantHash": "zWsOsg0VNuC82S3w1/nOQq5y6u+PizCOIRxBaFOv2Uw=",
    "HS_MerchantUsername": "erenet",
    "HS_MerchantPassword": "wH4Lea3Q3VtvFzk4yqF7CA==",
    "HS_TransactionReferenceNumber": "1",
  };

  final key1 = generateRandomKey(16); // Generate a random 128-bit (16-byte) key
  final key2 = generateRandomKey(32); // Generate a random 256-bit (32-byte) key

  final requestHash = generateRequestHash(handshakePayload, key1, key2);
  handshakePayload["HS_RequestHash"] = requestHash;

  final headers = {'Content-Type': 'application/json'};

  final response = await http.post(handshakeUrl, headers: headers, body: jsonEncode(handshakePayload));

  final handshakeResponse = jsonDecode(response.body);

  if (handshakeResponse['success'] == 'true') {
    final authToken = handshakeResponse['AuthToken'];
    final returnUrl = handshakeResponse['ReturnURL'];
    print('Handshake successful. AuthToken: $authToken');
    print('Return URL: $returnUrl');

    await initiateTransactionRequestAPI(authToken, key1, key2);
  } else {
    final errorMessage = handshakeResponse['ErrorMessage'];
    print('Handshake failed. Error message: $errorMessage');
  }
}

Future<void> initiateTransactionRequestAPI(String authToken, Uint8List key1, Uint8List key2) async {
  final transactionUrl = Uri.parse('https://sandbox.bankalfalah.com/HS/api/Tran/DoTran');

  final transactionPayload = {
    "ChannelId": "1002",
    "MerchantId": "23063",
    "StoreId": "030678",
    "MerchantHash": "zWsOsg0VNuC82S3w1/nOQq5y6u+PizCOIRxBaFOv2Uw=",
    "MerchantUsername": "erenet",
    "MerchantPassword": "wH4Lea3Q3VtvFzk4yqF7CA==",
    "ReturnURL": "http://127.0.0.1:3000/",
    "Currency": "PKR",
    "AuthToken": authToken,
    "TransactionTypeId": "2",
    "TransactionReferenceNumber": "1",
    "TransactionAmount": "1000",
    "MobileNumber": "03363042666",
    "AccountNumber": "00141004533666",
    "Country": "164",
    "EmailAddress": "owaisali246.soa@gmail.com",
  };

  final requestHash = generateRequestHash(transactionPayload, key1, key2);
  transactionPayload["RequestHash"] = requestHash;

  final headers = {'Content-Type': 'application/json'};

  final response = await http.post(transactionUrl, headers: headers, body: jsonEncode(transactionPayload));

  final transactionResponse = jsonDecode(response.body);

  if (transactionResponse['success'] == 'true') {
    final transactionId = transactionResponse['TransactionId'];
    final transactionStatus = transactionResponse['TransactionStatus'];
    print('Transaction request successful. PaymentId: $transactionId');
    await initiateTransactionVerificationAPI(transactionId, authToken, key1, key2);
  } else {
    final errorMessage = transactionResponse['ErrorMessage'];
    print('Transaction request failed. Error message: $errorMessage');
  }
}

Future<void> initiateTransactionVerificationAPI(String transactionId, String authToken, Uint8List key1, Uint8List key2) async {
  final verificationUrl = Uri.parse(': https://sandbox.bankalfalah.com/HS/api/ProcessTran/ProTran');

  final verificationPayload = {
    "ChannelId": "1002",
    "MerchantId": "23063",
    "StoreId": "030678",
    "MerchantHash": "zWsOsg0VNuC82S3w1/nOQq5y6u+PizCOIRxBaFOv2Uw=",
    "MerchantUsername": "erenet",
    "MerchantPassword": "wH4Lea3Q3VtvFzk4yqF7CA==",
    "ReturnURL": "http://127.0.0.1:3000/",
    "Currency": "PKR",
    "AuthToken": authToken,
    "TransactionTypeId": transactionId,
    "TransactionReferenceNumber": "1",
    "SMSOTAC": "12341234",
    "EmailOTAC": "1234",
    "SMSOTP": "1234",
    "HashKey": "",
    "RequestHash": "hdSXenGO5pyIEUiq1en9EyFC6AKJZKB9d7H+cHm9R8/66PsqAYttY4EGAKZiGpECZx0TXwLFyrFFjSw7hfcOUc5yyktsSgwD78vJWCMBLNR4O+OzVQaIlKE+OUYEK0s8jt+rBlW6k7AufYb6EqdqSZ8zJuRSIElDURnjWFuyT9A6QAKKPGw7LVMxlcJDlehz3RRhMKKy5jq382nJud8yWHfmecgain+GGPxMHqWW6mE0H5MXcdibRUE7+VX5U/F3wZuQrxXyBBqiTN3FX+LBGT0Fqhs9ayHX/Tyy6p2JMk0NvEIgBGaTeEK2gWb3Ez6ThlUXbvCXKbDmeW16eUJVn/gmyzL+hBnguJXG02RuP2lGl6PAcL//KGKwAdMzbyp7s5LWWDcXdobrKXJ6edSOPtU6Lp5D6MiWBTEJ7/kXX1yJljGO1W1X4JBDqE5mHHlP"
  };

  final requestHash = generateRequestHash(verificationPayload, key1, key2);
  verificationPayload["RequestHash"] = requestHash;

  final headers = {'Content-Type': 'application/json'};

  final response = await http.post(verificationUrl, headers: headers, body: jsonEncode(verificationPayload));

  final verificationResponse = jsonDecode(response.body);

  if (verificationResponse['success'] == 'true') {
    final transactionStatus = verificationResponse['TransactionStatus'];
    print('Transaction verification successful. Transaction status: $transactionStatus');
  } else {
    final errorMessage = verificationResponse['ErrorMessage'];
    print('Transaction verification failed. Error message: $errorMessage');
  }
}

Uint8List generateRandomKey(int length) {
  final random = Random.secure();
  final key = Uint8List(length);
  for (var i = 0; i < length; i++) {
    key[i] = random.nextInt(256);
  }
  return key;
}

String generateRequestHash(Map<String, dynamic> payload, Uint8List key1, Uint8List key2) {
  final plainText = jsonEncode(payload);

  final cipherText = Encrypter(
    AES(Key(key1), mode: AESMode.ecb, padding: 'PKCS7'),
  ).encrypt(plainText, iv: IV(key2));

  final hash = pointycastle.SHA256Digest();
  final requestHashBytes = pointycastle.HMac(hash, key2 as int).process(utf8.encode(cipherText.base64));
  final requestHash = base64.encode(requestHashBytes);

  return requestHash;
}


