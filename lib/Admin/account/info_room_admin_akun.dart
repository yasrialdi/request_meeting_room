import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:request_meeting_room/Admin/info_room/edit_room.dart';
import 'package:request_meeting_room/Admin/info_room/foto.dart';
import 'package:request_meeting_room/Admin/info_room/tambah_room.dart';
import 'package:request_meeting_room/addbooking/add_booking.dart';
import 'package:request_meeting_room/addbooking/edit_booking.dart';
import 'package:request_meeting_room/firstpage/nav_bottom_bar.dart';
import 'package:request_meeting_room/home/model_home.dart';
import 'package:request_meeting_room/home/repository_home.dart';
import 'dart:async';

import 'package:request_meeting_room/model/Repository.dart';
import 'package:request_meeting_room/model/model_info_room.dart';

class PageRoomListAdmin extends StatefulWidget {
  const PageRoomListAdmin({Key? key}) : super(key: key);
  @override
  _PageRoomListAdminState createState() => _PageRoomListAdminState();
}

class _PageRoomListAdminState extends State<PageRoomListAdmin> {
  List<DataRoom> listRoom = [];
  Repository repository = Repository();
  getDataRoom() async {
    listRoom = await repository.getData();
    setState(() {});
  }

  void _showDialogRoom(DataRoom dataRoom) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text("Detail Booking"),
          content: SingleChildScrollView(
            child: Container(
              width: 500.0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Nama Ruang"
                      "  : "
                      "${dataRoom.ruang_meeting}\n"
                      "Foto Meeting"
                      " : "
                      "${dataRoom.foto_room}\n")
                ],
              ),
            ),
          ),
          actions: <Widget>[
            new FlatButton(
              child: new Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  edit(DataRoom dataRoom) async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PageEditRoom(
          id: dataRoom.id,
          foto: dataRoom.foto_room,
        ),
      ),
    );
  }

  _showAlertDialogDeleteRoom(DataRoom dataRoom) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("Cancel"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = TextButton(
      child: Text("Continue"),
      onPressed: () async {
        bool response = await repository.deleteroom('${dataRoom.id}');
        if (response != '0') {
          Navigator.of(context).pop();
          setState(() {
            Fluttertoast.showToast(
                msg: "Delete Berhasil",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 3,
                backgroundColor: Colors.white,
                textColor: Colors.black,
                fontSize: 16
            );
          });
        } else {
          setState(() {
            Fluttertoast.showToast(
                msg: "Delete Gagal",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 3,
                backgroundColor: Colors.white,
                textColor: Colors.black,
                fontSize: 16
            );
          });
        }
        getDataRoom();
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("AlertDialog"),
      content: Text("Apakah yakin untuk menghapus data booking ?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  void initState() {
    getDataRoom();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffDCE5F0),
      appBar: AppBar(
        title: Text(
          'List Room',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: 'Ubuntu',
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            // color: Colors.white,
          ),
          child: Column(
            children: [
              TextButton.icon(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape:RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                onPressed: () => {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => PageTambahRoom()))
                },
                icon: Icon(Icons.add, color: Colors.black,),
                label: Text('Add Room Meeting',style: TextStyle(
                    color: Colors.black
                ),),
              ),
              ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: listRoom.length,
                  itemBuilder: (BuildContext context, index) {
                    return Container(
                      height: 135,
                      margin: EdgeInsets.only(bottom: 3),
                      child: Card(
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: Image.network("${listRoom[index].foto_room}",
                                  fit: BoxFit.fill,
                                  height: MediaQuery.of(context).size.height,
                                  width: 135,
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 10),
                                      Text(
                                        'Ruang Meeting ${listRoom[index].id}',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontFamily: 'Ubuntu',
                                          color: Colors.black,
                                        ),
                                      ),
                                      SizedBox(height: 30),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          // MaterialButton(
                                          //   onPressed: () {
                                          //     _showDialogRoom(listRoom[index]);
                                          //   },
                                          //   shape: RoundedRectangleBorder(
                                          //     borderRadius:
                                          //     BorderRadius.circular(5),
                                          //   ),
                                          //   height: 15,
                                          //   minWidth: 30,
                                          //   child: Text(
                                          //     'Detail',
                                          //     style: TextStyle(
                                          //         fontSize: 10,
                                          //         fontWeight: FontWeight.bold,
                                          //         fontFamily: 'Ubuntu',
                                          //         color: Colors.white),
                                          //   ),
                                          //   color: Color(0xff2484DF),
                                          // ),
                                          SizedBox(width: 10),
                                          MaterialButton(
                                            onPressed: () {
                                              edit(listRoom[index]);
                                            },
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(5),
                                            ),
                                            height: 15,
                                            minWidth: 30,
                                            child: Text(
                                              'Update',
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'Ubuntu',
                                                  color: Colors.white),
                                            ),
                                            color: Color(0xff2484DF),
                                          ),
                                          SizedBox(width: 10),
                                          MaterialButton(
                                            onPressed: () async {
                                              _showAlertDialogDeleteRoom(
                                                  listRoom[index]);
                                            },
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(5),
                                            ),
                                            height: 15,
                                            minWidth: 30,
                                            child: Text(
                                              'Hapus',
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'Ubuntu',
                                                  color: Colors.white),
                                            ),
                                            color: Colors.red,
                                          ),
                                          SizedBox(height: 10),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ]),
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
