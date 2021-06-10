import 'package:flutter/material.dart';
class Login extends StatefulWidget{
@override
_LoginState createState() => _LoginState();
}
class _LoginState extends State<Login>{
  TextEditingController _emailController;
  TextEditingController _passwordController;
  @override
  void initState(){
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }
  @override
  void dispose(){
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  @override
 Widget build(BuildContext context) {
   
   return Scaffold(
     
   );
 }
  }
