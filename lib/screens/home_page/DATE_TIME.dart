import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:bisklet/screens/home_page/notification_dialog.dart';

class DateTimePickerWidget2 extends StatefulWidget {
  @override
  _DateTimePickerWidget2State createState() => _DateTimePickerWidget2State();
}


class _DateTimePickerWidget2State extends State<DateTimePickerWidget2> {
  DateTime selectedDate = DateTime.now();


  @override
  Widget build(BuildContext context) {
    return Column(

      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        
        // ignore: deprecated_member_use
        RaisedButton(
          child: Center(
            
            child: Text('Calendar', style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
          ),),),
          onPressed: () async {
            showDateTimeDialog(context, initialDate: selectedDate,
                onSelectedDate: (selectedDate) {
              setState(() {
                this.selectedDate = selectedDate;
              });

            });
          },
          shape: RoundedRectangleBorder(side: BorderSide(color: Colors.black.withOpacity(0.3)), borderRadius: BorderRadius.circular(10)),
          color: Colors.white,

        ),
      ]
    );
  }
}