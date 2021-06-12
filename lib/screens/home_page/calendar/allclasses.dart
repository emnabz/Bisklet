import 'package:bisklet/screens/home_page/Reservation.dart';
import 'package:bisklet/screens/home_page/about.dart';
import 'package:bisklet/screens/sign_in/login_screen.dart';
import 'package:bisklet/screens/sign_in/profile_pages/edit_profile.dart';
import 'package:flutter/material.dart';
import 'package:bisklet/screens/home_page/main_home.dart';
import 'package:bisklet/screens/home_page/calendar/button_widget.dart';
import 'package:bisklet/screens/home_page/calendar/date_picker_widget.dart';
import 'package:bisklet/screens/home_page/calendar/date_range.dart';
import 'package:bisklet/screens/home_page/calendar/datetimepicker.dart';
import 'package:bisklet/screens/home_page/calendar/timepicker.dart';


class Buttonmain extends StatelessWidget {
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
  String selectedType = "solo";
  String selectedFrequency = "guided tour";
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
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MainPage()
                  )
                );
              },
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
InkWell(
onTap: (){changetype("Date");},
child: Container(   
  
  height: 90,
   width: 200,
                 margin: EdgeInsets.only(left: 80, right: 20, top: 0),
                    child: Center(
                    child: DatePickerWidget(),                    
                    ),
 ),
                  ),
                  SizedBox(height: 10,),
InkWell(
onTap: (){changetype("Time");},
child: Container(   
  
  height: 90,
   width: 200,
                 margin: EdgeInsets.only(left: 80, right: 20, top: 0),
                    child: Center(
                    child: TimePickerWidget(),                    
                    ),
 ),
                  ),
                  InkWell(
onTap: (){changetype("Date Range");},
child: Container(   
  
  height: 90,
   width: 200,
                 margin: EdgeInsets.only(left: 80, right: 20, top: 0),
                    child: Center(
                    child: DateRangePickerWidget(),
                    ),                 
                    ),
                  )
                    ],
              ),
            ),
          )
        ],
      ),
    );
  }
                  
          

void changetrip(String type)
  {
    selectedType = type;
    setState(() {

    });
  }
  void changetype(String frequency)
  {
    selectedFrequency = frequency;
    setState(() {

    });
  }
}
