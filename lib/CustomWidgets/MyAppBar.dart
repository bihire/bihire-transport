import 'package:flutter/material.dart';

class MyAppbar extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;

  const MyAppbar({Key? key,required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 0.0,
      color: Colors.white,
      child: Container(
        padding: const EdgeInsets.all(0.0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Color(0xffd9d9d9),
              width: .8,
              style: BorderStyle.solid,
            ),
          ),
        ),
        
        child: SafeArea(
          child: Container(
            alignment: Alignment.center,
            child: title,
          )),
      ),
    );
  }

  final Size preferredSize = const Size.fromHeight(kToolbarHeight);
}