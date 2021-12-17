import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:request_meeting_room/firstpage/RepositoryAkun.dart';
import 'package:request_meeting_room/firstpage/login.dart';
import 'package:request_meeting_room/firstpage/Model_Akun.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PageProfil extends StatefulWidget {
  const PageProfil({Key? key}) : super(key: key);

  @override
  _PageProfilState createState() => _PageProfilState();
}

class _PageProfilState extends State<PageProfil> {
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

  String email = "";

  Future getEmail() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      email = preferences.getString('email');
    });
  }

  Future logOut(BuildContext context) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove('email');
    Fluttertoast.showToast(
        msg: "Logout Successful",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.amber,
        textColor: Colors.white,
        fontSize: 16.0);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => PageLogin()));
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
                        backgroundImage: NetworkImage(
                            'https://empkp.000webhostapp.com/app/person.png'),
                        // child:
                      ),
                      SizedBox(height: 10),
                      Text(
                        email,
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
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
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
                      child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: listAkun.length,
                          itemBuilder: (BuildContext context, index) {
                            return Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 15),
                                  Text('Nama    : ${listAkun[index].nama}\n'
                                      'Email     : ${listAkun[index].email}\n'
                                      'Divisi     : ${listAkun[index].divisi}\n'
                                      'Level      : ${listAkun[index].level}'),
                                ],
                              ),
                            );
                          }),
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
                            fontSize: 13,
                            fontFamily: 'Ubuntu',
                            color: Colors.black),
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
                  SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  PreferredSize _emptyAppBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(40.0),
      child: AppBar(backgroundColor: Colors.white),
    );
  }
}
