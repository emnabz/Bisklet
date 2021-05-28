import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isRememberMe = false;
  
Widget buildEmail() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text('Email',
      style: TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.bold
      ),
      ),
      SizedBox(height: 10),
      Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 6,
              offset: Offset(0,2)
            )
          ]
        ),
        height: 60,
        child: TextField(
          keyboardType: TextInputType.emailAddress,
          style: TextStyle(
            color: Colors.black87
          ),
          decoration: InputDecoration(
            border:InputBorder.none,
            contentPadding: EdgeInsets.only(top: 14),
            prefixIcon: Icon(
              Icons.email,
              color: Color(0xff008080)
            ),
            hintText: 'Email',
            hintStyle: TextStyle(
              color: Colors.black38
            )
          ),
        )
      )
    ]);
}
Widget buildPassword() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text('Password',
      style: TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.bold
      ),
      ),
      SizedBox(height: 10),
      Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 6,
              offset: Offset(0,2)
            )
          ]
        ),
        height: 60,
        child: TextField(
          obscureText: true,
          style: TextStyle(
            color: Colors.black87
          ),
          decoration: InputDecoration(
            border:InputBorder.none,
            contentPadding: EdgeInsets.only(top: 14),
            prefixIcon: Icon(
              Icons.lock,
              color: Color(0xff008080)
            ),
            hintText: 'Password',
            hintStyle: TextStyle(
              color: Colors.black38
            )
          ),
        )
      )
    ]);
}

Widget buildForgotPassBtn() {
  return Container(
    alignment: Alignment.centerRight,
    child: FlatButton(
      onPressed: () => print("Forgot Password pressed"),
      padding: EdgeInsets.only(right: 0),
      child: Text(
        "Forgot Password?",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold
        ),
      ),
    ),
    );
}

Widget buildRememberCb() {
return Container(
  height: 20,
  child: Row(
    children: <Widget>[
      Theme(
        data: ThemeData(unselectedWidgetColor: Colors.white),
        child: Checkbox(
          value: isRememberMe,
          checkColor: Colors.green,
          activeColor: Colors.white,
          onChanged: (value) {
            setState((){
              isRememberMe= value;
            });
          },
          ),
      ),
      Text(
        'Remember me',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold
        ),
      )
    ],
    ),
);
}
 
Widget buildLoginBtn(){
  return Container(
    padding: EdgeInsets.symmetric(vertical: 25),
    width: double.infinity,
    // ignore: deprecated_member_use
    child: RaisedButton(
      elevation: 5,
      onPressed: () => print('Login Pressed'),
      padding: EdgeInsets.all(15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)
    ),
    color: Colors.white,
      child: Text(
      'LOGIN',
      style: TextStyle(
        color: Color(0xff008080),
        fontSize: 18,
        fontWeight: FontWeight.bold
      )
    )
  )
  );
}

@override
Widget build(BuildContext context) {
  return Scaffold(
    body: AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: GestureDetector(
        child: Stack(
          children: <Widget>[
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0x66008080),
                    Color(0x99008080),
                    Color(0xcc008080),
                    Color(0xff008080),
                  ]
                )
              ),
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 120,
                ),
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Sign In',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold
                    ), 
                  ),
                  SizedBox(height: 50),
                  buildEmail(),
                  SizedBox(height: 20),
                  buildPassword(),
                  buildForgotPassBtn(),
                  buildRememberCb(),
                  buildLoginBtn(),
                ],
              ),
                )
              )
          ]
        )
        )
    )
  );
}

}