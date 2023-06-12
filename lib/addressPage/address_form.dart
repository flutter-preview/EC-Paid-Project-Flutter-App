
import 'package:flutter/material.dart';

import 'address_add.dart';

class AddAddressForm extends StatelessWidget {
  final AddressAndPhone addressAndPhone;

  AddAddressForm({required this.addressAndPhone});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 16.0, top: 4.0, bottom: 4.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              color: Colors.white,
            ),
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                labelText: 'Flat Number/House Number',
              ),
              onChanged: (value) {
                addressAndPhone.houseNo = value;
              },
              controller: TextEditingController(text: addressAndPhone.houseNo),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 16.0, top: 4.0, bottom: 4.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              color: Colors.white,
            ),
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                labelText: 'Area',
              ),
              onChanged: (value) {
                addressAndPhone.area = value;
              },
              controller: TextEditingController(text: addressAndPhone.area),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 16.0, top: 4.0, bottom: 4.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              color: Colors.white,
            ),
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                labelText: 'City',
              ),
              onChanged: (value) {
                addressAndPhone.city = value;
              },
              controller: TextEditingController(text: addressAndPhone.city),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 16.0, top: 4.0, bottom: 4.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              color: Colors.white,
            ),
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                labelText: 'Postcode',
              ),
              onChanged: (value) {
                addressAndPhone.postCode = value;
              },
              controller: TextEditingController(text: addressAndPhone.postCode),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 16.0, top: 4.0, bottom: 4.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              color: Colors.white,
            ),
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                labelText: 'Phone',
                prefixText: '+92 ',
              ),
              onChanged: (value) {
                int? parsedValue = int.tryParse(value);
                if (parsedValue != null) {
                  addressAndPhone.phone = parsedValue;
                }
              },
              controller: TextEditingController(text: addressAndPhone.phone.toString()),
            ),
          ),
        ],
      ),
    );
  }
}