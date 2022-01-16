import 'package:flutter/material.dart';
import 'package:request_meeting_room/addbooking/add_booking.dart';
import 'package:request_meeting_room/addbooking/edit_booking.dart';
import 'package:request_meeting_room/firstpage/nav_bottom_bar.dart';
import 'package:request_meeting_room/home/model_home.dart';
import 'package:request_meeting_room/home/repository_home.dart';
import 'dart:async';
import 'list_booking_admin.dart';

class PageOnBookingAdmin extends StatefulWidget {
  const PageOnBookingAdmin(TabController? tabcontroll, {Key? key}) : super(key: key);
  @override
  _PageOnBookingAdminState createState() => _PageOnBookingAdminState();
}

class _PageOnBookingAdminState extends State<PageOnBookingAdmin> {
  List<DataHome> listHome = [];
  RepositoryHome repository = RepositoryHome();
  getDataHome() async {
    listHome = await repository.getDataHome();
    setState(() {});
  }

  bool isLoading = true;

  void _showDialogBooking(DataHome dataHome) {
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
                  Text("Judul Meeting"
                      "  : "
                      "${dataHome.judul}\n"
                      "Ruang Meeting"
                      " : "
                      "${dataHome.ruang}\n"
                      "Mulai Meeting"
                      "  : "
                      "${dataHome.mulai} WIB\n"
                      "Selesai Meeting"
                      " : "
                      "${dataHome.selesai} WIB\n"
                      "Jumlah Peserta Meeting"
                      " : "
                      "${dataHome.jml_peserta}\n"
                      "Catatan Meeting"
                      " : "
                      "${dataHome.catatan}\n")
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

  edit(DataHome dataHome) async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PageEditBooking(
          id: dataHome.id,
          judul: dataHome.judul,
          ruang: dataHome.ruang,
          mulai: dataHome.mulai,
          selesai: dataHome.selesai,
          jumlahpst: dataHome.jml_peserta,
          catatan: dataHome.catatan,
        ),
      ),
    );
  }

  _showAlertDialogDeleteUser(DataHome dataHome) {
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
        bool response = await repository.deletebooking('${dataHome.id}');
        if (response != '0') {
          Navigator.of(context).pop();
        } else {
          print('Delete data failed');
        }
        getDataHome();
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
    getDataHome();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffDCE5F0),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            // color: Colors.white,
          ),
          child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: listHome.length,
              itemBuilder: (BuildContext context, index) {
                return  Container(
                  height: 135,
                  margin: EdgeInsets.only(bottom: 3),
                  child: Card(
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Image.network(
                              '${listHome[index].foto}',
                              fit: BoxFit.cover,
                              height: MediaQuery.of(context).size.height,
                              width: 115,
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
                                  Text(
                                    'Ruang Meeting ${listHome[index].ruang}',
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontFamily: 'Ubuntu',
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(height: 18),
                                  Row(
                                    children: [
                                      Text(
                                        '${listHome[index].mulai}',
                                        style: TextStyle(
                                          fontSize: 11,
                                          fontFamily: 'Ubuntu',
                                          color: Color(0xff928B8B),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 1),
                                  Row(
                                    children: [
                                      Text(
                                        '${listHome[index].selesai}',
                                        style: TextStyle(
                                          fontSize: 11,
                                          fontFamily: 'Ubuntu',
                                          color: Color(0xff928B8B),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 1),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      MaterialButton(
                                        onPressed: () {
                                          _showDialogBooking(listHome[index]);
                                        },
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(5),
                                        ),
                                        height: 15,
                                        minWidth: 30,
                                        child: Text(
                                          'Detail',
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
                                        onPressed: () {
                                          edit(listHome[index]);
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
                                          _showAlertDialogDeleteUser(
                                              listHome[index]);
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
        ),
      ),
    );
  }
}
