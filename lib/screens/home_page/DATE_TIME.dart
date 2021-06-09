import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:bisklet/screens/home_page/notification_dialog.dart';

class DateTimePickerWidget2 extends StatefulWidget {
  @override
  _DateTimePickerWidget2State createState() => _DateTimePickerWidget2State();
}

class _DateTimePickerWidget2State extends State<DateTimePickerWidget2> {
  DateTime selectedDate = DateTime.now();

  final DateFormat dateFormat = DateFormat('yyyy-MM-dd HH:mm');

  @override
  Widget build(BuildContext context) {
    return Column(
      
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(dateFormat.format(selectedDate)),
        
        // ignore: deprecated_member_use
        RaisedButton(
          BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            border: Border.all(color: Colors.black.withOpacity(0.3)),
          ),
          child: Center(
            child: Text('Choose new date time', style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500
          ),),),
          onPressed: () async {
            showDateTimeDialog(context, initialDate: selectedDate,
                onSelectedDate: (selectedDate) {
              setState(() {
                this.selectedDate = selectedDate;
              });
            });
          },
        ),
      ]
    );
  }
}