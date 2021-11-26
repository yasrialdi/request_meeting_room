import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:request_meeting_room/model/model_info_room.dart';

class RepositoryTes {
  final AddUrl = 'https://empkp.000webhostapp.com/app/adddata.php';

  Future postData(
      String ruangan, String hari, String jam, String gambar) async {
    try {
      final response = await http.post(Uri.parse(AddUrl), body: {
        "ruangan": ruangan,
        "hari": hari,
        "jam": jam,
        "gambar": gambar
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
