import 'package:flutter/material.dart';
import 'screens/welcome/welcome_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Bisklet',
    theme: ThemeData(
      scaffoldBackgroundColor: Colors.white,

    ),
    home: WelcomeScreen()
    );
    }
}
