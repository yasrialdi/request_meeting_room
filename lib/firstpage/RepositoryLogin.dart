import 'dart:convert';
import 'dart:developer';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:request_meeting_room/firstpage/ModelLogin.dart';
import 'package:request_meeting_room/model/model_info_room.dart';
import 'nav_bottom_bar.dart';


class RepositoryLogin {

  final ReqUrl = 'https://empkp.000webhostapp.com/app/register.php';


  Future postDataReg(
      String nama, String username, String email, String divisi, String password) async {
    try {
      final response = await http.post(Uri.parse(ReqUrl), body: {

        "nama": nama,
        "username": username,
        "email": email,
        "divisi": divisi,
        "password": password,

      });

      if (response.statusCode == 201) {
        Fluttertoast.showToast(
            msg: "Register Succes",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.white,
            textColor: Colors.black,
            fontSize: 16
        );
      } else {
        Fluttertoast.showToast(
            msg: "Register Not Succes",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.white,
            textColor: Colors.black,
            fontSize: 16
        );
      }
    } catch (e) {
      print(e.toString());
    }
  }

}
