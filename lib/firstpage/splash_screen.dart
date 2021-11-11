import 'dart:async';

import 'package:flutter/material.dart';
import 'package:request_meeting_room/firstpage/boarding_screen.dart';

class PageSplashScreen extends StatefulWidget {
  const PageSplashScreen({Key? key}) : super(key: key);

  @override
  _PageSplashScreenState createState() => _PageSplashScreenState();
}

class _PageSplashScreenState extends State<PageSplashScreen> {
  startSplashScreen() async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => PageOnBoardingScreen()));
    });
  }

  @override

  void initState() {
    startSplashScreen();
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
