import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:request_meeting_room/firstpage/nav_bottom_bar.dart';
import 'package:http/http.dart' as http;
import 'package:request_meeting_room/home/model_home.dart';
import 'package:request_meeting_room/home/repository_home.dart';

import 'RepositoryAdd.dart';

class PageEditBooking extends StatefulWidget {
  final String id;
  final String judul;
  final String ruang;
  final String mulai;
  final String selesai;
  final String jumlahpst;
  final String catatan;

  PageEditBooking(
      {
        required this.id,
        required this.judul,
        required this.ruang,
        required this.mulai,
        required this.selesai,
        required this.jumlahpst,
        required this.catatan});

  @override
  _PageEditBookingState createState() => _PageEditBookingState();
}

class _PageEditBookingState extends State<PageEditBooking> {
  final formKey = GlobalKey<FormState>();
  bool editMode = false;
  String dropdownRuang = '1';

  late DateTime selectedDate1;
  late DateTime selectedDate2;
  late DateTime selectedDate3;
  late TimeOfDay selectedTime1;
  late TimeOfDay selectedTime2;
  late String _hour1, _minute1, _time1;
  late String _hour2, _minute2, _time2;

  DateFormat formatter = DateFormat('EEEE, d MMMM y ','id_ID');
  DateFormat formatUp = DateFormat('yyyy-MM-dd');

  RepositoryAdd repository = RepositoryAdd();
  RepositoryHome reposi = RepositoryHome();
  final _judulController = TextEditingController();
  final _jumlahpesertaController = TextEditingController();
  final _catatanController = TextEditingController();

  TextEditingController _dateController1 = TextEditingController();
  TextEditingController _timeController1 = TextEditingController();
  TextEditingController _dateController2 = TextEditingController();
  TextEditingController _timeController2 = TextEditingController();

