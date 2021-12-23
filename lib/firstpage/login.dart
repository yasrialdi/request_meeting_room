import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:request_meeting_room/Admin/nav_bottom_bar.dart';
import 'package:request_meeting_room/User/nav_bottom_bar.dart';
import 'package:request_meeting_room/account/akun.dart';
import 'package:request_meeting_room/firstpage/login_register.dart';
import 'package:request_meeting_room/firstpage/nav_bottom_bar.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:request_meeting_room/home/home.dart';
import 'package:request_meeting_room/Admin/listbooking/list_booking.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  late String nama, username, email, password, divisi, level;
  String alert = "Siap Login";

  TextEditingController usernamectrl = TextEditingController();
  TextEditingController passwordctrl = TextEditingController();

  bool _hide = true;

  final LogUrl = 'https://empkp.000webhostapp.com/app/login.php';


  void loginProcess() async {

    if(formKey.currentState!.validate()){
      // 10.0.2.2 is ip address from android studio's emulator

      final response = await http.post(Uri.parse(LogUrl), body: {
        "username" : usernamectrl.text,
        "password" : passwordctrl.text
      });

      var dataUser = json.decode(response.body);

      if(dataUser.length < 1){
        // if data user is empty or 0
        setState(() {
          Fluttertoast.showToast(
              msg: "Cek Kembali Akun Anda",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 3,
              backgroundColor: Colors.white,
              textColor: Colors.black,
              fontSize: 16
          );
        });
      }else{
        setState(() {
          nama = dataUser[0]["nama"];
          username = dataUser[0]["username"];
          email = dataUser[0]["email"];
          divisi = dataUser[0]["divisi"];
          password = dataUser[0]["password"];
          level = dataUser[0]["level"];
        });

        SharedPreferences preferences = await SharedPreferences.getInstance();
        preferences.setString('nama', nama.toString());
        preferences.setString('username', usernamectrl.text);
        preferences.setString('email', email.toString());
        preferences.setString('divisi', divisi.toString());
        preferences.setString('level', level.toString());

        // move the page according to user status
        if(level == "administrator"){
          // use navigator push replacement so that user can not go back to login page
          Fluttertoast.showToast(
              msg: "Login Berhasil Sebagai Admin",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 3,
              backgroundColor: Colors.white,
              textColor: Colors.black,
              fontSize: 16
          );
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) =>
                      PageNavBottomBarAdmin()),
                  (Route<dynamic> route) => false);
        }else{
          Fluttertoast.showToast(
              msg: "Login Berhasil Sebagai User",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 3,
              backgroundColor: Colors.white,
              textColor: Colors.black,
              fontSize: 16
          );
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) =>
                      PageNavBottomBarUser()),
                  (Route<dynamic> route) => false);
        }
      }
    }
  }

  // void postLog() async{
  //   bool response = await login(
  //       usernamectrl.text,
  //       passwordctrl.text);
  // }
  //
  bool isLoading = false;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffDCE5F0),
      appBar: AppBar(
        title: Text(
          'Login',
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
                    width: 400,
                    height: 45,
                    child: TextFormField(
                      controller: usernamectrl,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'username',
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
                          return 'Username Kosong';
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

                      onPressed: () async {
                        if(formKey.currentState!.validate()){
                          setState(() {
                            isLoading = true;
                          });
                          await Future.delayed(const Duration(seconds: 3));
                          setState(() {
                            isLoading = false;
                          });
                          loginProcess();
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
                          )
                      )
                          : const Text(
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
