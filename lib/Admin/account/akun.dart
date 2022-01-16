import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:request_meeting_room/Admin/account/info_room_admin_akun.dart';
import 'package:request_meeting_room/Admin/account/list_user.dart';
import 'package:request_meeting_room/Admin/account/list_user_admin.dart';
import 'package:request_meeting_room/Admin/info_room/info_room_admin.dart';
import 'package:request_meeting_room/Admin/info_room/tambah_room.dart';
import 'package:request_meeting_room/firstpage/RepositoryAkun.dart';
import 'package:request_meeting_room/firstpage/login.dart';
import 'package:request_meeting_room/firstpage/Model_Akun.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PageProfilAdmin extends StatefulWidget {
  const PageProfilAdmin({Key? key}) : super(key: key);

  @override
  _PageProfilAdminState createState() => _PageProfilAdminState();
}

class _PageProfilAdminState extends State<PageProfilAdmin> {
  bool visibility1 = true;
  bool visibility2 = false;

  void _changed(bool visibility, String field) {
    setState(() {
      if (field == '1') {
        visibility1 = visibility;
      }
      if (field == '2') {
        visibility2 = visibility;
      }
    });
  }

  String nama = "";
  String username = "";
  String email = "";
  String divisi = "";
  String level = "";

  Future getEmail() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      username = preferences.getString('username');
      nama = preferences.getString('nama');
      email = preferences.getString('email');
      divisi = preferences.getString('divisi');
      level = preferences.getString('level');
    });
  }

  Future logOut(BuildContext context) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    preferences.remove('nama');
    preferences.remove('username');
    preferences.remove('email');
    preferences.remove('divisi');
    preferences.remove('level');
    Fluttertoast.showToast(
        msg: "Logout Successful",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.amber,
        textColor: Colors.white,
        fontSize: 16.0);
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) =>
                PageLogin()),
            (Route<dynamic> route) => false);
  }

  @override
  void initState() {
    super.initState();
    getEmail();
    getDataAkun();
  }

  List<DataAkun> listAkun = [];
  RepositoryAkun repository = RepositoryAkun();

  getDataAkun() async {
    listAkun = await repository.getDataAkun();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffDCE5F0),
      appBar: AppBar(
        title: Text(
          'Account',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: 'Ubuntu',
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              color: Colors.white,
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
              child: Stack(alignment: Alignment.center, children: [
                Positioned(
                  bottom: 0,
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage('images/person.png'),
                        // child:
                      ),
                      SizedBox(height: 10),
                      Text(
                        username,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Ubuntu',
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
            SizedBox(height: 8),
            SizedBox(height: 10),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 0,
                    blurRadius: 1.5,
                    offset: Offset(0, 0),
                  )
                ],
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 45,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 18, right: 9),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Detail',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,

                            ),
                          ),
                          InkWell(
                            onTap: () {
                              _changed(true, '2');
                            },
                            child: visibility2
                                ? InkWell(
                              onTap: () {
                                _changed(false, '2');
                              },
                              child: Icon(
                                Icons.keyboard_arrow_up_sharp,
                                color: Colors.black,
                              ),
                            )
                                : Icon(
                              Icons.keyboard_arrow_right_sharp,
                              color: Colors.black,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Visibility(
                    visible: visibility2,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 18, right: 9),
                      child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Nama    : ${nama}\n'
                                      'Email     : ${email}\n'
                                      'Divisi     : ${divisi}\n'
                                      'Level      : ${level}'
                                    ),
                                  SizedBox(height: 15)
                                ],
                              ),
                            ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Divider(
                      color: Colors.grey,
                      thickness: 0.5,
                    ),
                  ),
                  Container(
                    height: 45,
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                            context, MaterialPageRoute(builder: (_) => PageListUser()));
                      },
                      leading: Icon(
                        Icons.person,
                        color: Color(0xff2484DF),
                      ),
                      minLeadingWidth: 10,
                      title: Text(
                        'User',
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Ubuntu',
                            fontWeight: FontWeight.w200,
                            color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Divider(
                      color: Colors.grey,
                      thickness: 0.5,
                    ),
                  ),
                  Container(
                    height: 45,
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                            context, MaterialPageRoute(builder: (_) => PageRoomListAdmin()));
                      },
                      leading: Icon(
                        Icons.room,
                        color: Color(0xff2484DF),
                      ),
                      minLeadingWidth: 10,
                      title: Text(
                        'Room Meeting',
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Ubuntu',
                            fontWeight: FontWeight.w200,
                            color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Divider(
                      color: Colors.grey,
                      thickness: 0.5,
                    ),
                  ),
                  Container(
                    height: 45,
                    child: ListTile(
                      onTap: () {
                        logOut(context);
                      },
                      leading: Icon(
                        Icons.logout,
                        color: Color(0xff2484DF),
                      ),
                      minLeadingWidth: 10,
                      title: Text(
                        'Logout',
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Ubuntu',
                            fontWeight: FontWeight.w200,
                            color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
