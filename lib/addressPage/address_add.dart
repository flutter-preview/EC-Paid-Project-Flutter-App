import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/pages/orderDetailPage/order_detail.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/addressAndPhone.dart';
import '../models/cart.dart';
import '../reduxStore/action.dart';
import '../reduxStore/app_state.dart';
import '../urls/urls.dart';
import 'action/addressAction.dart';
import 'address_form.dart';

class AddAddressPage extends StatefulWidget {
  @override
  _AddAddressPageState createState() => _AddAddressPageState();
}

class _AddAddressPageState extends State<AddAddressPage> {
  final AddressAndPhone addressAndPhone = AddressAndPhone();
  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    Widget finishButton = InkWell(
      child: Container(
        height: 80,
        width: MediaQuery.of(context).size.width / 1.5,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.16),
              offset: Offset(0, 5),
              blurRadius: 10.0,
            )
          ],
          borderRadius: BorderRadius.circular(9.0),
        ),
        child: Center(
          child: Text(
            "Finish",
            style: const TextStyle(
              color: const Color(0xfffefefe),
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.normal,
              fontSize: 20.0,
            ),
          ),
        ),
      ),
    );

    return PlatformScaffold(
      backgroundColor: Colors.grey[100],
      appBar: PlatformAppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.adaptive.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Get Your  Address',
          style: const TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.w500,
            fontFamily: "Montserrat",
            fontSize: 18.0,
          ),
        ),
      ),
      body: LayoutBuilder(
        builder: (_, viewportConstraints) => SingleChildScrollView(
          child: ConstrainedBox(
            constraints:
                BoxConstraints(minHeight: viewportConstraints.maxHeight),
            child: Container(
              padding: EdgeInsets.only(
                left: 16.0,
                right: 16.0,
                bottom: MediaQuery.of(context).padding.bottom == 0
                    ? 20
                    : MediaQuery.of(context).padding.bottom,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Card(
                        margin: EdgeInsets.symmetric(vertical: 8.0),
                        color: Colors.white,
                        elevation: 3,
                        child: SizedBox(
                          height: 100,
                          width: 80,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                InkWell(
                                  onTap: () {
                                    getUserAddress(context, addressAndPhone);
                                  },
                                  child: Icon(Icons.home),
                                ),
                                Text(
                                  'Add New Address',
                                  style: TextStyle(
                                    fontSize: 8,
                                    color: Colors.grey,
                                  ),
                                  textAlign: TextAlign.center,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  AddAddressForm(addressAndPhone: addressAndPhone),
                  Center(
                    child: ElevatedButton(
                      child: Text("orderDetail"),
                      onPressed: () async{
                //  print(await getOrderHistory());
                          // All fields are valid, proceed with sending the address
                        if (addressAndPhone.isValid()) {
                          setState(() {
                            errorMessage = '';
                          });
                          SharedPreferences prefs = await SharedPreferences.getInstance();
                          prefs.setString("lpgAddress",jsonEncode(addressAndPhone.toJson()));
                          Navigator.pushNamed(context, "/map");

                        } else {
                          // Invalid fields, show an error message
                          setState(() {
                            errorMessage =
                                'Please fill all fields correctly and ensure the phone number has 10 digits.';
                          });
                        }
                      },
                    ),
                  ),
                  errorMessage.isNotEmpty
                      ? Container(
                          margin: EdgeInsets.only(bottom: 20),
                          child: Text(
                            errorMessage,
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 16,
                            ),
                          ),
                        )
                      : SizedBox(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
