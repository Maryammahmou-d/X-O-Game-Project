import 'package:flutter/material.dart';
import 'package:xo_game/Login.dart';
import 'package:xo_game/xoScreen.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: loginScreen.routeName,
    routes: {
      xoScreen.routeName: (context) => xoScreen(),
      loginScreen.routeName: (context) => loginScreen(),
    },
    theme: ThemeData(
        textTheme: const TextTheme(
      headlineLarge: TextStyle(
          fontSize: 25, fontWeight: FontWeight.w400, color: Colors.white),
      headlineMedium: TextStyle(
          fontSize: 23, fontWeight: FontWeight.bold, color: Colors.white),
    )),
  ));
}
