import 'dart:convert';
import 'dart:developer';
import 'package:intl/intl.dart';

import 'package:http/http.dart' as http;
import 'package:request_meeting_room/firstpage/Model_Akun.dart';

class RepositoryAkun {
  final baseUrl = 'https://empkp.000webhostapp.com/app/datagetlogin.php';

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
