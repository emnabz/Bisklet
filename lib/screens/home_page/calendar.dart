import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:bisklet/screens/sign_in/login_screen.dart';
import 'package:bisklet/screens/sign_in/profile_pages/edit_profile.dart';
import 'package:bisklet/screens/home_page/main_home.dart';

class DateTimePickerWidget extends StatefulWidget {
  @override
  _DateTimePickerWidgetState createState() => _DateTimePickerWidgetState();
}

class _DateTimePickerWidgetState extends State<DateTimePickerWidget> {
  DateTime selectedDate = DateTime.now();

  final DateFormat dateFormat = DateFormat('yyyy-MM-dd HH:mm');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
            body: Column(

      children: <Widget>[
        Text(dateFormat.format(selectedDate)),
        RaisedButton(
          child: Text('Choose new date time'),
          onPressed: () async {
            final selectedDate = await _selectDateTime(context);
            if (selectedDate == null) return;

            print(selectedDate);

            final selectedTime = await _selectTime(context);
            if (selectedTime == null) return;
            print(selectedTime);

            setState(() {
              this.selectedDate = DateTime(
                selectedDate.year,
                selectedDate.month,
                selectedDate.day,
                selectedTime.hour,
                selectedTime.minute,
              );
            });
          },
    shape: StadiumBorder(),
    
            ),
      ]
));
           
            

        
  }

  Future<TimeOfDay> _selectTime(BuildContext context) {
    final now = DateTime.now();

    return showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: now.hour, minute: now.minute),
    );
  }

  Future<DateTime> _selectDateTime(BuildContext context) => showDatePicker(
        context: context,
        initialDate: DateTime.now().add(Duration(seconds: 1)),
        firstDate: DateTime.now(),
        lastDate: DateTime(2100),
      );
}