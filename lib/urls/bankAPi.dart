import 'dart:typed_data';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:encrypt/encrypt.dart';




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

  final key1 = 'thisis'; // Provide your key1 value here
  final key2 = 'thisthat'; // Provide your key1 value here
   // Provide your key2 value here

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

    await initiateTransactionRequestAPI(authToken);
  } else {
    final errorMessage = handshakeResponse['ErrorMessage'];
    print('Handshake failed. Error message: $errorMessage');
  }
}

Future<void> initiateTransactionRequestAPI(String authToken) async {
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

  final key1 = 'thisis'; // Provide your key1 value here
  final key2 = 'thisthat'; // Provide your key2 value here

  final requestHash = generateRequestHash(transactionPayload, key1, key2);
  transactionPayload["RequestHash"] = requestHash;

  final headers = {'Content-Type': 'application/json'};

  final response = await http.post(transactionUrl, headers: headers, body: jsonEncode(transactionPayload));

  final transactionResponse = jsonDecode(response.body);

  if (transactionResponse['success'] == 'true') {
    final transactionId = transactionResponse['TransactionId'];
    final transactionStatus = transactionResponse['TransactionStatus'];
    print('Transaction request successful. PaymentId: $transactionId');
    // print('Payment URL: $paymentUrl');
    await initiateTransactionVerificationAPI(transactionId, authToken);
  } else {
    final errorMessage = transactionResponse['ErrorMessage'];
    print('Transaction request failed. Error message: $errorMessage');
  }
}

Future<void> initiateTransactionVerificationAPI(String transactionId, String authToken) async {
  final verificationUrl = Uri.parse('https://sandbox.bankalfalah.com/HS/api/ProcessTran/ProTran');

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
  final key1 = 'thisis'; // Provide your key1 value here
  final key2 = 'thisthat';; // Provide your key2 value here

  final requestHash = generateRequestHash(verificationPayload, key1, key2);
  verificationPayload["RequestHash"] = requestHash;




  final headers = {'Content-Type': 'application/json'};

  final response = await http.post(verificationUrl, headers: headers, body: jsonEncode(verificationPayload));

  final verificationResponse = jsonDecode(response.body);

  if (verificationResponse['success'] == 'true') {
    final verificationStatus = verificationResponse['VerificationStatus'];
    print('Transaction verification successful. Verification status: $verificationStatus');
  } else {
    final errorMessage = verificationResponse['ErrorMessage'];
    print('Transaction verification failed. Error message: $errorMessage');
  
  }}





String generateRequestHash(Map<String, dynamic> payload, String key1, String key2) {
  var mapString = '';

  payload.forEach((key, value) {
    if (value != null && value.toString().isNotEmpty) {
      mapString += '$key=$value&';
    }
  });

  final paddedKey1 = _padOrTruncateKey(key1);
  final paddedKey2 = _padOrTruncateKey(key2);

  final key = Key.fromUtf8(paddedKey1);
  final iv = IV.fromUtf8(paddedKey2);

  final encrypter = Encrypter(AES(key, mode: AESMode.cbc, padding: 'PKCS7'));
  final encrypted = encrypter.encrypt(utf8.encode(mapString.substring(0, mapString.length - 1)) as String, iv: iv);

  final encryptedBase64 = base64.encode(encrypted.bytes);
  return encryptedBase64;
}

String _padOrTruncateKey(String key) {
  final desiredKeyLength = 32; // Use 16, 24, or 32 for AES key lengths of 128, 192, or 256 bits respectively

  if (key.length < desiredKeyLength) {
    // Pad key with zeros to reach the desired length
    return key.padRight(desiredKeyLength, '\x00');
  } else if (key.length > desiredKeyLength) {
    // Truncate key to the desired length
    return key.substring(0, desiredKeyLength);
  }
  return key; // Key is already the desired length
}
