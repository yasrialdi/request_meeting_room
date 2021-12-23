import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:request_meeting_room/Admin/nav_bottom_bar_admin.dart';
import 'package:request_meeting_room/User/nav_bottom_bar_user.dart';
import 'package:request_meeting_room/firstpage/boarding_screen.dart';
import 'package:request_meeting_room/firstpage/nav_bottom_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

late String cekLevel, cekEmail;

class PageSplashScreen extends StatefulWidget {
  const PageSplashScreen({Key? key}) : super(key: key);

  @override
  _PageSplashScreenState createState() => _PageSplashScreenState();
}

class _PageSplashScreenState extends State<PageSplashScreen> {



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
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) =>
                    PageOnBoardingScreen()),
                (Route<dynamic> route) => false);
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
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) =>
                      PageNavBottomBarAdmin()),
                  (Route<dynamic> route) => false);
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
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) =>
                      PageNavBottomBarUser()),
                  (Route<dynamic> route) => false);
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
                Image.network(
                  'https://empkp.000webhostapp.com/app/logo.png',
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
