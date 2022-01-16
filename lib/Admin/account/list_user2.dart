// import 'dart:convert';
// import 'dart:developer';
//
// import 'package:flutter/material.dart';
//
// import 'package:http/http.dart' as http;
// import 'package:request_meeting_room/Admin/account/model_user.dart';
// import 'package:request_meeting_room/Admin/account/repository_user.dart';
//
// class PageListUser2 extends StatefulWidget {
//   const PageListUser2({Key? key}) : super(key: key);
//
//   @override
//   _PageListUser2State createState() => _PageListUser2State();
// }
//
// class User {
//   String nama;
//   String username;
//   String email;
//   String divisi;
//   String level;
//
//   User({required this.nama, required this.username, required this.email, required this.divisi, required this.level});
//
//   factory User.fromJson(Map<String, dynamic> json) {
//     return User(
//       nama: json['nama'] as String,
//       username: json['username'] as String,
//       email: json['email'] as String,
//       divisi: json['divisi'] as String,
//       level: json['level'] as String,
//     );
//   }
// }
//
// class Services {
//   final getUrl = 'https://empkp.000webhostapp.com/app/getdataakun.php';
//   final urlDeleteUser = 'https://empkp.000webhostapp.com/app/deletedatauser.php';
//
//   // static const _CREATE_TABLE_ACTION = 'CREATE_TABLE';
//   // static const _GET_ALL_ACTION = 'GET_ALL';
//   // static const _ADD_EMP_ACTION = 'ADD_EMP';
//   // static const _UPDATE_EMP_ACTION = 'UPDATE_EMP';
//   // static const _DELETE_EMP_ACTION = 'DELETE_EMP';
//
//   // Method to create the table Employees.
//   Future<List<User>> getUser2() async {
//     try {
//       var map = Map<String, dynamic>();
//       final response = await http.post(Uri.parse(getUrl), body: map);
//       print('getUser Response: ${response.body}');
//       if (200 == response.statusCode) {
//         List<User> list = parseResponse(response.body);
//         return list;
//       } else {
//         return List<User>();
//       }
//     } catch (e) {
//       return List<User>(); // return an empty list on exception/error
//     }
//   }
//
//   static List<Employee> parseResponse(String responseBody) {
//     final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
//     return parsed.map<Employee>((json) => Employee.fromJson(json)).toList();
//   }
//
//   // Method to add employee to the database...
//   static Future<String> addEmployee(String firstName, String lastName) async {
//     try {
//       var map = Map<String, dynamic>();
//       map['action'] = _ADD_EMP_ACTION;
//       map['first_name'] = firstName;
//       map['last_name'] = lastName;
//       final response = await http.post(ROOT, body: map);
//       print('addEmployee Response: ${response.body}');
//       if (200 == response.statusCode) {
//         return response.body;
//       } else {
//         return "error";
//       }
//     } catch (e) {
//       return "error";
//     }
//   }
//
//   // Method to update an Employee in Database...
//   static Future<String> updateEmployee(
//       String empId, String firstName, String lastName) async {
//     try {
//       var map = Map<String, dynamic>();
//       map['action'] = _UPDATE_EMP_ACTION;
//       map['emp_id'] = empId;
//       map['first_name'] = firstName;
//       map['last_name'] = lastName;
//       final response = await http.post(ROOT, body: map);
//       print('updateEmployee Response: ${response.body}');
//       if (200 == response.statusCode) {
//         return response.body;
//       } else {
//         return "error";
//       }
//     } catch (e) {
//       return "error";
//     }
//   }
//
//   // Method to Delete an Employee from Database...
//   static Future<String> deleteEmployee(String empId) async {
//     try {
//       var map = Map<String, dynamic>();
//       map['action'] = _DELETE_EMP_ACTION;
//       map['emp_id'] = empId;
//       final response = await http.post(ROOT, body: map);
//       print('deleteEmployee Response: ${response.body}');
//       if (200 == response.statusCode) {
//         return response.body;
//       } else {
//         return "error";
//       }
//     } catch (e) {
//       return "error"; // returning just an "error" string to keep this simple...
//     }
//   }
// }
//
// class _PageListUser2State extends State<PageListUser2> {
//
//
//
//   List dataUser = [];
//   // List<DataUser> listUser = [];
//   // RepositoryUser repository = RepositoryUser();
//
//
//   final getUrl = 'https://empkp.000webhostapp.com/app/getdataakun.php';
//   final urlDeleteUser = 'https://empkp.000webhostapp.com/app/deletedatauser.php';
//
//   void ambilUser() async {
//     var res = await http.get(Uri.parse(getUrl));
//
//     setState(() {
//       dataUser = json.decode(res.body);
//     });
//   }
//
//   // Future<bool> deletebooking(String username) async {
//   //   try {
//   //     final response = await http
//   //         .post(Uri.parse(urlDeleteUser), body: {'username': username});
//   //
//   //     if (response.statusCode == 200) {
//   //       return true;
//   //     }
//   //   } catch (e) {
//   //     log(e.toString(), name: 'deleteuser');
//   //   }
//   //   return false;
//   // }
//
//
//   // _showAlertDialogDelete(DataUser dataUser)
//   _showAlertDialogDelete() {
//     // set up the buttons
//     Widget cancelButton = TextButton(
//       child: Text("Cancel"),
//       onPressed: () {
//         Navigator.of(context).pop();
//       },
//     );
//     Widget continueButton = TextButton(
//       child: Text("Continue"),
//       onPressed: () async {
//         // bool response = await dataUser.delete('${dataHome.id}');
//         // if (response != '0') {
//         //   Navigator.of(context).pop();
//         // } else {
//         //   print('Delete data failed');
//         // }
//         // getDataHome();
//       },
//     );
//     // set up the AlertDialog
//     AlertDialog alert = AlertDialog(
//       title: Text("AlertDialog"),
//       content: Text("Apakah yakin untuk menghapus data user tersebut ?"),
//       actions: [
//         cancelButton,
//         continueButton,
//       ],
//     );
//     // show the dialog
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return alert;
//       },
//     );
//   }
//
//   @override
//   void initState() {
//     ambilUser();
//     super.initState();
//   }
//
//   SingleChildScrollView tabelUser() {
//     return SingleChildScrollView(
//       scrollDirection: Axis.vertical,
//       child: SingleChildScrollView(
//         scrollDirection: Axis.horizontal,
//         child: DataTable(
//             headingRowColor: MaterialStateColor.resolveWith((states) => Colors.white),
//             headingTextStyle: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
//
//             columns: [
//               // DataColumn(label: Text(" ")),
//               DataColumn(label: Text("Nama")),
//               DataColumn(label: Text("Username")),
//               DataColumn(label: Text("Email")),
//               DataColumn(label: Text("Divisi")),
//               DataColumn(label: Text("Level")),
//               DataColumn(label: Text("Aksi")),
//             ],
//             rows: dataUser
//                 .map((item) => DataRow(cells: <DataCell>[
//                       // DataCell(Text()),
//                       DataCell(Text(item["nama"])),
//                       DataCell(Text(item["username"])),
//                       DataCell(Text(item["email"])),
//                       DataCell(Text(item["divisi"])),
//                       DataCell(Text(item["level"])),
//                       DataCell(Row(
//                         children: [
//                           MaterialButton(
//                             onPressed: () {},
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(5),
//                             ),
//                             height: 15,
//                             minWidth: 30,
//                             child: Text(
//                               'Update',
//                               style: TextStyle(
//                                   fontSize: 10,
//                                   fontWeight: FontWeight.bold,
//                                   fontFamily: 'Ubuntu',
//                                   color: Colors.white),
//                             ),
//                             color: Color(0xff2484DF),
//                           ),
//                           SizedBox(width: 10),
//                           MaterialButton(
//                             onPressed: () async {
//                               _showAlertDialogDelete();
//                             },
//                             shape: RoundedRectangleBorder(
//                               borderRadius:
//                               BorderRadius.circular(5),
//                             ),
//                             height: 15,
//                             minWidth: 30,
//                             child: Text(
//                               'Hapus',
//                               style: TextStyle(
//                                   fontSize: 10,
//                                   fontWeight: FontWeight.bold,
//                                   fontFamily: 'Ubuntu',
//                                   color: Colors.white),
//                             ),
//                             color: Colors.red,
//                           ),
//                         ],
//                       )
//
//                       )
//                     ]))
//                 .toList()),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xffDCE5F0),
//       appBar: AppBar(
//         iconTheme: IconThemeData(
//           color: Colors.black, //change your color here
//         ),
//         title: Text(
//           'Account',
//           style: TextStyle(
//             fontSize: 18,
//             fontWeight: FontWeight.bold,
//             fontFamily: 'Ubuntu',
//             color: Colors.black,
//           ),
//         ),
//         centerTitle: true,
//         backgroundColor: Colors.white,
//       ),
//       body: Container(
//         width: MediaQuery.of(context).size.width,
//         padding: const EdgeInsets.all(8),
//         child: ListView(
//           children: [tabelUser()],
//         ),
//       ),
//     );
//   }
// }
