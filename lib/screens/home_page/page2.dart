import 'package:bisklet/screens/home_page/calendar/date_picker_widget.dart';
import 'package:bisklet/screens/home_page/about.dart';
import 'package:bisklet/screens/sign_in/login_screen.dart';
import 'package:bisklet/screens/sign_in/profile_pages/edit_profile.dart';
import 'package:flutter/material.dart';
import 'package:bisklet/screens/home_page/Reservation.dart';
import 'package:bisklet/screens/home_page/calendar/time_picker.dart';
import 'package:bisklet/screens/home_page/main_home.dart';


class New extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'ubuntu',
      ),
      debugShowCheckedModeBanner: false,
      home: New_page(),
    );
  }
}
class New_page extends StatefulWidget {
  @override
  _mainPage2 createState() => _mainPage2();
}

class _mainPage2 extends State<New_page> {
  int _value = 1;
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
        title: Text("Home", style: TextStyle(
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  SizedBox(height: 20),
                  Text("Choose Your Date", style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600
                  ),),

InkWell(
child: Container(   
  height: 100,
   width: 250,
                 margin: EdgeInsets.only(left: 50, right: 20, top: 0),
                    child: Center(
                    child: DatePickerWidget(),
                    ),
 ),
                  ),
                  SizedBox(height: 0),
                  SizedBox(height: 20,),
                  Text("Choose Your Time", style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600
                  ),),

                  InkWell(
child: Container(   
  height: 100,
   width: 250,
                 margin: EdgeInsets.only(left: 50, right: 20, top: 0),
                    child: Center(
                    child: TimePickerWidget(),
                    ),
 ),
                  ),
                  SizedBox(height: 10,),
                  Text("Choose Your Period of time", style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600
                  ),),

InkWell(
child: Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
         ),      
  height: 100,
   width: 250,
   
     margin: EdgeInsets.only(left: 50, right: 20, top: 20),
  child: Center( 
  child: ElevatedButton(
    style: ElevatedButton.styleFrom(
      minimumSize: Size.fromHeight(40),
      primary: Colors.white,
   shape: RoundedRectangleBorder(side: BorderSide(color: Colors.black.withOpacity(0.3))),
   
    ),

    onPressed: () {},
    
    
          child: DropdownButton(
              value: _value,
              items: [
                
                DropdownMenuItem(
                  child: Text("one hour", style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),),
                  value: 1,
                ),
                DropdownMenuItem(
                  child: Text("Half Day" , style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,)),
                  value: 2
                ),
                DropdownMenuItem(
                    child: Text("a day" , style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,)),
                    value: 3
                )
              ],
              onChanged: (value) {
                setState(() {
                  _value = value;
                });
              }),

    
        
  ),
),
),
),              
SizedBox(height:50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(context, 
                          MaterialPageRoute(
                            builder: (context) => ReservationPage()
                            ),
                          );
                        },
                          child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Color(0xFF66BB6A)
                          ),
                          margin: EdgeInsets.only(left: 20, right: 20, top: 12),
                          child: Text("Apply", style: TextStyle(
                            fontSize: 19,
                            color: Colors.white,
                            fontWeight: FontWeight.w600
                            ),),
                          ),
                        ),
                    ], 
                  ),
                  Row(
                    
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

