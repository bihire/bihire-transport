import 'package:flutter/material.dart';
import 'package:localization1/HomeView/home_view.dart';
import 'package:localization1/services/location_service.dart';
import 'package:localization1/dataModels/user_location.dart';
import 'package:provider/provider.dart';

import '../dataModels/user_location.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamProvider<UserLocation>(
      initialData: UserLocation(latitude: null, longitude: null),
      create: (context) => LocationService().locationStream,
      child: HomeView(),
    ));
  }
}
