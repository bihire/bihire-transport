import 'dart:async';
import 'package:flutter/services.dart';

import 'package:location/location.dart';
import '../dataModels/user_location.dart';

class LocationService {
  // keep track of the current location
  late UserLocation _currentLocation;

  Location location = Location();

  // continuously emit the location update
  StreamController<UserLocation> _locationController =
    StreamController<UserLocation>.broadcast();

  LocationService() {
    location.requestPermission().then((granted) {
      if(granted == PermissionStatus.granted) {
        // print('------------------------------this is the permission: $granted');
        location.onLocationChanged.listen((locationData) {
          if(locationData != null) {
            _locationController.add(
              UserLocation(
                latitude: locationData.latitude!,
                longitude: locationData.longitude! 
              ));
          }
        });
      }
      if(granted == PermissionStatus.denied) {
        SystemChannels.platform.invokeMethod('SystemNavigator.pop');
      }
    });
  }

  Stream<UserLocation> get locationStream => _locationController.stream;

  Future<UserLocation> getLocation() async {
    try {
      var userLocation = await location.getLocation();
      _currentLocation = UserLocation(
        latitude: userLocation.latitude!,
        longitude: userLocation.longitude!);
    } catch(e) {
      print('could not get the current location: $e');
    }

    return _currentLocation;
  }
}