  Future<Null> _selectDate1(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate1,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(2015),
        lastDate: DateTime(2101));
    if (picked != null)
      setState(() {
        selectedDate1 = picked;
        _dateController1.text = formatter.format(selectedDate1);
      });
  }

  Future<Null> _selectDate2(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate2,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(2015),
        lastDate: DateTime(2101));
    if (picked != null)
      setState(() {
        selectedDate2 = picked;
        _dateController2.text = formatter.format(selectedDate2);
      });
  }

  Future<Null> _selectTime1(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime1,
    );
    if (picked != null)
      setState(() {
        selectedTime1 = picked;
        _hour1 = selectedTime1.hour.toString();
        _minute1 = selectedTime1.minute.toString();
        _time1 = _hour1 + ' : ' + _minute1;
        _timeController1.text = _time1;
        _timeController1.text = formatDate(
            DateTime(2019, 08, 1, selectedTime1.hour, selectedTime1.minute),
            [HH, ':', nn]).toString();
      });
  }

  Future<Null> _selectTime2(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime2,
    );
    if (picked != null)
      setState(() {
        selectedTime2 = picked;
        _hour2 = selectedTime2.hour.toString();
        _minute2 = selectedTime2.minute.toString();
        _time2 = _hour2 + ' : ' + _minute2;
        _timeController2.text = _time2;
        _timeController2.text = formatDate(
            DateTime(2019, 08, 1, selectedTime2.hour, selectedTime2.minute),
            [HH, ':', nn]).toString();
      });
  }

  final AddUrl = 'https://empkp.000webhostapp.com/app/updatedatabooking1.php';

  Future postDataEdit(String id, String judul, String ruangan, String mulai,
      String selesai, String jumlah, String catatan) async {
    try {
      final response = await http.post(Uri.parse(AddUrl), body: {
        "id_booking": id,
        "judul_meeting": judul,
        "ruang_meeting": ruangan,
        "mulai": mulai,
        "selesai": selesai,
        "jumlah_peserta": jumlah,
        "catatan": catatan,
      });
      if (response.statusCode == 201) {
        Fluttertoast.showToast(
            msg: "Data Booking Berhasil Diubah",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.white,
            textColor: Colors.black,
            fontSize: 16);
        
      } else {
        Fluttertoast.showToast(
            msg: "Data Booking Tidak Berhasil Diubah\n"
                "Silahkan Cek Kembali Tanggal dan Jam Booking",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.white,
            textColor: Colors.black,
            fontSize: 16);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  void postBookEdit() async {
    bool response = await postDataEdit(
        widget.id.toString(),
        _judulController.text,
        dropdownRuang,
        _dateController1.text = formatUp.format(selectedDate1) + " " + _timeController1.text,
        _dateController2.text = formatUp.format(selectedDate2) + " " + _timeController2.text,
        _jumlahpesertaController.text,
        _catatanController.text);
  }

  @override
  void initState() {
    DateTime startedAt = DateFormat('EEEE, d MMMM y HH:mm','id_ID').parse(widget.mulai);
    DateTime endedAt = DateFormat('EEEE, d MMMM y HH:mm','id_ID').parse(widget.selesai);

    selectedDate1 = startedAt;
    selectedDate2 = endedAt;

    selectedTime1 = TimeOfDay(hour: startedAt.hour, minute: startedAt.minute);
    selectedTime2 = TimeOfDay(hour: endedAt.hour, minute: endedAt.minute);

    _dateController1.text = DateFormat.yMd().format(startedAt);
    _dateController2.text = DateFormat.yMd().format(endedAt);

    _timeController1.text = formatDate(startedAt, [HH, ':', nn]).toString();
    _timeController2.text = formatDate(endedAt, [HH, ':', nn]).toString();

    _judulController.text = widget.judul.toString();
    dropdownRuang = widget.ruang.toString();
    _jumlahpesertaController.text = widget.jumlahpst.toString();
    _catatanController.text = widget.catatan.toString();

    super.initState();
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
        postBookEdit();
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) =>
                    PageNavBottomBar()),
                (Route<dynamic> route) => false);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Cek Kembali"),
      content: Text("Judul Meeting"
          "  : "
          "${_judulController.text}\n"
          "Ruang Meeting"
          "  : "
          "$dropdownRuang\n"
          "Mulai Meeting"
          " : "
          "${_dateController1.text = formatter.format(selectedDate1)}, "
          "Jam ${_timeController1.text}\n"
          "Selesai Meeting"
          "  : "
          "${_dateController2.text = formatter.format(selectedDate2)}, "
          "Jam ${_timeController2.text}\n"
          "Jumlah Peserta Meeting"
          "  : "
          "${_jumlahpesertaController.text}\n"
          "Catatan Meeting"
          "  : "
          "${_catatanController.text}\n"),
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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffDCE5F0),
      appBar: AppBar(
        title: Text(
          'Update Data Booking',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            fontFamily: 'Ubuntu',
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.close_rounded)),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: TextFormField(
                    controller: _judulController,
                    style: TextStyle(fontSize: 25),
                    decoration: InputDecoration(
                      hintText: "Judul Meeting",
                      hintStyle: TextStyle(fontFamily: "Cambria"),
                    ),
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Judul Meeting Kosong';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 25),
                Padding(
                  padding: const EdgeInsets.only(),
                  child: Divider(
                    color: Colors.black.withOpacity(0.1),
                    thickness: 1,
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    children: [
                      Icon(Icons.room),
                      SizedBox(width: 5),
                      Text(
                        "Ruang Meeting",
                        style: TextStyle(fontSize: 20, fontFamily: "Ubuntu"),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            isExpanded: true,
                            value: dropdownRuang,
                            icon: const Icon(Icons.arrow_drop_down_rounded),
                            iconSize: 50,
                            elevation: 16,
                            style: const TextStyle(
                                fontSize: 23,
                                color: Colors.black,
                                fontFamily: "cambria"),
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownRuang = newValue!;
                              });
                            },
                            hint: Text("Pilih Ruang Meeting"),
                            items: <String>['1', '2', '1 & 2']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.only(),
                  child: Divider(
                    color: Colors.black.withOpacity(0.1),
                    thickness: 1,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.calendar_today),
                      TextButton(
                        onPressed: () {
                          _selectDate1(context);
                        },
                        child: Text(
                          "Start Meeting ${selectedDate1.day} - ${selectedDate1.month} - ${selectedDate1.year} ",
                          style: TextStyle(fontFamily: "Ubuntu"),
                        ),
                      ),
                      SizedBox(width: 65),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {
                              _selectTime1(context);
                            },
                            child: Text(
                                "${selectedTime1.hour}:${selectedTime1.minute}"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.calendar_today),
                      TextButton(
                        onPressed: () {
                          _selectDate2(context);
                        },
                        child: Text(
                            "End Meeeting ${selectedDate2.day} - ${selectedDate2.month} - ${selectedDate2.year}"),
                      ),
                      SizedBox(width: 67),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {
                              _selectTime2(context);
                            },
                            child: Text(
                                "${selectedTime2.hour}:${selectedTime2.minute}"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(),
                  child: Divider(
                    color: Colors.black.withOpacity(0.1),
                    thickness: 1,
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.person),
                      SizedBox(width: 5),
                      Text(
                        "Jumlah Peserta",
                        style: TextStyle(fontSize: 20, fontFamily: "Ubuntu"),
                      ),
                      SizedBox(width: 120),
                      Expanded(
                        child: TextFormField(
                          controller: _jumlahpesertaController,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 15),
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: "1-50",
                            hintStyle: TextStyle(fontFamily: "Ubuntu"),
                          ),
                          validator: (text) {
                            if (text == null || text.isEmpty) {
                              return 'Kosong';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(),
                  child: Divider(
                    color: Colors.black.withOpacity(0.1),
                    thickness: 1,
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.note_rounded),
                      SizedBox(width: 5),
                      Text(
                        "Catatan",
                        style: TextStyle(fontSize: 20, fontFamily: "Ubuntu"),
                      ),
                      SizedBox(width: 50),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.fromLTRB(45, 0, 40, 0),
                  child: TextFormField(
                    controller: _catatanController,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    ),
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Catatan Kosong';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 50),
                ElevatedButton(
                  style: ButtonStyle(),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      _showAlertDialogAdd();
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
                SizedBox(height: 200),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
