import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:request_meeting_room/Admin/info_room/tambah_room.dart';
import 'package:request_meeting_room/inforoom/detail_room.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:request_meeting_room/model/Repository.dart';
import 'package:request_meeting_room/model/model_info_room.dart';

class PageInfoRoomAkunAdmin extends StatefulWidget {
  const PageInfoRoomAkunAdmin({Key? key}) : super(key: key);

  @override
  _PageInfoRoomAkunAdminState createState() => _PageInfoRoomAkunAdminState();
}

class _PageInfoRoomAkunAdminState extends State<PageInfoRoomAkunAdmin> {
  List<DataRoom> listRoom = [];
  Repository repository = Repository();

  getData() async {
    listRoom = await repository.getData();
    setState(() {});
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffDCE5F0),
      appBar: AppBar(
        title: Text(
          'Info Room Meeting',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            fontFamily: 'Ubuntu',
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,),
      body: Container(
        child: ListView.builder(
              itemCount: listRoom.length,
              itemBuilder: (BuildContext context, index) {
                return GestureDetector(
                  onTap: (){
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => PageDetailRoom()));
                  },
                  child: Container(
                    width: 400,
                    margin: EdgeInsets.all(20),
                    height: 250,
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network('${listRoom[index].foto_room}',
                                fit: BoxFit.cover),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            height: 80,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                    colors: [
                                      Colors.black.withOpacity(0.8),
                                      Colors.transparent,
                                    ]
                                )
                            ),
                          ),
                        ),
                        Positioned(
                          left: 10,
                          bottom: 5,
                          child: Text(
                            '${listRoom[index].ruang_meeting}',
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'ubuntu',
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
      ),
    );
  }
}
