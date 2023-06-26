import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../models/addressAndPhone.dart';
import '../address_add.dart';

void getUserAddress(
    BuildContext context, AddressAndPhone addressAndPhone) async {
  // Request permission to access the device's location
  var status = await Permission.location.request();
  if (true) {
    try {
      // Get the current position (latitude and longitude)
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      // Reverse geocoding to get the address from latitude and longitude
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      // Extract the home address from the placemark
      String area = placemarks.first.subLocality ?? '';
      String postcode = placemarks.first.postalCode ?? '';
      String houseNo = placemarks.first.street ?? '';
      String city = placemarks.first.locality ?? '';

      // Set the address in the AddressAndPhone object
      addressAndPhone.houseNo = houseNo;
      addressAndPhone.area = area;
      addressAndPhone.postCode = postcode;
      addressAndPhone.city = city;

      // Show the address in the input boxes
      showPlatformDialog(
        context: context,
        builder: (_) => PlatformAlertDialog(
          title:Text( 'Home Address'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Your home address is:'),
              SizedBox(height: 8),
              Text('Flat Number/House Number: ${addressAndPhone.area}'),
              Text('Street: ${addressAndPhone.houseNo}'),
              Text('City: ${addressAndPhone.city}'),
              Text('PostCode: ${addressAndPhone.postCode}'),
            ],
          ),
          actions: [
            PlatformDialogAction(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    } catch (e) {
      showPlatformDialog(
        context: context,
        builder: (_) => PlatformAlertDialog(
          title: Text('Error'),
          content: Text('Failed to retrieve home address. Error: $e'),
          actions: [
            PlatformDialogAction(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  } else {
    showPlatformDialog(
      context: context,
      builder: (_) => PlatformAlertDialog(
        title: Text('Location Permission Denied'),
        content: Text('Please grant permission to access your location.'),
        actions: [
          PlatformDialogAction(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }
}