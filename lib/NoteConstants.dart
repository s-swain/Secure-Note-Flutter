import 'package:flutter/material.dart';

final List<String> noteDescription = [];
final List<String> noteHeading = [];
TextEditingController noteHeadingController = new TextEditingController();
TextEditingController noteDescriptionController = new TextEditingController();
FocusNode textSecondFocusNode = new FocusNode();

const int kNoteHeaderMaximumLength = 25;
const int kNoteDescriptionMaximumLines = 10;
String deletedNoteHeading = "";
String deletedNoteDescription = "";

const List<Color> kNoteBodyColors = [
  Color(0xFFeca9d4),
  Color(0xFFb2cff5),
  Color(0xFFebddd1),
  Color(0xFFb2b9d2),
  Color(0xFFefc3c5),
  Color(0xFFefe7c3),
  Color(0xFFc6af9f),
  Color(0xFFb6cece),
  Color(0xFFcbc2d6),
];
const List<Color> kNoteMarginColors = [
  Colors.pink,
  Colors.green,
  Colors.blue,
  Colors.orange,
  Colors.indigo,
  Colors.red,
  Colors.yellow,
  Colors.brown,
  Colors.teal,
  Colors.purple,
];
