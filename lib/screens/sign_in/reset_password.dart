import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:bisklet/screens/home_page/main_home.dart';
import 'package:bisklet/firebase/auth.dart';
import 'login_screen.dart';

class Forgot extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<Forgot> {  
  TextEditingController _email = TextEditingController();
   bool isLoading = false;
   @override
Widget buildEmail() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      Container(
                        margin: EdgeInsets.only(top: 0),
                        child: Image.asset(
                          "assets/images/reset.png",
                          height: 300,
                          width: 300,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                      SizedBox(height: 50,),
      
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
              color: Color(0xFF66BB6A)
            ),
            hintText: 'Your Email*',
            hintStyle: TextStyle(
              color: Colors.black38
            )
          ),
        )
      )
    ]);
}
Widget buildLoginBtn(){
  return Container(
    padding: EdgeInsets.symmetric(vertical: 25),
    width: double.infinity,
    // ignore: deprecated_member_use
    child: RaisedButton(
      elevation: 5,
      onPressed: () { 
        setState(() {
                          isLoading = true;
                        });
                        AuthClass()
                            .resetPassword(
                          email: _email.text.trim(),
                        )
                            .then((value) {
                          if (value == "Email sent") {
                            setState(() {
                              isLoading = false;
                            });
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()),
                                (route) => false);
                          }
                            setState(() {
                              isLoading = false;
                            });
                            ScaffoldMessenger.of(context)
                                .showSnackBar(SnackBar(content: Text(value)));
                        });
                      },
      padding: EdgeInsets.all(15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)
    ),
    color: Colors.white,
      child: Text(
      'RESET',
      style: TextStyle(
        color: Color(0xFF66BB6A),
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
    body: isLoading == false ? AnnotatedRegion<SystemUiOverlayStyle>(
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
                    Color(0xFFAD5D6A7),
                    Color(0xFF66BB6A),
                    Color(0xFFAD5D6A7),
                    Color(0xFFAD5D6A7),
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
                    'Reset Password',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold
                    ), 
                  ),
                  SizedBox(height: 30),
                  buildEmail(),
                  SizedBox(height: 20),
                  buildLoginBtn(),
                ]
                  ),
              
              ),
              ),
          ]
        )
        ),
    ):Center(child: CircularProgressIndicator()),
    );
  }
}