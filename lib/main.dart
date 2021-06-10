import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bisklet/screens/sign_in/splash.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
}
 
class App extends StatefulWidget {
  _AppState createState() => _AppState();
}
class _AppState extends State<App> {
  bool _initialized = false;
  bool _error = false;
   void initializeFlutterFire() async {
    try {
      // Wait for Firebase to initialize and set `_initialized` state to true
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch(e) {
      // Set `_error` state to true if Firebase initialization fails
      setState(() {
        _error = true;
      });
    }
  }

  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    if(_error) {
      return SomethingWentWrong();
    }
    if (!_initialized) {
      return Loading();
    }
    return MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Bisklet',
    theme: ThemeData(
      primaryColor: Colors.grey[200],

    ),
    home: SplashScreen(),

    );
  }
}
class SomethingWentWrong extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Column(children: [
        Icon(Icons.error),
        Text("Something went wrong")
      ],),)
    );
  }
}
class Loading extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CircularProgressIndicator(),)
    );
  }
}