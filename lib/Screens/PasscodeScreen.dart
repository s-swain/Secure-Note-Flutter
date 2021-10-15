import 'package:flutter/material.dart';
import 'dart:async';
import 'package:secure_note/Screens/NoteScreen.dart';
import 'package:passcode_screen/circle.dart';
import 'package:passcode_screen/keyboard.dart';
import 'package:passcode_screen/passcode_screen.dart';

const kStoredPasscode = '7891';

class LoginButtons extends StatefulWidget {
  @override
  State<LoginButtons> createState() => _LoginButtonsState();
}

class _LoginButtonsState extends State<LoginButtons> {
  final StreamController<bool> _verificationNotifier =
      StreamController<bool>.broadcast();

  bool isAuthenticated = false;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {
        _showLockScreen(
          context,
          opaque: false,
          cancelButton: Text(
            'Cancel',
            style: const TextStyle(fontSize: 16, color: Colors.white),
            semanticsLabel: 'Cancel',
          ),
        );
      },
      child: Text(
        'Enter Pass Code',
        style: TextStyle(
          fontSize: 17.0,
          fontWeight: FontWeight.w500,
        ),
      ),
      fillColor: Colors.white30,
      constraints: BoxConstraints.expand(
        width: 200.0,
        height: 50.0,
      ),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
    );
  }

  _showLockScreen(
    BuildContext context, {
    required bool opaque,
    CircleUIConfig? circleUIConfig,
    KeyboardUIConfig? keyboardUIConfig,
    required Widget cancelButton,
    List<String>? digits,
  }) {
    Navigator.push(
        context,
        PageRouteBuilder(
          opaque: opaque,
          pageBuilder: (context, animation, secondaryAnimation) =>
              PasscodeScreen(
            title: Text(
              'Enter App Passcode',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 28),
            ),
            circleUIConfig: circleUIConfig,
            keyboardUIConfig: keyboardUIConfig,
            passwordEnteredCallback: _onPasscodeEntered,
            cancelButton: cancelButton,
            deleteButton: Text(
              'Delete',
              style: const TextStyle(fontSize: 16, color: Colors.white),
              semanticsLabel: 'Delete',
            ),
            shouldTriggerVerification: _verificationNotifier.stream,
            backgroundColor: Colors.black.withOpacity(0.8),
            cancelCallback: _onPasscodeCancelled,
            digits: digits,
            passwordDigits: 4,
          ),
        ));
  }

  _onPasscodeEntered(String enteredPasscode) {
    bool isValid = kStoredPasscode == enteredPasscode;
    _verificationNotifier.add(isValid);
    if (isValid) {
      setState(() {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => NotesScreen()));
      });
    }
  }

  _onPasscodeCancelled() {
    Navigator.maybePop(context);
  }

  @override
  void dispose() {
    _verificationNotifier.close();
    super.dispose();
  }
}
