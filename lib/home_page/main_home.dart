import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../app/sign_in/profile_pages/edit_profile.dart';

class HomePage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}
// ignore: must_be_immutable
class _MainPageState extends State<HomePage> {
  @override
  // ignore: unused_field
  // ignore: override_on_non_overriding_member
  int _selectedIndex = 0;
  // ignore: unused_field
  List<Widget> _widgetOptions = <Widget>[
    HomePage(),        
    Text('Maps'), //maps page no ready yet
    SettingsUI(),
];

  // ignore: unused_element
  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home'),
        backgroundColor: Color(0xFF66BB6A),
          elevation: 1,
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon:Icon(
              Icons.home_filled
              ),
            // ignore: deprecated_member_use
            title: Text(
              'Home',
              ),
          ),
          BottomNavigationBarItem(
            icon:Icon(
              Icons.map_outlined),
            // ignore: deprecated_member_use
            title: Text('Maps'),
          ),
          BottomNavigationBarItem(
            icon:Icon(
              Icons.account_circle),
            // ignore: deprecated_member_use
            title: Text('Profile'),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTap,
        selectedFontSize: 13.0,
        unselectedFontSize: 13.0,
        ),
    );
  }
}
