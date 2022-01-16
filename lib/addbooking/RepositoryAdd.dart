import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:request_meeting_room/model/model_info_room.dart';

class RepositoryAdd {
  final AddUrl = 'http://123.231.163.70:3530/app/adddatabooking1lagi.php';

  Future postDataAdd(
      String judul, String ruangan, String mulai, String selesai, String jumlah, String catatan) async {
    try {
      final response = await http.post(Uri.parse(AddUrl), body: {

        "judul_meeting": judul,
        "ruang_meeting": ruangan,
        "mulai": mulai,
        "selesai": selesai,
        "jumlah_peserta": jumlah,
        "catatan": catatan,
      });
      if (response != '0') {
        Fluttertoast.showToast(
            msg: "Data Booking Berhasil Ditambahkan",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.white,
            textColor: Colors.black,
            fontSize: 16
        );
      } else {
        Fluttertoast.showToast(
            msg: "Data Booking Gagal Ditambahkan",
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
