import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:request_meeting_room/Admin/nav_bottom_bar_admin.dart';
import 'package:request_meeting_room/User/nav_bottom_bar_user.dart';
import 'package:request_meeting_room/firstpage/boarding_screen.dart';
import 'package:request_meeting_room/firstpage/nav_bottom_bar.dart';
import 'package:request_meeting_room/home/model_home.dart';
import 'package:request_meeting_room/home/repository_home.dart';
import 'package:shared_preferences/shared_preferences.dart';

late String cekLevel, cekEmail;

class PageSplashScreen extends StatefulWidget {
  const PageSplashScreen({Key? key}) : super(key: key);

  @override
  _PageSplashScreenState createState() => _PageSplashScreenState();
}

class _PageSplashScreenState extends State<PageSplashScreen> {

  List<DataHome> listHome = [];
  RepositoryHome repository = RepositoryHome();
  getDataHome() async {
    listHome = await repository.getDataHome();
    setState(() {});
  }

  Future getEmail() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    var ambilEmail = preferences.getString('username');
    var ambilLevel = preferences.getString('level');
    setState(() {
      cekEmail = ambilEmail;
      cekLevel = ambilLevel;
    });
  }


  startSplashScreen() async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, () {

      if(cekEmail == null){
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => PageOnBoardingScreen()));
      }else{
        if(cekLevel == "administrator"){
          // use navigator push replacement so that user can not go back to login page
          Fluttertoast.showToast(
              msg: "Login Sebagai Admin",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 3,
              backgroundColor: Colors.white,
              textColor: Colors.black,
              fontSize: 16
          );
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => PageNavBottomBarAdmin()));
          getDataHome();
        }else{
          Fluttertoast.showToast(
              msg: "Login Sebagai User",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 3,
              backgroundColor: Colors.white,
              textColor: Colors.black,
              fontSize: 16
          );
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => PageNavBottomBarUser()));
          getDataHome();
        }
      }



      // Navigator.pushAndRemoveUntil(
      //     context,
      //     MaterialPageRoute(
      //         builder: (BuildContext context) =>
      //         cekEmail == null ? PageOnBoardingScreen() : PageNavBottomBar()),
      //         (Route<dynamic> route) => false);
    });
  }

  @override

  void initState() {
    startSplashScreen();
    getEmail();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'images/logo.png',
                  height: 150,
                  width: 200,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
