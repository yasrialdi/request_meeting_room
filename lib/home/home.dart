import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:request_meeting_room/firstpage/nav_bottom_bar.dart';
import 'package:request_meeting_room/listbooking/list_booking.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:request_meeting_room/home/repository_home.dart';
import 'package:request_meeting_room/home/model_home.dart';
import 'package:intl/intl.dart';

class PageHome extends StatefulWidget {
  const PageHome({Key? key}) : super(key: key);

  @override
  _PageHomeState createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  List<DataHome> listHome = [];
  RepositoryHome repository = RepositoryHome();

  DateFormat formatter = DateFormat('dd-MM-yyyy');
  DateFormat formatHome = DateFormat('dd-MM-yyyy HH:mm');



  getDataHome() async {
    listHome = await repository.getDataHome();
    setState(() {});
  }

  Future<List<Meeting>> _getDataSource() async {
    List<DataHome> listHome = await repository.getDataHome();
    List<Meeting> meetings = [];

    for (DataHome item in listHome) {
      DateTime startTime = item.mulaiDateTime;
      DateTime endTime = item.selesaiDateTime;

      meetings.add(
        // Meeting("Conference", startTime, endTime, Color(0xFF0F8644), false),
        Meeting(item.judul, item.ruang, startTime, endTime, Color(0xFF0F8644), false),
      );


    }

    return meetings;


  }



  void _showDialogBooking(DataHome dataHome) {
    showDialog(
      context: context,
      builder: (_) {
      return AlertDialog(
        title: Text("Detail Booking"),
        content: SingleChildScrollView(
          child: Container(
            width: 150,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                          "Judul Meeting" " : " "${dataHome.judul}\n"
                              "Ruang Meeting" " : " "${dataHome.ruang}\n"
                              "Mulai Meeting" " : " "${dataHome.mulai} WIB\n"
                              "Selesai Meeting" " : " "${dataHome.selesai} WIB\n"
                              "Jumlah Peserta Meeting" " : ""${dataHome.jml_peserta}\n"
                              "Catatan Meeting" " : " "${dataHome.catatan}\n")
              ],
            ),
          ),
        ),
        actions: <Widget>[
          new FlatButton(
            child: new Text("OK"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
    );
  }

  @override
  void initState() {
    getDataHome();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffDCE5F0),
      appBar: AppBar(
        title: Text(
          'Info Room Meeting',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            fontFamily: 'Ubuntu',
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Container(

          child: Column(children: [
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: FutureBuilder<List<Meeting>>(
                future: _getDataSource(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return SfCalendar(
                      view: CalendarView.month,
                      dataSource: MeetingDataSource(snapshot.data!),
                      onTap: (details){
                        showModalBottomSheet(
                            context: context,
                            builder: (context) => LongPress());
                      },

                    );
                  }

                  return Center(child: CircularProgressIndicator());
                },
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Row(
                children: [
                  Text(
                    "Meeting Terbaru",
                    style: TextStyle(fontSize: 18, fontFamily: 'Cambria'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  // color: Colors.white,
                ),
                child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: listHome.length,
                    itemBuilder: (BuildContext context, index) {
                      return Container(
                        height: 135,
                        margin: EdgeInsets.only(bottom: 3),
                        child: Card(
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: Image.network(
                                    '${listHome[index].foto}',
                                    fit: BoxFit.cover,
                                    height: MediaQuery.of(context).size.height,
                                    width: 115,
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${listHome[index].ruang}',
                                          style: TextStyle(
                                            fontSize: 17,
                                            fontFamily: 'Ubuntu',
                                            color: Colors.black,
                                          ),
                                        ),
                                        SizedBox(height: 18),
                                        Row(
                                          children: [
                                            Text(
                                              listHome[index].mulai,
                                              style: TextStyle(
                                                fontSize: 11,
                                                fontFamily: 'Ubuntu',
                                                color: Color(0xff928B8B),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 1),
                                        Row(
                                          children: [
                                            Text(
                                              '${listHome[index].selesai}',
                                              style: TextStyle(
                                                fontSize: 11,
                                                fontFamily: 'Ubuntu',
                                                color: Color(0xff928B8B),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 1),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            MaterialButton(
                                              onPressed: () {
                                                _showDialogBooking(listHome[index]);
                                              },
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                              height: 15,
                                              minWidth: 30,
                                              child: Text(
                                                'Detail',
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: 'Ubuntu',
                                                    color: Colors.white),
                                              ),
                                              color: Color(0xff2484DF),
                                            ),
                                            SizedBox(height: 10),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ]),
                        ),
                      );
                    })),
          ]),
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
  Meeting(this.eventName, this.ruang, this.from, this.to, this.background, this.isAllDay);

  String eventName;
  String ruang;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;

}

class Detail {
  Detail(this.eventName, this.ruang, this.from, this.to, this.background, this.isAllDay);

  String eventName;
  String ruang;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;

}


class LongPress extends StatefulWidget {
  const LongPress({Key? key}) : super(key: key);

  @override
  _LongPressState createState() => _LongPressState();
}

class _LongPressState extends State<LongPress> {

  List<DataHome> listHome = [];
  RepositoryHome repository = RepositoryHome();



  DateFormat formatter = DateFormat('dd-MM-yyyy');
  DateFormat formatHome = DateFormat('dd-MM-yyyy HH:mm');

  getDataHome() async {
    listHome = await repository.getDataHome();
    setState(() {});
  }

  Future<List<Meeting>> _getDataSelect() async {
    List<DataHome> listHome = await repository.getDataHome();
    List<Meeting> meetings = [];


    for (DataHome item in listHome) {
      DateTime startTime = item.mulaiDateTime;
      DateTime endTime = item.selesaiDateTime;


      meetings.add(
        // Meeting("Conference", startTime, endTime, Color(0xFF0F8644), false),
        Meeting(item.judul, item.ruang, startTime, endTime, Color(0xFF0F8644), false),
      );
    }
    return meetings;

    _getDataSelect() => meetings;
  }


  @override
  Widget build(BuildContext context) {



    return FutureBuilder<List<Meeting>>(
      future: _getDataSelect(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SfCalendar(
            view: CalendarView.timelineDay,
            dataSource: MeetingDataSource(snapshot.data!),
            monthViewSettings: MonthViewSettings(
              appointmentDisplayMode:
              MonthAppointmentDisplayMode.appointment,
            ),
          );
        }

        return Center(child: CircularProgressIndicator());
      },
    );

  }
}
