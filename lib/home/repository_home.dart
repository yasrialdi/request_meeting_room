import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:request_meeting_room/home/model_home.dart';

class RepositoryHome {
  final baseUrl = 'https://empkp.000webhostapp.com/app/datagetnew.php';
  final UrlHistory = 'https://empkp.000webhostapp.com/app/datagethistory.php';
  final UrlDeleteBooking = 'https://empkp.000webhostapp.com/app/deletedatabooking.php';
  final UrlUpdateBooking = 'https://empkp.000webhostapp.com/app/updatedatabooking.php';

  Future<List<DataHome>> getDataHome() async {
    List<DataHome> dataHome = [];

    try {
      final response = await http.get(Uri.parse(baseUrl));
      Iterable it = jsonDecode(response.body);

      dataHome.addAll(DataHome.fromJsonToList(it));
    } catch (e) {
      log(e.toString(), name: 'getDataHome');
    }

    return dataHome;
  }

  Future<List<DataHome>> getDataBookingHistory() async {
    List<DataHome> dataHome = [];

    try {
      final response = await http.get(Uri.parse(UrlHistory));
      Iterable it = jsonDecode(response.body);

      dataHome.addAll(DataHome.fromJsonToList(it));
    } catch (e) {
      log(e.toString(), name: 'getDataBookingHistory');
    }

    return dataHome;
  }

  Future<bool> deletebooking(String id) async {
    try {
      final response = await http
          .post(Uri.parse(UrlDeleteBooking), body: {'id_booking': id});

      if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {
      log(e.toString(), name: 'deletebooking');
    }
    return false;
  }

  Future<bool> updatebooking(
      String id, String judul, String ruangan, String mulai, String selesai, String jumlah, String catatan) async {
    try {
      final response = await http
          .post(Uri.parse(UrlUpdateBooking), body: {
        "id_booking": id,
        "judul_meeting": judul,
        "ruang_meeting": ruangan,
        "mulai": mulai,
        "selesai": selesai,
        "jumlah_peserta": jumlah,
        "catatan": catatan,
      });

      if (response.statusCode == 200) {
        return true;
      }else{
        return false;
      }
    } catch (e) {
      log(e.toString(), name: 'deletebooking');
    }
    return false;
  }
}
