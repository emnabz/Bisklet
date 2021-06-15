import 'package:flutter/material.dart';
import 'package:bisklet/screens/sign_in/sign_up_screen.dart';
import 'package:bisklet/screens/sign_in/reset_password.dart';
import 'package:bisklet/screens/home_page/main_home.dart';
import 'package:bisklet/firebase/auth.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StartState();
}
class StartState extends State<LoginScreen> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  bool isLoading = false;
  bool _passwordVisible = false;
  @override
  Widget build(BuildContext context) {
    return initWidget();
  }
  initWidget() {
    return Scaffold(
      body: isLoading == false ? SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(90)),
                color: new Color(0xFF66BB6A),
                gradient: LinearGradient(colors: [(new  Color(0xFFAD5D6A7)), new Color(0xFF66BB6A)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 50),
                        child: Image.asset(
                          "assets/images/back.png",
                          height: 150,
                          width: 320,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 20, top: 20),
                        alignment: Alignment.bottomRight,
                        child: Text(
                          "Login",
                          style: TextStyle(
                            
                              fontSize: 20,
                              color: Colors.white
                          ),
                        ),
                      )
                    ],
                  )
              ),
            ),

            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 20, right: 20, top: 70),
              padding: EdgeInsets.only(left: 20, right: 20),
              height: 54,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.grey[200],
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 50,
                      color: Color(0xffEEEEEE)
                  ),
                ],
              ),
              child: TextField(
                controller: _email,
                cursorColor: Colors.green[600],
                decoration: InputDecoration(  
                  icon: Icon(
                    Icons.email,
                    color: Colors.green[600],
                  ),
                  hintText: "Enter Email",
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),

            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 20, right: 20, top: 20),
              padding: EdgeInsets.only(left: 20, right: 20),
              height: 54,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Color(0xffEEEEEE),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 20),
                      blurRadius: 100,
                      color: Color(0xffEEEEEE)
                  ),
                ],
              ),
              child: TextField(
                controller: _password,
                cursorColor: Colors.black,
                obscureText: !_passwordVisible,
                decoration: InputDecoration(
                  focusColor: Colors.green[600],
                  icon: Icon(
                    Icons.vpn_key,
                    color: Colors.green[600],
                  ),
                  hintText: "Enter Password",
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  suffixIcon: IconButton(
            icon: Icon(
              _passwordVisible
               ? Icons.visibility
               : Icons.visibility_outlined,
               color: Colors.grey,
               ),
            onPressed: () {setState(() {
                   _passwordVisible = !_passwordVisible;
               });
             },
            ),
          ),

                ),
               ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => Forgot()));
                },
                      
                child: Text("Forget Password?"),
              ),
            ),
            GestureDetector(
              onTap: () async {
                print(_email);
                print(_password);
                setState((){
                isLoading = true;
                });
                AuthClass().signIN(
                email: _email.text.trim(),
                password: _password.text.trim()).then((value) {
                  if (value == 'Welcome') {
                    setState(() {
                      isLoading = false;
                    }
                    );
                Navigator.pushAndRemoveUntil(
                  context, 
                  MaterialPageRoute(builder: (context) => MainPage()), 
                  (route) => false);
              }
              else
              setState((){
                isLoading = false;
              }
                );
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(value)));
                }
                );
              },
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: 20, right: 20, top: 70),
                padding: EdgeInsets.only(left: 20, right: 20),
                height: 54,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [(new  Color(0xFF66BB6A)), new Color(0xFFAD5D6A7)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight
                  ),
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.grey[200],
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 10),
                        blurRadius: 50,
                        color: Colors.grey
                    ),
                  ],
                ),
                child: Text(
                  "LOGIN",
                  style: TextStyle(
                      color: Colors.white
                  ),
                ),
              ),
            ),
                // ignore: deprecated_member_use
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't Have Any Account?"),
                  GestureDetector(
                    child: Text(
                      "Register Now",
                      style: TextStyle(
                          color: Colors.green[800]
                      ),
                    ),
                    onTap: () async {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignUpScreen(),
                          )
                        );
                      },
                  )
                ],
              ),
            )
          ],
        )
      )
      : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}