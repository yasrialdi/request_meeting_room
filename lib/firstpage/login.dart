import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:request_meeting_room/account/akun.dart';
import 'package:request_meeting_room/firstpage/RepositoryLogin.dart';
import 'package:request_meeting_room/firstpage/login_register.dart';
import 'package:request_meeting_room/firstpage/nav_bottom_bar.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:request_meeting_room/model/Repository.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  var email = preferences.getString('email');
  runApp(MaterialApp(home: email == null ? PageLogin() : PageProfil()));
}

class PageLogin extends StatefulWidget {
  const PageLogin({Key? key}) : super(key: key);

  @override
  _PageLoginState createState() => _PageLoginState();
}

class _PageLoginState extends State<PageLogin> {
  final formKey = GlobalKey<FormState>();


  TextEditingController usernamectrl = TextEditingController();
  TextEditingController passwordctrl = TextEditingController();

  bool _hide = true;

  final LogUrl = 'https://empkp.000webhostapp.com/app/login.php';




  Future login(String username, String password) async{
    try {
      final response = await http.post(Uri.parse(LogUrl), body: {
        "username": username,
        "password": password,

      });
      var data = json.decode(response.body);
      if(data == "true"){

        SharedPreferences preferences = await SharedPreferences.getInstance();
        preferences.setString('email', usernamectrl.text);

        Fluttertoast.showToast(
            msg: "Login Succes",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.white,
            textColor: Colors.black,
            fontSize: 16
        );

        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('username', usernamectrl.text);

        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (_) => PageNavBottomBar()));


      }else{
        Fluttertoast.showToast(
            msg: "Username & Password Salah",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.white,
            textColor: Colors.black,
            fontSize: 16
        );
      }
    } catch (e) {
      print(e.toString());
    }
  }

  void postLog() async{
    bool response = await login(
        usernamectrl.text,
        passwordctrl.text);
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffDCE5F0),
      appBar: AppBar(
        title: Text(
          'Request Meeting Room Online',
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
        alignment: Alignment.center,
        children: [
          SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    'https://empkp.000webhostapp.com/app/logo.png',
                    height: 150,
                    width: 120,
                  ),
                  SizedBox(height: 80),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    height: 45,
                    child: TextFormField(
                      controller: usernamectrl,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'email/username',
                        hintStyle: TextStyle(fontSize: 13, fontFamily: 'Ubuntu'),
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
                          return 'Email/Username Kosong';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    height: 45,
                    child: TextFormField(
                      controller: passwordctrl,
                      obscureText: _hide,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'password',
                        hintStyle: TextStyle(fontSize: 13, fontFamily: 'Ubuntu'),
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
                    child: MaterialButton(
                      onPressed: () {
                        if(formKey.currentState!.validate()){
                          postLog();
                        }

                      },
                      color: Color(0xff2484DF),
                      height: 45,
                      minWidth: MediaQuery.of(context).size.width,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        'Masuk',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Ubuntu',
                            color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(height: 80),
                  Image.asset(
                    'images/logo.png',
                    height: 64,
                    width: 81,
                    color: Colors.transparent,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Divider(thickness: 0.5, color: Colors.grey),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Belum punya akun?',
                      style: TextStyle(
                        fontSize: 11,
                        fontFamily: 'Ubutu',
                        color: Color(0xff808080),
                      ),
                    ),
                    SizedBox(width: 5),
                    InkWell(
                      onTap: () {
                        //Register
                        Navigator.push(context, MaterialPageRoute(builder: (_)=>PageLoginRegister()));
                      },
                      child: Text(
                        'Buat Akun',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Ubuntu',
                          color: Colors.black,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}