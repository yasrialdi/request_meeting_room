import 'package:flutter/material.dart';
import 'package:request_meeting_room/addbooking/RepositoryTes.dart';
import 'package:request_meeting_room/firstpage/nav_bottom_bar.dart';
import 'package:request_meeting_room/model/Repository.dart';

class PageTesBook extends StatefulWidget {
  const PageTesBook({Key? key}) : super(key: key);

  @override
  _PageTesBookState createState() => _PageTesBookState();
}

class _PageTesBookState extends State<PageTesBook> {

  TextEditingController _dateCtl2 = TextEditingController();

  RepositoryTes repository = RepositoryTes();
  final _ruanganController = TextEditingController();
  final _hariController = TextEditingController();
  final _jamController = TextEditingController();
  final _gambarController = TextEditingController();




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text('Info Room',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ))),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextField(
                controller: _ruanganController,
                style: TextStyle(fontSize: 25),
                decoration: InputDecoration(
                  hintText: "Ruangan",
                  hintStyle: TextStyle(fontFamily: "Cambria"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextField(
                controller: _hariController,
                style: TextStyle(fontSize: 25),
                decoration: InputDecoration(
                  hintText: "Hari",
                  hintStyle: TextStyle(fontFamily: "Cambria"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextField(
                controller: _jamController,
                style: TextStyle(fontSize: 25),
                decoration: InputDecoration(
                  hintText: "Jam",
                  hintStyle: TextStyle(fontFamily: "Cambria"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextField(
                controller: _gambarController,
                style: TextStyle(fontSize: 25),
                decoration: InputDecoration(
                  hintText: "Gambar",
                  hintStyle: TextStyle(fontFamily: "Cambria"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(40, 10, 40, 0),
              child: Container(
                width: 100,
                child: TextFormField(
                  controller: _dateCtl2,
                  onTap: () async{
                    DateTime date2 = DateTime(2015);
                    FocusScope.of(context).requestFocus(new FocusNode());

                    date2 = (await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2015),
                        lastDate: DateTime(2050)))!;

                    _dateCtl2.text = date2.toIso8601String();
                  },
                ),
              ),
            ),
            SizedBox(height: 100),
            ElevatedButton(
              onPressed: () async {
                bool response = await repository.postData(_ruanganController.text, _hariController.text, _jamController.text, _gambarController.text);

                if(response){
                  Navigator.of(context).popAndPushNamed('PageTesBook()');
                }else{
                  print("Post data gagal");
                }
              },
              child: Text(
                'SIMPAN',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Ubuntu',
                    color: Colors.white),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
