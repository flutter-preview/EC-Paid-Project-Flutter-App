import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/pages/distributorsPage/distributor.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:permission_handler/permission_handler.dart';

import '../models/distributor.dart';
import 'action/mapAction.dart';



class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  GoogleMapController? mapController;
  LatLng? userLocation;
  Distributor? nearestDistributor;
  List<Distributor> nearestDistributors = [];
  List<Distributor> distributors = [];

  @override
  void initState() {
    super.initState();
    fetchDistributorData().then((data) {
      print('Fetched distributor data: $data');
      setState(() {
        distributors = data;
      });
      _getUserLocation();
    }).catchError((error) {
      print('Error fetching distributor data: $error');
    });
  }

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: Text('Select Distributor'),
      ),
      body: _buildMap(),
    );
  }

  Widget _buildMap() {
    if (userLocation == null) {
      return Center(
        child: PlatformCircularProgressIndicator(),
      );
    }
    return GoogleMap(
      initialCameraPosition: CameraPosition(
        target: userLocation!,
        zoom: 10.0,

      ),
      // liteModeEnabled: true
      // ,
      myLocationEnabled: true,
      
      onMapCreated: (GoogleMapController controller) {
        setState(() {
          mapController = controller;
        });
      },
      markers: _buildMarkers(),
    );
  }

  Set<Marker> _buildMarkers() {

    if (userLocation == null || nearestDistributors.isEmpty) {
      return {};
    }

    final userLatLng = userLocation!;
    final markers = <Marker>{};

    for (Distributor distributor in nearestDistributors) {
      final location = LatLng(
        double.parse(distributor.location.split(',')[0]),
        double.parse(distributor.location.split(',')[1]),
      );

      final distance = Geolocator.distanceBetween(
        userLatLng.latitude,
        userLatLng.longitude,
        location.latitude,
        location.longitude,
      );

      distributor.distance = distance;

      print('Distributor location: $location');
      print('Distributor distance: ${distributor.distance}');
      // print('Distance: $distance meters');

      markers.add(
        Marker(

onTap: () {
onDistributorTap(distributor);
Navigator.pushNamed(context, "/paymentOrCash");
},

          markerId: MarkerId(distributor.name),
          position: location,
          infoWindow: 
          InfoWindow(
            title: distributor.name,
            snippet: 'Distance: ${distance.toStringAsFixed(2)} meters',
onTap: (){
  onDistributorTap(distributor);
Navigator.pushNamed(context, "/paymentOrCash");
},
          ),
        ),
      );
    }

if (mapController != null && markers.isNotEmpty) {
    mapController!.showMarkerInfoWindow(markers.first.markerId);
  }
    return markers;
  }

  Future<void> _getUserLocation() async {
    try {
      PermissionStatus status = await Permission.location.request();
      if (status.isGranted) {
        Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high,
        );
        setState(() {
          userLocation = LatLng(position.latitude, position.longitude);
        });
        _findNearestDistributors();
      } else {
        // Handle case when location permission is not granted
      }
    } catch (error) {
      print('Error getting user location: $error');
    }
  }

  Future<void> _findNearestDistributors() async {
    if (distributors.isEmpty || userLocation == null) {
      return;
    }

    LatLng userLatLng = LatLng(userLocation!.latitude, userLocation!.longitude);
    int limit = 3; // Number of nearest distributors to fetch

    List<Distributor> updatedDistributors = List.from(distributors); // Create a copy of the distributors list

    for (int i = 0; i < updatedDistributors.length; i++) {
      Distributor distributor = updatedDistributors[i];

      double distance = Geolocator.distanceBetween(
        userLatLng.latitude,
        userLatLng.longitude,
        double.parse(distributor.location.split(',')[0]),
        double.parse(distributor.location.split(',')[1]),
      );

      distributor.distance = distance;
    }

    updatedDistributors.sort((a, b) => a.distance.compareTo(b.distance));

    setState(() {
      nearestDistributors = updatedDistributors.take(limit).toList();
    });

    await saveNearestDistributors(nearestDistributors); // Save the updated distributors to local storage
  }

  Future<void> saveNearestDistributors(List<Distributor> distributors) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print(distributors[0].distance);
    List<String> encodedDistributors = distributors.map((distributor) => jsonEncode(distributor.toJson())).toList();
    await prefs.setStringList('LpgDistributors', encodedDistributors);
  }
}

