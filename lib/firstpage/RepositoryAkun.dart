import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:request_meeting_room/firstpage/Model_Akun.dart';

class RepositoryAkun {
  final baseUrl = 'http://123.231.163.70:3530/app/datagetlogin.php';

  Future getDataAkun() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));

      if (response.statusCode == 200) {
        Iterable it = jsonDecode(response.body);
        List<DataAkun> dataAkun = it.map((e) => DataAkun.fromJson(e)).toList();
        return dataAkun;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
