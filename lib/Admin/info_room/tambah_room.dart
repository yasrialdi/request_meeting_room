import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:request_meeting_room/Admin/nav_bottom_bar_admin.dart';
import 'package:request_meeting_room/model/Repository.dart';
import 'package:http/http.dart' as http;
import "package:async/async.dart";
import 'package:path/path.dart';


class PageTambahRoom extends StatefulWidget {
  const PageTambahRoom({Key? key}) : super(key: key);

  @override
  _PageTambahRoomState createState() => _PageTambahRoomState();
}

class _PageTambahRoomState extends State<PageTambahRoom> {

  File? _image  ;

  bool isLoading = false;

  Future<void> openCamera() async {
    final pickedImage = await ImagePicker().getImage(source: ImageSource.gallery);

    setState(() {
      _image = File(pickedImage!.path);
    });
  }

  final formKey = GlobalKey<FormState>();

  getData() async {
    await repository.getData();
  }

  Repository repository = Repository();
  final _ruang = TextEditingController();
  final _foto = TextEditingController();

  var UrlAddRoom = Uri.parse('http://123.231.163.70:3530/app/addroom.php');

  // void postReg() async{
  //   bool response = await repository.postDataTambahRoom(
  //       _ruang.text,
  //       _ruang.text,
  //       _image!.path
  //   );
  // }

  Future addProduct() async{
// ignore: deprecated_member_use
    var stream= new http.ByteStream(DelegatingStream.typed(_image!.openRead()));
    var length= await _image!.length();
    var uri = Uri.parse("http://123.231.163.70:3530/app/addroom.php");

    var request = new http.MultipartRequest("POST", uri);

    var multipartFile = new http.MultipartFile("foto_room", stream, length, filename: basename(_image!.path));

    request.files.add(multipartFile);
    request.fields['id'] = _ruang.text;
    request.fields['ruang'] = _ruang.text;

    var respond = await request.send();
    if(respond.statusCode==200){
      print("Image Uploaded");
    }else{
      print("Upload Failed");
    }
  }

  // Future postDataTambahRoom() async {
  //   try {
  //     // final response = await http.post(Uri.parse(UrlAddRoom), body: {
  //     //
  //     //   "id": id,
  //     //   "ruang": ruang,
  //     //   "foto_room": foto,
  //     // });
  //
  //     var request = new http.MultipartRequest("POST", UrlAddRoom)
  //       ..fields["id"] = _ruang.text
  //       ..fields["ruang"] = _ruang.text
  //       ..files.add(await http.MultipartFile.fromPath("foto_room", "${_image!.path}"));
  //
  //     var response = await request.send();
  //     if (response.statusCode == 201) {
  //       Fluttertoast.showToast(
  //           msg: "Add Data Room Succes",
  //           toastLength: Toast.LENGTH_SHORT,
  //           gravity: ToastGravity.CENTER,
  //           timeInSecForIosWeb: 3,
  //           backgroundColor: Colors.white,
  //           textColor: Colors.black,
  //           fontSize: 16
  //       );
  //     } else {
  //       Fluttertoast.showToast(
  //           msg: "Add Data Room Failed",
  //           toastLength: Toast.LENGTH_SHORT,
  //           gravity: ToastGravity.CENTER,
  //           timeInSecForIosWeb: 3,
  //           backgroundColor: Colors.white,
  //           textColor: Colors.black,
  //           fontSize: 16
  //       );
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }

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
                      height: 45,
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
                    SizedBox(height: 10),

                    Container(
                      child: Center(
                        child: _image == null? Text("No Image"): Image.file(_image!,height: 300,width: 300,),
                      ),
                    ),
                    SizedBox(height: 10),

                    InkWell(
                      onTap: (){
                        openCamera();
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white

                        ),
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        width: 400,
                        height: 45,
                        child: Center(child: Text("Pilih Gambar")),
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
                            await addProduct();
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
                          : const Text(
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

