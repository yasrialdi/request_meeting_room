import 'package:flutter/material.dart';
import 'package:request_meeting_room/Admin/account/repository_user.dart';
import 'package:request_meeting_room/Admin/nav_bottom_bar_admin.dart';
import 'package:request_meeting_room/firstpage/RepositoryLogin.dart';
import 'package:request_meeting_room/firstpage/login.dart';

class PageEditUser extends StatefulWidget {
  final String id, nama, username, email, divisi, password, level;

  const PageEditUser({Key? key,
    required this.nama,
    required this.username,
    required this.email,
    required this.divisi,
    required this.password,
    required this.level,
    required this.id
  }) : super(key: key);

  @override
  _PageEditUserState createState() => _PageEditUserState();
}

class _PageEditUserState extends State<PageEditUser> {

  final formKey = GlobalKey<FormState>();


  bool _hide = true;
  bool _rehide = true;

  RepositoryUser repository = RepositoryUser();
  final _nama = TextEditingController();
  final _username = TextEditingController();
  final _email = TextEditingController();
  final _divisi = TextEditingController();
  final _password = TextEditingController();
  final _repassword = TextEditingController();

  List<String> listDivisi = ["ICT", "Finance", "HRD"];
  List<String> listLevel = ["user", "administrator"];

  String nDivisi = "ICT";
  String nLevel = "user";
  int? nilaidivisi;
  int? nilailevel;

  void pilihDivisi(String value) {
    setState(() {
      nDivisi = value;
    });
  }

  void pilihLevel(String value) {
    setState(() {
      nLevel = value;
    });
  }





  _showAlertDialogAdd() {
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
        await repository.updateuser(
          widget.id.toString(),
            _nama.text,
            _username.text,
            _email.text,
            nDivisi,
            _password.text,
            nLevel
        );
        Navigator.of(context).pop();
        Navigator.of(context).pop();

      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Cek Kembali"),
      content: Text(
          "Nama" "          = " "${_nama.text}\n"
              "Username" "  = " "${_username.text}\n"
              "Email" "          = " "${_email.text}\n"
              "Divisi" "           = " "$nDivisi\n"
              "Password" "   = " "${_password.text}\n"
              "Level" "           = " "$nLevel\n"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  void initState() {
    _nama.text = widget.nama;
    _username.text = widget.username;
    _email.text = widget.email;
    nDivisi = widget.divisi;
    _password.text = widget.password;
    nLevel = widget.level;

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
          'Register',
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
                  Image.asset(
                    'images/logo.png',
                    height: 150,
                    width: 120,
                  ),
                  SizedBox(height: 80),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    width: 400,
                    height: 45,
                    child: TextFormField(
                      controller: _nama,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'nama',
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
                          return 'nama Kosong';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    width: 400,
                    height: 45,
                    child: TextFormField(
                      controller: _username,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'username',
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
                          return 'Username/nama Kosong';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    width: 400,
                    height: 45,
                    child: TextFormField(
                      controller: _email,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'email',
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
                          return 'Email Kosong';
                        }
                        return null;
                      },
                    ),
                  ),

                  SizedBox(height: 10),
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      width: 400,
                      height: 55,
                      child: Row(
                        children: [
                          Expanded(
                            child: DropdownButtonFormField<String>(
                              value: nDivisi,
                              onChanged: (String ? value) {
                                pilihDivisi(value ?? "");
                                nilaidivisi = listDivisi.indexOf(value ?? "");
                              },
                              items: listDivisi.map(
                                      (String value) {
                                    return DropdownMenuItem( //tampilan isi data dropdown
                                      child: Text(value),
                                      value: value,
                                    );
                                  }
                              ).toList(),
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                hintStyle: TextStyle(
                                    fontSize: 8, fontFamily: 'Ubuntu'),
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
                            ),
                          ),
                        ],
                      )
                  ),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    width: 400,
                    height: 55,
                    child: TextFormField(
                      controller: _password,
                      obscureText: _hide,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'password',
                        hintStyle: TextStyle(fontSize: 13,
                            fontFamily: 'Ubuntu'),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                            color: Color(0xffBFBFBF),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                            color: Colors.black.withOpacity(0.6),
                            width: 1,
                          ),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _hide ? Icons.visibility_off : Icons.visibility,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            setState(() {
                              _hide = !_hide;
                            });
                          },
                        ),
                      ),
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'Password Kosong';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 10),

                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      width: 400,
                      height: 55,
                      child: Row(
                        children: [
                          Expanded(
                            child: DropdownButtonFormField<String>(
                              value: nLevel,
                              onChanged: (String ? value) {
                                pilihLevel(value ?? "");
                                nilailevel = listLevel.indexOf(value ?? "");
                              },
                              items: listLevel.map(
                                      (String value) {
                                    return DropdownMenuItem( //tampilan isi data dropdown
                                      child: Text(value),
                                      value: value,
                                    );
                                  }
                              ).toList(),
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                hintStyle: TextStyle(
                                    fontSize: 8, fontFamily: 'Ubuntu'),
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
                            ),
                          ),
                        ],
                      )
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: MaterialButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          _showAlertDialogAdd();

                        }
                      },
                      color: Color(0xff2484DF),
                      height: 45,
                      minWidth: 360,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        'Simpan',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Ubuntu',
                            color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(height: 80),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

