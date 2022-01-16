import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:http/http.dart' as http;
import 'package:request_meeting_room/Admin/account/model_user.dart';
import 'package:request_meeting_room/Admin/account/repository_user.dart';
import 'package:request_meeting_room/Admin/account/tambah_user.dart';
import 'package:request_meeting_room/Admin/nav_bottom_bar_admin.dart';
import 'package:request_meeting_room/model/Repository.dart';

import 'edit_user.dart';

class PageListUser extends StatefulWidget {
  const PageListUser({Key? key}) : super(key: key);

  @override
  _PageListUserState createState() => _PageListUserState();
}

class _PageListUserState extends State<PageListUser> {
  List dataUser = [];
  // List<DataUser> listUser = [];
  // RepositoryUser repository = RepositoryUser();


  final getUrl = 'http://123.231.163.70:3530/app/getdataakun.php';
  final urlDeleteUser = 'http://123.231.163.70:3530/app/deletedatauser.php';

  void ambilUser() async {
    var res = await http.get(Uri.parse(getUrl));

    setState(() {
      dataUser = json.decode(res.body);
    });
  }

  // Future<bool> deletebooking(String username) async {
  //   try {
  //     final response = await http
  //         .post(Uri.parse(urlDeleteUser), body: {'username': username});
  //
  //     if (response.statusCode == 200) {
  //       return true;
  //     }
  //   } catch (e) {
  //     log(e.toString(), name: 'deleteuser');
  //   }
  //   return false;
  // }

  Repository repository = Repository();
  // _showAlertDialogDelete(DataUser dataUser)
  _showAlertDialogDelete(item) {
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
        var map = Map<String, dynamic>();
        map['id'] = item["id"];
        final response = await http.post(Uri.parse(urlDeleteUser), body: map);
        //
        // if (200 == response.statusCode) {
        //   Navigator.of(context).pop();
        // } else {
        //   print('Delete data failed');
        // }
        // ambilUser();
        // bool response = await repository.deleteroom('${dataRoom.id}');
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
            tabelUser();
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
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("AlertDialog"),
      content: Text("Apakah yakin untuk menghapus data user tersebut ?"),
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
    ambilUser();
    super.initState();
  }

  SingleChildScrollView tabelUser() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
            headingRowColor: MaterialStateColor.resolveWith((states) => Colors.white),
            headingTextStyle: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),

            columns: [
              // DataColumn(label: Text(" ")),
              DataColumn(label: Text("Nama")),
              DataColumn(label: Text("Username")),
              DataColumn(label: Text("Email")),
              DataColumn(label: Text("Divisi")),
              DataColumn(label: Text("Level")),
              DataColumn(label: Text("Aksi")),
            ],
            rows: dataUser
                .map((item) => DataRow(cells: <DataCell>[
                      // DataCell(Text()),
                      DataCell(Text(item["nama"])),
                      DataCell(Text(item["username"])),
                      DataCell(Text(item["email"])),
                      DataCell(Text(item["divisi"])),
                      DataCell(Text(item["level"])),
                      DataCell(Row(
                        children: [
                          MaterialButton(
                            onPressed: () {
                              Navigator.push(
                                  context, MaterialPageRoute(builder: (_) => PageEditUser(
                                id: item["id"],
                                nama: item["nama"],
                                username: item["username"],
                                email: item["email"],
                                divisi: item["divisi"],
                                password: item["password"],
                                level: item["level"],
                              )));
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
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
                              _showAlertDialogDelete(item);
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
                        ],
                      )

                      )
                    ]))
                .toList()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffDCE5F0),
      appBar: AppBar(
        // leading: Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: GestureDetector(
        //     onTap: (){
        //       Navigator.pushAndRemoveUntil(
        //           context,
        //           MaterialPageRoute(
        //               builder: (BuildContext context) =>
        //                   PageNavBottomBarAdmin()),
        //               (Route<dynamic> route) => false);
        //     },
        //     child: Icon(Icons.arrow_back),
        //   ),
        // ),
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: Text(
          'Account',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: 'Ubuntu',
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(8),
        child: ListView(
          children: [
            tabelUser(),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
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
                    context, MaterialPageRoute(builder: (_) => PageTambahUser()))
                    },
                    icon: Icon(Icons.add, color: Colors.black,),
                    label: Text('Add User',style: TextStyle(
                      color: Colors.black
                    ),),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
