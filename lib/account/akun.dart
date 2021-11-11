import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:request_meeting_room/home/model_home.dart';
import 'package:request_meeting_room/home/repository_home.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  List<DataHome> listHome = [];
  RepositoryHome repository = RepositoryHome();


  getDataHome() async {
    listHome = await repository.getDataHome();
    setState(() {});
  }

  _getDataSource() async {
    List<DataHome> listHome = (await http.get(Uri.parse
      ('https://empkp.000webhostapp.com/datagetnew.php'))) as List<DataHome>;
    final List<Meeting> meetings = <Meeting>[];

    for(DataHome item in listHome) {
      final DateTime startTime = item.mulai as DateTime;
      final DateTime endTime = item.selesai as DateTime;
      meetings.add(Meeting("Conference", startTime, endTime, Color(0xFF0F8644), false));
    }
    return meetings;
  }

  @override
  void initState() {
    getDataHome();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calendar Getting Started',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: FutureBuilder(
            future: _getDataSource(),
            builder: (context, snapshot){
              return SfCalendar(
                view: CalendarView.week,
                dataSource: MeetingDataSource(_getDataSource()),
                monthViewSettings: MonthViewSettings(
                    appointmentDisplayMode: MonthAppointmentDisplayMode.appointment),
              );
            }
        ),
      ),
    );
  }


}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Meeting> source){
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].to;
  }

  @override
  String getSubject(int index) {
    return appointments![index].eventName;
  }

  @override
  Color getColor(int index) {
    return appointments![index].background;
  }

  @override
  bool isAllDay(int index) {
    return appointments![index].isAllDay;
  }
}

class Meeting {
  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);

  String eventName;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;
}