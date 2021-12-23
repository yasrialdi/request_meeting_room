import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:request_meeting_room/account/akun.dart';
import 'package:request_meeting_room/addbooking/add_booking.dart';
import 'package:request_meeting_room/home/home.dart';
import 'package:request_meeting_room/inforoom/info_room.dart';
import 'package:request_meeting_room/Admin/listbooking/list_booking_admin.dart';

class PageNavBottomBarAdmin extends StatefulWidget {
  const PageNavBottomBarAdmin({Key? key}) : super(key: key);

  @override
  _PageNavBottomBarAdminState createState() => _PageNavBottomBarAdminState();
}

class _PageNavBottomBarAdminState extends State<PageNavBottomBarAdmin> {
  int page = 0;

  @override
  // TODO: implement widget
  PageNavBottomBarAdmin get widget => super.widget;

  final List<Widget> _listPage = [PageHome(),PageListBookingAdmin(),PageInfoRoom(),PageProfil()];




  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _listPage[page],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          onTap: Tap,
          currentIndex: page,
          selectedItemColor: Color(0xff2484DF),
          unselectedItemColor: Color(0xff808080),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list_alt),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.info_outline),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined),
              label: '',
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: (){
            showModalBottomSheet(isScrollControlled: true, context: context, builder: (context){
              return PageAddBooking();
            });
          },
        ),
      ),
    );
  }

  void Tap(int value) {
    setState(() {
      page = value;
    });
  }
}

