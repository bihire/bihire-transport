import 'package:flutter/material.dart';
import 'package:localization1/Components/TransportTypeButton.dart';
import 'package:localization1/CustomWidgets/MyAppBar.dart';
import 'package:localization1/Views/TransportMenuBody/transport_menu_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // var userLocation = Provider.of<UserLocation>(context);
    // if (userLocation == null && userLocation == null) {
    //   return Scaffold(
    //     body: Center(),
    //   );
    // }
    return Scaffold(
        appBar: MyAppbar(
            title: Text('Welcome to Ikaze',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.black))),
        body: TransportMenuBody(),
        bottomNavigationBar: Container(
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              top: BorderSide(
                color: Color(0xffd9d9d9),
                width: .8,
                style: BorderStyle.solid,
              ),
            ),
          ),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              TransportTypeButton(
                transportTypeIcon: new Icon(Icons.directions_bus),
                transportType: new Text('Bus'),
              ),
              TransportTypeButton(
                transportTypeIcon: new Icon(Icons.motorcycle),
                transportType: new Text('Moto'),
              ),
              // TransportTypeButton()
            ],
          ),
        ));
  }
}
