import 'dart:ffi';

import 'package:bisklet/screens/sign_in/login_screen.dart';
import 'package:bisklet/screens/sign_in/profile_pages/edit_profile.dart';
import 'package:flutter/material.dart';
import 'package:bisklet/screens/home_page/main_home.dart';
import 'package:flutter/services.dart' show rootBundle;

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'ubuntu',
      ),
      debugShowCheckedModeBanner: false,
      home: mainPage(),
    );
  }
}
class mainPage extends StatefulWidget {
  @override
  _mainPageState createState() => _mainPageState();
}

class _mainPageState extends State<mainPage> {
  String data = '';
fetchFieldData() async{
  String responseText;
  responseText = await rootBundle.loadString('textFiles/textDemo.txt');
  setState(() {
    data = responseText;
  });
}
@override
Void initState() {
  fetchFieldData();
  super.initState();
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: new Drawer(
        child: new ListView(
          children: <Widget> [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.white30,
            ),
            child: Column(
          children: [
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Image.asset(
                          "assets/images/menu.png",
                          height: 120,
                          width: 200,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
            ],),
            ),
             new ListTile(
              leading: Icon(Icons.home_rounded),
              title: new Text('Home'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MainPage()
                  )
                );
              },
            ),
            SizedBox(height: 10),
            new ListTile(
              leading: Icon(Icons.account_circle),
              title: new Text('Profile'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingsUI()
                  )
                );
              },  
            ),
            new ListTile(
              leading: Icon(Icons.map_rounded),
              title: new Text('Maps'),
              onTap: () {}
            ),
            new ListTile(
              leading: Icon(Icons.notifications_on_outlined),
              title: new Text('Notifications'),
              onTap: () {},
            ),
            new ListTile(
              leading: Icon(Icons.info_outlined),
              title: new Text('About'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AboutUs()
                  )
                );
              },  
            ),
            new ListTile(
              leading: Icon(Icons.login_rounded),
              title: new Text('Log Out'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginScreen()
                  )
                );
              },  
            ),
          ],
        )
      ),
      backgroundColor: Color(0xFF66BB6A),
      appBar: AppBar(
        title: Text("About Bisklet", style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w700
        ),),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40)),
                color: Colors.white
              ),
              child: Column(
                    children: <Widget> [
                      Expanded(
                        child: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(data, style: TextStyle(fontSize: 20, height: 2,),
                        ) 
                      ] 
                    ),
                  ),          
                ] 
              ),       
        ),
      ),
      
    ]
    
  ),
  floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
        },
        child: const Icon(Icons.navigation),
        backgroundColor: Colors.green,
      ),
);
}
}




