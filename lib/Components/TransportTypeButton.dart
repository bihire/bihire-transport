import 'package:flutter/material.dart';

class TransportTypeButton extends StatelessWidget {
    final Widget transportType;
    final Widget transportTypeIcon;

  const TransportTypeButton({Key? key,required this.transportType,required this.transportTypeIcon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {},
      child: Container(
        width: 100,
        height: 100,
        margin: EdgeInsets.only(right: 10.0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(
              color: Color(0xffd9d9d9),
              width: .8,
              style: BorderStyle.solid,
          )),
        
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            transportTypeIcon,
            transportType,
          ],
        ),
      )
    );
    
  }
}