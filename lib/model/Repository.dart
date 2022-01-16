import 'dart:convert';
import 'dart:developer';


import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:request_meeting_room/model/model_info_room.dart';

class Repository {
  final baseUrl = 'http://123.231.163.70:3530/app/datagetroom.php';
  var UrlAddRoom = Uri.parse('http://123.231.163.70:3530/app/addroom.php');
  final UrlDeleteRoom = 'http://123.231.163.70:3530/app/deletedataroom.php';
  final UrlUpdateRoom = 'http://123.231.163.70:3530/app/updatedataroom.php';

  Future getData() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));

      if (response.statusCode == 200) {
        Iterable it = jsonDecode(response.body);
        List<DataRoom> dataroom = it.map((e) => DataRoom.fromJson(e)).toList();
        return dataroom;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future postDataTambahRoom(
      String id, String ruang, String foto) async {
    try {
      // final response = await http.post(Uri.parse(UrlAddRoom), body: {
      //
      //   "id": id,
      //   "ruang": ruang,
      //   "foto_room": foto,
      // });

      var request = new http.MultipartRequest("POST", UrlAddRoom)
      ..fields["id"] = id
      ..fields["ruang"] = ruang
      ..files.add(await http.MultipartFile.fromPath("foto_room", "${foto}"));

      var response = await request.send();
      if (response.statusCode == 201) {
        Fluttertoast.showToast(
            msg: "Add Data Room Succes",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.white,
            textColor: Colors.black,
            fontSize: 16
        );
      } else {
        Fluttertoast.showToast(
            msg: "Add Data Room Failed",
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

  Future<bool> deleteroom(String id) async {
    try {
      final response = await http
          .post(Uri.parse(UrlDeleteRoom), body: {'id': id});

      if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {
      log(e.toString(), name: 'deleteroom');
    }
    return false;
  }

  Future<bool> updateroom(
      String id, String ruang, String foto) async {
    try {
      final response = await http
          .post(Uri.parse(UrlUpdateRoom), body: {
        "id": id,
        "ruang": ruang,
        "foto_room": foto,
      });

      if (response.statusCode == 200) {
        Fluttertoast.showToast(
            msg: "Update Data Room Berhasil",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.white,
            textColor: Colors.black,
            fontSize: 16
        );
      } else {
        Fluttertoast.showToast(
            msg: "Update Data Room Gagal",
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
