import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:request_meeting_room/Admin/account/model_user.dart';

class RepositoryUser{
  final UrlGetUser = 'http://123.231.163.70:3530/app/getdataakun.php';
  final UrlDeleteUser = 'http://123.231.163.70:3530/app/deletedatauser.php';
  final UrlUpdateUser = 'http://123.231.163.70:3530/app/updatedatauser.php';

  Future getData() async {
    try {
      final response = await http.get(Uri.parse(UrlGetUser));

      if (response.statusCode == 200) {
        Iterable it = jsonDecode(response.body);
        List<DataUser> dataUser = it.map((e) => DataUser.fromJson(e)).toList();
        return dataUser;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<bool> deleteuser(String id) async {
    try {
      final response = await http
          .post(Uri.parse(UrlDeleteUser), body: {'id': id});

      if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {
      log(e.toString(), name: 'deleteuser');
    }
    return false;
  }

  Future<bool> updateuser(
      String id ,String nama, String username, String email, String divisi, String password, String level) async {
    try {
      final response = await http
          .post(Uri.parse(UrlUpdateUser), body: {
        "id": id,
        "nama": nama,
        "username": username,
        "email": email,
        "divisi": divisi,
        "password": password,
        "level": level,
      });

      if (response.statusCode == 200) {
        Fluttertoast.showToast(
            msg: "Update Data User Berhasil",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.white,
            textColor: Colors.black,
            fontSize: 16
        );
      } else {
        Fluttertoast.showToast(
            msg: "Update Data User Gagal",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.white,
            textColor: Colors.black,
            fontSize: 16
        );
      }
    } catch (e) {
      log(e.toString());
    }
    return false;
  }
}
