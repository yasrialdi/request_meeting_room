import 'package:flutter/material.dart';
import 'package:request_meeting_room/Admin/account/list_user.dart';
import 'package:request_meeting_room/firstpage/RepositoryLogin.dart';
import 'package:request_meeting_room/firstpage/login.dart';
import 'package:request_meeting_room/model/Repository.dart';

import '../nav_bottom_bar_admin.dart';

class PageEditRoom extends StatefulWidget {
  final String id, foto;

  const PageEditRoom({Key? key, required this.id, required this.foto}) : super(key: key);

  @override
  _PageEditRoomState createState() => _PageEditRoomState();
}

class _PageEditRoomState extends State<PageEditRoom> {

  final formKey = GlobalKey<FormState>();

  bool isLoading = false;

  Repository repository = Repository();
  final _ruang = TextEditingController();
  final _foto = TextEditingController();

  // _showAlertDialogAdd() {
  //   // set up the buttons
  //   Widget cancelButton = TextButton(
  //     child: Text("Cancel"),
  //     onPressed: () {
  //       Navigator.of(context).pop();
  //     },
  //   );
  //   Widget continueButton = TextButton(
  //     child: Text("Continue"),
  //     onPressed: () async {
  //
  //       Navigator.of(context).pop();
  //     },
  //   );
  //
  //   // set up the AlertDialog
  //   AlertDialog alert = AlertDialog(
  //     title: Text("Cek Kembali"),
  //     content: Text(
  //         "Nama Ruang" " = " "Ruang Meeting ""${_ruang.text}\n"
  //             "Link Foto" " = " "${_foto.text}\n"
  //     ),
  //     actions: [
  //       cancelButton,
  //       continueButton,
  //     ],
  //   );
  //
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return alert;
  //     },
  //   );
  // }

  @override
  void initState() {
    _ruang.text = widget.id;
    _foto.text = widget.foto;

    super.initState();
  }



    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Color(0xffDCE5F0),
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          title: Text(
            'Add Room',
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
        body: Stack(
          // alignment: Alignment.bottomCenter,
          alignment: Alignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 150),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      width: 400,
                      height: 55,
                      child: TextFormField(
                        controller: _ruang,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          hintText: 'Input Nama Ruang Meeting',
                          hintStyle: TextStyle(fontSize: 13,
                              fontFamily: 'Ubuntu'),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                              color: Colors.black.withOpacity(0.6),
                              width: 1,
                            ),
                          ),
                        ),
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'nama ruang Kosong';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      width: 400,
                      height: 55,
                      child: TextFormField(
                        controller: _foto,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          hintText: 'Input Nama Ruang Meeting',
                          hintStyle: TextStyle(fontSize: 13,
                              fontFamily: 'Ubuntu'),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                              color: Colors.black.withOpacity(0.6),
                              width: 1,
                            ),
                          ),
                        ),
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'nama ruang Kosong';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: MaterialButton(
                        onPressed: () async {
                          if(formKey.currentState!.validate()){
                            setState(() {
                              isLoading = true;
                            });
                            await repository.updateroom(
                                _ruang.text,
                                _ruang.text,
                                _foto.text);
                            Navigator.of(context).pop();
                            setState(() {
                              isLoading = false;
                            });

                          }
                        },
                        color: Color(0xff2484DF),
                        height: 45,
                        minWidth: 360,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: (isLoading)
                            ? const SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 1.5,
                          ),
                        )
                            : const  Text(
                          'Simpan',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Ubuntu',
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }
  }

