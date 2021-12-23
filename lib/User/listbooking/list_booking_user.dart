import 'package:flutter/material.dart';
import 'package:request_meeting_room/User/listbooking/history_booking_user.dart';
import 'package:request_meeting_room/User/listbooking/on_booking_user.dart';

class PageListBookingUser extends StatefulWidget {
  const PageListBookingUser({Key? key}) : super(key: key);

  @override
  _PageListBookingUserState createState() => _PageListBookingUserState();
}

class _PageListBookingUserState extends State<PageListBookingUser>
    with SingleTickerProviderStateMixin{

  bool changed = true;
  TabController?tabcontroll;


  @override
  void initState() {
    tabcontroll = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabcontroll?.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffDCE5F0),
        appBar: AppBar(
          title: Text(
            'List Meeting',
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
        body: Column(

          children: [

            TabBar(
              controller: tabcontroll,
              tabs: [
                Tab(
                  child: Text(
                    'Meeting Terbaru',
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'Ubuntu',
                      color: Colors.black,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    'History Meeting',
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'Ubuntu',
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(
                child: TabBarView(
                  controller: tabcontroll,
                  children: [
                    PageOnBookingUser(tabcontroll),
                    PageHistoryBookingUser(tabcontroll)
                  ],
                ),
              ),
            ),


            SizedBox(height: 10),

          ],
        ));
  }
}
