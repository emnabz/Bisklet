import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
class CalendarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: calendarPage(),
      theme: ThemeData(
        fontFamily: 'ubuntu'
      ),
    );
  }
}
class calendarPage extends StatefulWidget {
  @override
  _calendarPageState createState() => _calendarPageState();
}

class _calendarPageState extends State<calendarPage> {
  CalendarController _calendarController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _calendarController = CalendarController();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _calendarController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[600],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text("Select Date", style: TextStyle(
          color: Colors.white
        ),),
      ),
      body: Column(
        children: [
          TableCalendar(
            calendarController: _calendarController,
            initialCalendarFormat: CalendarFormat.week,
            startingDayOfWeek: StartingDayOfWeek.monday,
            formatAnimation: FormatAnimation.slide,
            headerStyle: HeaderStyle(
              centerHeaderTitle: true,
              formatButtonVisible: false,
              titleTextStyle: TextStyle(
                color: Colors.white,
                fontSize: 16
              ),
              leftChevronIcon: Icon(Icons.arrow_back_ios, color: Colors.white, size: 15,),
              rightChevronIcon: Icon(Icons.arrow_forward_ios, color: Colors.white, size: 15,),
              leftChevronMargin: EdgeInsets.only(left: 70),
              rightChevronMargin: EdgeInsets.only(right: 70),
            ),
            calendarStyle: CalendarStyle(
              weekendStyle: TextStyle(
                color: Colors.white
              ),
              weekdayStyle: TextStyle(
                color: Colors.white
              )
            ),
            daysOfWeekStyle: DaysOfWeekStyle(
              weekendStyle: TextStyle(
                color: Colors.white
              ),
              weekdayStyle: TextStyle(
                color: Colors.white
              )
            ),
          ),
          SizedBox(height: 5,),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40)),
                color: Colors.white
              ),
              child: Container(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text("Edit Reservation", style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                          ),)
                        ],
                      ),
                      SizedBox(height: 15,),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
  Row dayTask(String time, String name)
  {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(20),
          width: MediaQuery.of(context).size.width*0.2,
          child: Text(time, style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ), textAlign: TextAlign.right,),
        ),
      ],
    );
  }
}