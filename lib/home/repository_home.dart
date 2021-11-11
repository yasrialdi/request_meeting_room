import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:request_meeting_room/home/model_home.dart';

class RepositoryHome {
  final baseUrl = 'https://empkp.000webhostapp.com/datagetnew.php';
  final UrlHistory = 'https://empkp.000webhostapp.com/datagethistory.php';
  final UrlDeleteBooking = 'https://empkp.000webhostapp.com/deletedatabooking.php';

  Future getDataHome() async{
    try{
      final response = await http.get(Uri.parse(baseUrl));

      if(response.statusCode == 200 ){
        Iterable it = jsonDecode(response.body);
        List<DataHome> datahome = it.map((e) => DataHome.fromJson(e)).toList();
        return datahome;
      }
    }catch (e){
      print(e.toString());
    }
  }

  Future getDataBookingHistory() async{
    try{
      final response = await http.get(Uri.parse(UrlHistory));

      if(response.statusCode == 200 ){
        Iterable it = jsonDecode(response.body);
        List<DataHome> datahome = it.map((e) => DataHome.fromJson(e)).toList();
        return datahome;
      }
    }catch (e){
      print(e.toString());
    }
  }

  Future deletebooking(String id) async{
    try{
      final response = await http.post(Uri.parse(UrlDeleteBooking), body: {'id_booking': id});

      if(response.statusCode == 200){
        return true;
      }else{
        return false;
      }

    }catch(e){
      print(e.toString());
    }
  }
}