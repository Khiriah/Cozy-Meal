import 'package:flutter/material.dart';


const Color labalColor = Color(0xff99A2A5);
const Color buttonColor = Color(0xff6B7072);
const Color containerColor = Color(0xffFFD462);
const Color mainColor = Color(0xff1E1E1E);
const Color googleColor = Color(0xffFFC520);


class ThemesApp {
  static final light = ThemeData(
    primaryColor: googleColor,
    backgroundColor: Colors.grey.shade200,
    brightness: Brightness.light,
  );

  static final dark = ThemeData(
    primaryColor: mainColor,
    backgroundColor: mainColor,
    brightness: Brightness.dark,
  );
}