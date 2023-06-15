import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
        title: Text('Map Page'),
      ),
      body: _buildMap(),
    );
  }

  Widget _buildMap() {
    return GoogleMap(
      initialCameraPosition: CameraPosition(
        target: userLocation ?? LatLng(0, 0),
        zoom: 14.0,
      ),
      onMapCreated: (GoogleMapController controller) {
        setState(() {
          mapController = controller;
        });
      },
      markers: _buildMarkers(),
    );
  }

  Set<Marker> _buildMarkers() {
    if (userLocation == null || nearestDistributor == null) {
      return {};
    }

    final userLatLng = userLocation!;
    final location = LatLng(
      double.parse(nearestDistributor!.location.split(',')[0]),
      double.parse(nearestDistributor!.location.split(',')[1]),
    );

    final distance = Geolocator.distanceBetween(
      userLatLng.latitude,
      userLatLng.longitude,
      location.latitude,
      location.longitude,
    );

    print('Nearest distributor location: $location');
    print('Distance: $distance meters');

    // Add a marker for the nearest distributor
    return {
      Marker(
        markerId: MarkerId('nearestMarker'),
        position: location,
        infoWindow: InfoWindow(
          title: nearestDistributor!.name,
          snippet: 'Distance: ${distance.toStringAsFixed(2)} meters',
        ),
      ),
    };
  }

  Future<void> _getUserLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      setState(() {
        userLocation = LatLng(position.latitude, position.longitude);
      });
      _findNearestDistributor();
    } catch (error) {
      print('Error getting user location: $error');
    }
  }

  void _findNearestDistributor() async {
    if (distributors.isEmpty || userLocation == null) {
      return;
    }

    LatLng userLatLng = LatLng(userLocation!.latitude, userLocation!.longitude);
    double minDistance = double.infinity;
    Distributor? foundDistributor;

    for (Distributor distributor in distributors) {
      LatLng location = LatLng(
        double.parse(distributor.location.split(',')[0]),
        double.parse(distributor.location.split(',')[1]),
      );

      double distance = Geolocator.distanceBetween(
        userLatLng.latitude,
        userLatLng.longitude,
        location.latitude,
        location.longitude,
      );

      if (distance < minDistance) {
        minDistance = distance;
        foundDistributor = distributor;
      }
    }

    setState(() {
      nearestDistributor = foundDistributor;
    });

    if (nearestDistributor != null) {
      await saveNearestDistributor(nearestDistributor!);
    }
  }

  Future<void> saveNearestDistributor(Distributor distributor) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('LpgDistributor', jsonEncode(distributor.toJson()));
  }
}
