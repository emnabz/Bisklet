import 'package:bisklet/app/sign_in/sign_in_page.dart';
import 'package:flutter/material.dart';

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
      primaryColor: Colors.grey[200],

    ),
    home: signInPage(),

    );
  }
}
