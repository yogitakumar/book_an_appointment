import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'signIn.dart';

class Calendar extends StatefulWidget {
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime selected;
  _showDateTimePicker() async {
    selected = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      //firstDate=initialDate,
      firstDate:  DateTime.now().subtract(Duration(days: 1)),//new DateTime(1960),
      lastDate: new DateTime(2050),
    );

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Your Appointment'),
      ),
      body: Center(
      child: FlatButton(
         // child: Text('Hello'),
        onPressed: () {
         // Navigator.pop(context);
          _showDateTimePicker();
        },
        child: Text('Want an appointment'),
      ),
      ),
    );
  }
}
