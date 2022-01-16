import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:request_meeting_room/Admin/account/edit_user.dart';
import 'package:request_meeting_room/Admin/account/repository_user.dart';
import 'package:request_meeting_room/Admin/account/tambah_user.dart';
import 'package:request_meeting_room/Admin/info_room/tambah_room.dart';

import 'model_user.dart';

class PageUserListAdmin extends StatefulWidget {
  const PageUserListAdmin({Key? key}) : super(key: key);
  @override
  _PageUserListAdminState createState() => _PageUserListAdminState();
}

class _PageUserListAdminState extends State<PageUserListAdmin> {
  List<DataUser> listUser = [];
  RepositoryUser repository = RepositoryUser();
  getDataUser() async {
    listUser = await repository.getData();
    setState(() {});
  }

  void _showDialogUser(DataUser dataUser) {
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
                      "${dataUser.nama}\n"
                      "Foto Meeting"
                      " : "
                      "${dataUser.username}\n")
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

  edit(DataUser dataUser) async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PageEditUser(
          id: dataUser.id,
          nama: dataUser.nama,
          username: dataUser.username,
          email: dataUser.email,
          divisi: dataUser.divisi,
          password: dataUser.password,
          level: dataUser.level,
        ),
      ),
    );
  }

  _showAlertDialogDeleteUser(DataUser dataUser) {
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
        bool response = await repository.deleteuser('${dataUser.id}');
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
        getDataUser();
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("AlertDialog"),
      content: Text("Apakah yakin untuk menghapus data user ?"),
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
    getDataUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffDCE5F0),
      appBar: AppBar(
        title: Text(
          'List User',
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
                      context, MaterialPageRoute(builder: (_) => PageTambahUser()))
                },
                icon: Icon(Icons.add, color: Colors.black,),
                label: Text('Add New User',style: TextStyle(
                    color: Colors.black
                ),),
              ),
              ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: listUser.length,
                  itemBuilder: (BuildContext context, index) {
                    return Container(
                      height: 160,
                      margin: EdgeInsets.only(bottom: 3),
                      child: Card(
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              // ClipRRect(
                              //   borderRadius: BorderRadius.circular(5),
                              //   child: Image.network("${listUser[index].foto_room}",
                              //     fit: BoxFit.fill,
                              //     height: MediaQuery.of(context).size.height,
                              //     width: 135,
                              //   ),
                              // ),
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Nama : ${listUser[index].nama}',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontFamily: 'Ubuntu',
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text(
                                        'Username : ${listUser[index].username}',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontFamily: 'Ubuntu',
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text(
                                        'Email : ${listUser[index].email}',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontFamily: 'Ubuntu',
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text(
                                        'Divisi : ${listUser[index].divisi}',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontFamily: 'Ubuntu',
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text(
                                        'Level : ${listUser[index].level}',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontFamily: 'Ubuntu',
                                          color: Colors.black,
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          // MaterialButton(
                                          //   onPressed: () {
                                          //     _showDialogUser(listUser[index]);
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
                                              edit(listUser[index]);
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
                                              _showAlertDialogDeleteUser(listUser[index]);
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
