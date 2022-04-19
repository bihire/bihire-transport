import 'package:flutter/material.dart';
// import 'package:flutter_map/flutter_map.dart';
// import 'package:latlong2/latlong.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../pages/transport_menu.dart';
import 'package:localization1/dataModels/user_location.dart';
import 'package:provider/provider.dart';
// import 'package:flutter_typeahead/flutter_typeahead.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late Map<MarkerId, Marker> markers;
  @override
  void initState() {
    _onMapCreated();
    super.initState();
  }

  void _onMapCreated() {
    // mapController = controller;

    final marker = Marker(
      markerId: MarkerId('place_name'),
      position: LatLng(-1.9864063, 30.1171136),
      // icon: BitmapDescriptor.,
      infoWindow: InfoWindow(
        title: 'title',
        snippet: 'address',
      ),
    );
    markers = {MarkerId('place_name'): marker};
    
  }

  @override
  Widget build(BuildContext context) {
    var userLocation = Provider.of<UserLocation>(context);
    if (userLocation.latitude == null && userLocation.longitude == null) {
      return Scaffold(
        body: Center(),
      );
    }

    print(userLocation.latitude);
    print(userLocation.longitude);
    return SafeArea(
        child: Stack(
      children: <Widget>[
        Container(
          child: GoogleMap(
            myLocationButtonEnabled: false,
            zoomControlsEnabled: false,
            initialCameraPosition: CameraPosition(
                target: LatLng(userLocation.latitude!, userLocation.longitude!),
                zoom: 11.5),
            markers: markers.values.toSet(),
          ),
        ),
        Positioned(
          top: 50.0,
          right: 15.0,
          left: 15.0,
          child: Container(
            height: 50.0,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey,
                    offset: Offset(1.0, 5.0),
                    blurRadius: 10,
                    spreadRadius: 3)
              ],
            ),
            child: Container(
              height: 55,
              // color: Colors.white,
              child: Row(
                children: [
                  SizedBox(width: 15),
                  Text('\u25FE', style: TextStyle(fontSize: 12)),
                  SizedBox(width: 15),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: 'Where to?',
                          hintStyle: TextStyle(fontSize: 18),
                          border: InputBorder.none),
                    ),
                  ),
                  Container(
                    width: 1,
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    color: Colors.grey[400],
                  ),
                  SizedBox(width: 15),
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          CupertinoPageRoute(
                            // fullscreenDialog: true,
                            builder: (context) => TransportMenu(),
                          ),
                        );
                      },
                      child: Icon(Icons.directions_bus)),
                  SizedBox(width: 15),
                ],
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
