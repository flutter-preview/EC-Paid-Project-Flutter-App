
import 'package:flutter/material.dart';

import 'action/addressAction.dart';
import 'address_form.dart';

  class AddressAndPhone{

String street="";
String houseNo="";
String postNo="";
int phone=0;
String address="";
  }


class AddAddressPage extends StatelessWidget {
  final AddressAndPhone addressAndPhone=AddressAndPhone();
  @override
  Widget build(BuildContext context) {
    Widget finishButton = InkWell(
      child: Container(
        height: 80,
        width: MediaQuery.of(context).size.width / 1.5,
        decoration: BoxDecoration(
            // gradient: mainButton,
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.16),
                offset: Offset(0, 5),
                blurRadius: 10.0,
              )
            ],
            borderRadius: BorderRadius.circular(9.0)),
        child: Center(
          child: Text("Finish",
              style: const TextStyle(
                  color: const Color(0xfffefefe),
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.normal,
                  fontSize: 20.0)),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.grey),
        title: TextButton(
          onPressed:(){print("yess");},
          child: Text('Add Address',
          style: const TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.w500,
              fontFamily: "Montserrat",
              fontSize: 18.0),
        ),
      )),
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
                      : MediaQuery.of(context).padding.bottom),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child:Icon(Icons.home)
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
                              ))),
                    ],
                  ),
                  AddAddressForm(addressAndPhone:addressAndPhone),
                  Center(child: ElevatedButton(child: Text("orderDetail"),onPressed: () => {getUserAddress(context)},))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}