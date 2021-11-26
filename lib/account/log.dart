// import 'package:flutter/material.dart';
// import 'package:flutter_login/flutter_login.dart';
// import 'package:request_meeting_room/firstpage/nav_bottom_bar.dart';
//
//
// const users = const {
//   'aldi@gmail.com': '12345',
//   'hunter@gmail.com': 'hunter',
// };
//
// class LoginScreen extends StatelessWidget {
//   Duration get loginTime => Duration(milliseconds: 2250);
//
//   Future<String?> _authUser(LoginData data) {
//     debugPrint('Name: ${data.name}, Password: ${data.password}');
//     return Future.delayed(loginTime).then((_) {
//       if (!users.containsKey(data.name)) {
//         return 'User not exists';
//       }
//       if (users[data.name] != data.password) {
//         return 'Password does not match';
//       }
//       return null;
//     });
//   }
//
//
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return FlutterLogin(
//       title: 'ReMO',
//       onLogin: _authUser,
//       onSubmitAnimationCompleted: () {
//         Navigator.of(context).pushReplacement(MaterialPageRoute(
//           builder: (context) => PageNavBottomBar(),
//         ));
//       },
//       onRecoverPassword:  (LoginData ) {  }, onSignup: (LoginData ) {  },
//     );
//   }
// }