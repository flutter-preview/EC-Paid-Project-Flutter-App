import 'package:flutter/material.dart';

import 'address_add.dart';


class AddAddressForm extends StatelessWidget {
  AddressAndPhone addressAndPhone;
  AddAddressForm({super.key,required this.addressAndPhone});

  
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
                  border: InputBorder.none, hintText: 'Flat Number/House Number'),
                  onChanged: (value){
                    addressAndPhone.address=value;
                  },
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 16.0, top: 4.0, bottom: 4.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              color: Colors.white,
            ),
            child: TextField(
              decoration:
                  InputDecoration(border: InputBorder.none, hintText: 'phone'),
            onChanged:(value){
int? a= int.tryParse(value);
if(a!=null){
  addressAndPhone.phone=a;
}

            }
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Area',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5), topRight: Radius.circular(5)),
                child: Container(
                  padding: EdgeInsets.only(left: 16.0, top: 4.0, bottom: 4.0),
                  decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: Colors.lightBlue, width: 2)),
                    color: Colors.lightBlue,
                  ),
                  child: TextField(
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Name on card',
                      hintStyle:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Checkbox(
                value: true,
                onChanged: (_) {},
              ),
              Text('Add this to address bookmark')
            ],
          )
        ],
      ),
    );
  }
}