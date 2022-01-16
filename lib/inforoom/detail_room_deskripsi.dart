import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageDetailDeskripsi extends StatefulWidget {
  const PageDetailDeskripsi(TabController? tabcontroll, {Key? key})
      : super(key: key);

  @override
  _PageDetailDeskripsiState createState() => _PageDetailDeskripsiState();
}

class _PageDetailDeskripsiState extends State<PageDetailDeskripsi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffDCE5F0),
        body: SingleChildScrollView(
          child: Container(
              padding: EdgeInsets.all(10),
              child: Column(children: [
                // Container(
                //   width: 400,
                //   height: 220,
                //   child: Card(
                //     child: Row(
                //
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       mainAxisAlignment: MainAxisAlignment.start,
                //       children: [
                //         Padding(
                //           padding: const EdgeInsets.only(left: 10, top: 10),
                //           child: Column(
                //             children: [
                //               Text(
                //                 'Ruang Meeting 1',
                //                 style: TextStyle(
                //                   fontSize: 20,
                //                   fontWeight: FontWeight.bold,
                //                   fontFamily: 'Ubuntu',
                //                   color: Colors.black,
                //                 ),
                //               ),
                //               SizedBox(height: 8),
                //               Column(
                //                 crossAxisAlignment: CrossAxisAlignment.start,
                //                 mainAxisAlignment: MainAxisAlignment.start,
                //                 children: [
                //                   Text(
                //                     'Luas Ruangan',
                //                     textAlign: TextAlign.left,
                //                     style: TextStyle(
                //                       fontSize: 13,
                //                       fontWeight: FontWeight.bold,
                //                       fontFamily: 'Ubuntu',
                //                       color: Colors.black,
                //                     ),
                //                   ),
                //                   Text(
                //                     '6 x 7 Meter Persegi',
                //                     style: TextStyle(
                //                       fontSize: 12,
                //                       fontFamily: 'Ubuntu',
                //                       color: Colors.black,
                //                     ),
                //                   ),
                //                 ],
                //               ),
                //               SizedBox(height: 8),
                //               Column(
                //                 crossAxisAlignment: CrossAxisAlignment.start,
                //                 mainAxisAlignment: MainAxisAlignment.start,
                //                 children: [
                //                   Text(
                //                     'Fasilitas ',
                //                     textAlign: TextAlign.left,
                //                     style: TextStyle(
                //                       fontSize: 13,
                //                       fontWeight: FontWeight.bold,
                //                       fontFamily: 'Ubuntu',
                //                       color: Colors.black,
                //                     ),
                //                   ),
                //                   Text(
                //                     '6 x 7 Meter Persegi',
                //                     style: TextStyle(
                //                       fontSize: 12,
                //                       fontFamily: 'Ubuntu',
                //                       color: Colors.black,
                //                     ),
                //                   ),
                //                   Text(
                //                     'Proyector',
                //                     style: TextStyle(
                //                       fontSize: 12,
                //                       fontFamily: 'Ubuntu',
                //                       color: Colors.black,
                //                     ),
                //                   ),
                //                   SizedBox(height: 3),
                //                   Text(
                //                     'WiFi',
                //                     style: TextStyle(
                //                       fontSize: 12,
                //                       fontFamily: 'Ubuntu',
                //                       color: Colors.black,
                //                     ),
                //                   ),
                //                   SizedBox(height: 3),
                //                   Text(
                //                     'PC',
                //                     style: TextStyle(
                //                       fontSize: 12,
                //                       fontFamily: 'Ubuntu',
                //                       color: Colors.black,
                //                     ),
                //                   ),
                //                   SizedBox(height: 3),
                //                   Text(
                //                     'Speaker',
                //                     style: TextStyle(
                //                       fontSize: 12,
                //                       fontFamily: 'Ubuntu',
                //                       color: Colors.black,
                //                     ),
                //                   ),
                //                   SizedBox(height: 3),
                //                   Text(
                //                     'AC',
                //                     style: TextStyle(
                //                       fontSize: 12,
                //                       fontFamily: 'Ubuntu',
                //                       color: Colors.black,
                //                     ),
                //                   ),
                //                 ],
                //               ),
                //             ],
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                // Container(
                //   width: 400,
                //   height: 220,
                //   child: Card(
                //     child: Row(
                //
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       mainAxisAlignment: MainAxisAlignment.start,
                //       children: [
                //         Padding(
                //           padding: const EdgeInsets.only(left: 10, top: 10),
                //           child: Column(
                //             children: [
                //               Text(
                //                 'Ruang Meeting 2',
                //                 style: TextStyle(
                //                   fontSize: 20,
                //                   fontWeight: FontWeight.bold,
                //                   fontFamily: 'Ubuntu',
                //                   color: Colors.black,
                //                 ),
                //               ),
                //               SizedBox(height: 8),
                //               Column(
                //                 crossAxisAlignment: CrossAxisAlignment.start,
                //                 mainAxisAlignment: MainAxisAlignment.start,
                //                 children: [
                //                   Text(
                //                     'Luas Ruangan',
                //                     textAlign: TextAlign.left,
                //                     style: TextStyle(
                //                       fontSize: 13,
                //                       fontWeight: FontWeight.bold,
                //                       fontFamily: 'Ubuntu',
                //                       color: Colors.black,
                //                     ),
                //                   ),
                //                   Text(
                //                     '6 x 7 M',
                //                     style: TextStyle(
                //                       fontSize: 12,
                //                       fontFamily: 'Ubuntu',
                //                       color: Colors.black,
                //                     ),
                //                   ),
                //                 ],
                //               ),
                //               SizedBox(height: 8),
                //               Column(
                //                 crossAxisAlignment: CrossAxisAlignment.start,
                //                 mainAxisAlignment: MainAxisAlignment.start,
                //                 children: [
                //                   Text(
                //                     'Fasilitas ',
                //                     textAlign: TextAlign.left,
                //                     style: TextStyle(
                //                       fontSize: 13,
                //                       fontWeight: FontWeight.bold,
                //                       fontFamily: 'Ubuntu',
                //                       color: Colors.black,
                //                     ),
                //                   ),
                //                   Text(
                //                     'Proyector',
                //                     style: TextStyle(
                //                       fontSize: 12,
                //                       fontFamily: 'Ubuntu',
                //                       color: Colors.black,
                //                     ),
                //                   ),
                //                   SizedBox(height: 3),
                //                   Text(
                //                     'WiFi',
                //                     style: TextStyle(
                //                       fontSize: 12,
                //                       fontFamily: 'Ubuntu',
                //                       color: Colors.black,
                //                     ),
                //                   ),
                //                   SizedBox(height: 3),
                //                   Text(
                //                     'PC',
                //                     style: TextStyle(
                //                       fontSize: 12,
                //                       fontFamily: 'Ubuntu',
                //                       color: Colors.black,
                //                     ),
                //                   ),
                //                   SizedBox(height: 3),
                //                   Text(
                //                     'Speaker',
                //                     style: TextStyle(
                //                       fontSize: 12,
                //                       fontFamily: 'Ubuntu',
                //                       color: Colors.black,
                //                     ),
                //                   ),
                //                   SizedBox(height: 3),
                //                   Text(
                //                     'AC',
                //                     style: TextStyle(
                //                       fontSize: 12,
                //                       fontFamily: 'Ubuntu',
                //                       color: Colors.black,
                //                     ),
                //                   ),
                //                 ],
                //               ),
                //             ],
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                // Container(
                //   width: 400,
                //   height: 220,
                //   child: Card(
                //     child: Row(
                //
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       mainAxisAlignment: MainAxisAlignment.start,
                //       children: [
                //         Padding(
                //           padding: const EdgeInsets.only(left: 10, top: 10),
                //           child: Column(
                //             children: [
                //               Column(
                //                 children: [
                //                   Text(
                //                     'Ruang Meeting 1 & 2',
                //                     style: TextStyle(
                //                       fontSize: 20,
                //                       fontWeight: FontWeight.bold,
                //                       fontFamily: 'Ubuntu',
                //                       color: Colors.black,
                //                     ),
                //                   ),
                //                 ],
                //               ),
                //               SizedBox(height: 8),
                //               Column(
                //                 crossAxisAlignment: CrossAxisAlignment.start,
                //                 mainAxisAlignment: MainAxisAlignment.start,
                //                 children: [
                //                   Text(
                //                     'Luas Ruangan',
                //                     textAlign: TextAlign.left,
                //                     style: TextStyle(
                //                       fontSize: 13,
                //                       fontWeight: FontWeight.bold,
                //                       fontFamily: 'Ubuntu',
                //                       color: Colors.black,
                //                     ),
                //                   ),
                //                   Text(
                //                     '6 x 7 Meter Persegi',
                //                     style: TextStyle(
                //                       fontSize: 12,
                //                       fontFamily: 'Ubuntu',
                //                       color: Colors.black,
                //                     ),
                //                   ),
                //                 ],
                //               ),
                //               SizedBox(height: 8),
                //               Column(
                //                 crossAxisAlignment: CrossAxisAlignment.start,
                //                 mainAxisAlignment: MainAxisAlignment.start,
                //                 children: [
                //                   Text(
                //                     'Fasilitas ',
                //                     textAlign: TextAlign.left,
                //                     style: TextStyle(
                //                       fontSize: 13,
                //                       fontWeight: FontWeight.bold,
                //                       fontFamily: 'Ubuntu',
                //                       color: Colors.black,
                //                     ),
                //                   ),
                //                   Text(
                //                     '6 x 7 Meter Persegi',
                //                     style: TextStyle(
                //                       fontSize: 12,
                //                       fontFamily: 'Ubuntu',
                //                       color: Colors.black,
                //                     ),
                //                   ),
                //                   Text(
                //                     'Proyector',
                //                     style: TextStyle(
                //                       fontSize: 12,
                //                       fontFamily: 'Ubuntu',
                //                       color: Colors.black,
                //                     ),
                //                   ),
                //                   SizedBox(height: 3),
                //                   Text(
                //                     'WiFi',
                //                     style: TextStyle(
                //                       fontSize: 12,
                //                       fontFamily: 'Ubuntu',
                //                       color: Colors.black,
                //                     ),
                //                   ),
                //                   SizedBox(height: 3),
                //                   Text(
                //                     'PC',
                //                     style: TextStyle(
                //                       fontSize: 12,
                //                       fontFamily: 'Ubuntu',
                //                       color: Colors.black,
                //                     ),
                //                   ),
                //                   SizedBox(height: 3),
                //                   Text(
                //                     'Speaker',
                //                     style: TextStyle(
                //                       fontSize: 12,
                //                       fontFamily: 'Ubuntu',
                //                       color: Colors.black,
                //                     ),
                //                   ),
                //                   SizedBox(height: 3),
                //                   Text(
                //                     'AC',
                //                     style: TextStyle(
                //                       fontSize: 12,
                //                       fontFamily: 'Ubuntu',
                //                       color: Colors.black,
                //                     ),
                //                   ),
                //                 ],
                //               ),
                //             ],
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                // )
                Container(
                  height: 200,
                  margin: EdgeInsets.only(bottom: 3),
                  child: Card(
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Ruang Meeting 1 ',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'Ubuntu',
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    'Luas Ruangan',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Ubuntu',
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(height: 3),
                                  Text(
                                    '6 x 7 Meter Persegi',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'Ubuntu',
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(height: 12),
                                  Text(
                                    'Fasilitas',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Ubuntu',
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    'Proyector',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'Ubuntu',
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    'WiFi',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'Ubuntu',
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    'PC',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'Ubuntu',
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    'Speaker',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'Ubuntu',
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    'AC',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'Ubuntu',
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ]),
                  ),
                ),
                Container(
                  height: 200,
                  margin: EdgeInsets.only(bottom: 3),
                  child: Card(
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Ruang Meeting 2 ',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'Ubuntu',
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    'Luas Ruangan',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Ubuntu',
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    '6 x 7 Meter Persegi',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'Ubuntu',
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(height: 12),
                                  Text(
                                    'Fasilitas',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Ubuntu',
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    'Proyector',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'Ubuntu',
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    'WiFi',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'Ubuntu',
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    'PC',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'Ubuntu',
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    'Speaker',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'Ubuntu',
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    'AC',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'Ubuntu',
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ]),
                  ),
                ),
                Container(
                  height: 200,
                  margin: EdgeInsets.only(bottom: 3),
                  child: Card(
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Ruang Meeting 1 & 2',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'Ubuntu',
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    'Luas Ruangan',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Ubuntu',
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(height: 3),
                                  Text(
                                    'Gabungan Ruang Meeting 1 dan 2',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'Ubuntu',
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(height: 12),
                                  Text(
                                    'Fasilitas',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Ubuntu',
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    'Proyector',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'Ubuntu',
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    'WiFi',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'Ubuntu',
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    'PC',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'Ubuntu',
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    'Speaker',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'Ubuntu',
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    'AC',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'Ubuntu',
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ]),
                  ),
                )
              ])),
        ));
  }
}
