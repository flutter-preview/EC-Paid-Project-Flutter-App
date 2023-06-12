import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/models/distributor.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'action/mapAction.dart';
// Import the distributor service file

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  GoogleMapController? mapController;
  LatLng? userLocation;
  Distributor? nearestDistributor;

  @override
  void initState() {
    super.initState();
    fetchDistributorData().then((data) {
      print('Fetched distributor data: $data');
      setState(() {
        nearestDistributor = findNearestDistributor(data, userLocation);
        print('Nearest distributor: $nearestDistributor');
      });
      _determinePosition();
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
      body: FutureBuilder<void>(
        future: fetchDistributorData(),
        builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
          if (snapshot.hasData) {
            return _buildMap();
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
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

  Future<void> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw 'Location services are disabled.';
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.deniedForever) {
      throw 'Location permissions are permanently denied, we cannot request permissions.';
    }

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse && permission != LocationPermission.always) {
        throw 'Location permissions are denied (actual value: $permission).';
      }
    }

    Position position = await Geolocator.getCurrentPosition();
    print('User location: ${position.latitude}, ${position.longitude}');
    setState(() {
      userLocation = LatLng(position.latitude, position.longitude);
    });
  }
}

Distributor? findNearestDistributor(List<Distributor> distributors, LatLng? userLocation) {
  if (distributors.isEmpty || userLocation == null) {
    return null;
  }

  LatLng userLatLng = LatLng(userLocation.latitude, userLocation.longitude);
  double minDistance = double.infinity;
  Distributor? nearestDistributor;

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
      nearestDistributor = distributor;
    }
  }

  return nearestDistributor;
}
