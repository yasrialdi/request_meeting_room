import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:request_meeting_room/model/model_info_room.dart';

class Repository {
  final baseUrl = 'https://empkp.000webhostapp.com/datagetroom.php';

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
}
