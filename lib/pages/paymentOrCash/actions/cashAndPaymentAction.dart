import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/addressPage/address_add.dart';
import 'package:flutter_ecommerce_app/models/distributor.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../models/addressAndPhone.dart';
import '../../../models/cart.dart';
import '../../../urls/urls.dart';

void cashOnDeliveryDialogue(BuildContext context) async{
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Payment'),
          content: Text('Are you sure you want to proceed with Cash on Delivery?'),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Confirm'),
              onPressed: () async{
                String type="COD";
SharedPreferences prefs = await SharedPreferences.getInstance();
String? cartJson = prefs.getString('cart');
String? LpgDistributor = prefs.getString('LpgDistributor');
String? addressAndPhoneJson = prefs.getString('lpgAddress');
   if (cartJson != null && addressAndPhoneJson!=null && LpgDistributor !=null) {
    Map<String, dynamic> cartMap = jsonDecode(cartJson);
    Map<String, dynamic> addressAndPhoneJson1 = jsonDecode(addressAndPhoneJson);
    Map<String, dynamic> LpgDistributor1 = jsonDecode(LpgDistributor);

    Cart cart = Cart.fromJson(cartMap);
    AddressAndPhone addressAndPhone = AddressAndPhone.fromJson(addressAndPhoneJson1);
    Distributor distributor = Distributor.fromJson(LpgDistributor1);
    // print(cart.lpg.length);
    // print(addressAndPhone.area);
sendOrder(cart.lpg, addressAndPhone,type,(distributor.id).toString());

Navigator.of(context).pop();
                Navigator.popAndPushNamed(context, "/orderPlaced");
   }
              },
            ),
          ],
        );
      },
    );
  }
