import 'package:flutter/material.dart';
import 'package:secure_note/Screens/PasscodeScreen.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset(
          'images/App_Logo.png',
          width: 200.0,
          height: 200.0,
        ),
        Text(
          'Secure Note',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            decoration: TextDecoration.none,
            //fontFamily:
          ),
        ),
        SizedBox(
          height: 15.0,
        ),
        LoginButtons(),
      ],
    ));
  }
}
