import 'package:flutter/material.dart';
import 'package:request_meeting_room/home/model_home.dart';
import 'package:request_meeting_room/home/repository_home.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  RepositoryHome repository = RepositoryHome();

  Future<List<Meeting>> _getDataSource() async {
    List<DataHome> listHome = await repository.getDataHome();
    List<Meeting> meetings = [];

    for (DataHome item in listHome) {
      DateTime startTime = item.mulaiDateTime;
      DateTime endTime = item.selesaiDateTime;

      meetings.add(
        // Meeting("Conference", startTime, endTime, Color(0xFF0F8644), false),
        Meeting(item.judul, startTime, endTime, Color(0xFF0F8644), false),
      );
    }

    return meetings;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calendar Getting Started',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: FutureBuilder<List<Meeting>>(
          future: _getDataSource(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return SfCalendar(
                view: CalendarView.week,
                dataSource: MeetingDataSource(snapshot.data!),
                monthViewSettings: MonthViewSettings(
                  appointmentDisplayMode:
                      MonthAppointmentDisplayMode.appointment,
                ),
              );
            }

            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Meeting> source) {
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
