import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:request_meeting_room/inforoom/detail_room.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:request_meeting_room/model/Repository.dart';
import 'package:request_meeting_room/model/model_info_room.dart';

class PageInfoRoom extends StatefulWidget {
  const PageInfoRoom({Key? key}) : super(key: key);

  @override
  _PageInfoRoomState createState() => _PageInfoRoomState();
}

class _PageInfoRoomState extends State<PageInfoRoom> {
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
      body: SingleChildScrollView(
        child: Container(
          child: InkWell(onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => PageDetailRoom()));
          },

            child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: listRoom.length,
                itemBuilder: (BuildContext context, index) {
                  return Container(

                    child: Card(
                      child: Column(
                        children: [
                          Image.network('${listRoom[index].foto_room}'),
                          SizedBox(height: 8),
                          Text(
                            '${listRoom[index].ruang_meeting}',
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'ubuntu',
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 8)
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ),
      ),
    );
  }
}
