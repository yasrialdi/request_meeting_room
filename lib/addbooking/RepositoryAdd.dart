import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:request_meeting_room/model/model_info_room.dart';

class RepositoryAdd {
  final AddUrl = 'https://empkp.000webhostapp.com/adddatabooking1lagi.php';

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
      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
