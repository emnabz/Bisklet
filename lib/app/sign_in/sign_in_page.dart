import 'package:flutter/material.dart';
import 'package:besklet/app/sign_in/social_sign_in_button.dart';

// ignore: camel_case_types
class signInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome To Bisklet'),
        backgroundColor: Color(0xFFAED6F1),
        elevation: 10.0,
      ),
      body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/bike.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: _buildContent(),
      )
    );
  }
  Widget _buildContent() {
        return Padding (
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Already have an account?',
            style: TextStyle(fontSize: 20.0, 
            color: Colors.black87,
            fontWeight: FontWeight.w600,),
            textAlign: TextAlign.center,
            ),
            SizedBox(height: 20.0),
            // ignore: deprecated_member_use
            RaisedButton(
              child: Text(
                'Log In',
              style: TextStyle(
                color: Colors.black87,
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
              ),),
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(50),
              ),
              ),
              onPressed: () {},
            ),
            SizedBox(height: 8.0),
            Text(
              'New to Bisklet? sign up.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w600,
            ),
            ),
            SizedBox(height: 20.0),
            SocialsignInButton(
              assetName: 'images/google-logo.png',
              text: 'Continue with Google',
              textColor: Colors.black87,
              color: Colors.white,
              onPressed: () {},
           ),
          SizedBox(height: 20.0),
          SocialsignInButton(
              assetName: 'images/facebook-logo.png',
              text: 'Continue with Facebook',
              textColor: Colors.white,
              color: Color(0xFF334D92),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}