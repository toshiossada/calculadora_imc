import 'package:flutter/material.dart';

import 'pages/home_page.dart';
import 'pages/login_page.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      fontFamily: 'Poppins',
      primaryColor: Color(0xFFC1007E),
      accentColor: Color(
        0xFF919191,
      ),
    ),
    initialRoute: '/',
    routes: {
      '/': (context) => Login(),
      '/home': (context) => Home(),
    },
  ));
}
