import 'package:flutter/material.dart';
import 'package:note_app_april/view/notes_screen/notes_screen.dart';
import 'package:note_app_april/view/splash_screen/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Colors.black),
      home: SplashScreen(),
    );
  }
}
