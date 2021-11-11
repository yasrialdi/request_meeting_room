import 'package:flutter/material.dart';

class PageDetailDeskripsi extends StatefulWidget {
  const PageDetailDeskripsi(TabController? tabcontroll, {Key? key}) : super(key: key);

  @override
  _PageDetailDeskripsiState createState() => _PageDetailDeskripsiState();
}

class _PageDetailDeskripsiState extends State<PageDetailDeskripsi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffDCE5F0),
      body:  Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Luas Ruangan',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                fontFamily: 'Ubuntu',
                color: Colors.black,
              ),
            ),
            SizedBox(height: 5),
            Text(
              '6 x 7 Meter Persegi',
              style: TextStyle(
                fontSize: 12,
                fontFamily: 'Ubuntu',
                color: Colors.black,
              ),
            ),
            SizedBox(height: 15),
            Text(
              'Fasilitas',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                fontFamily: 'Ubuntu',
                color: Colors.black,
              ),
            ),
            SizedBox(height: 5),
            Text(
              'Proyector',
              style: TextStyle(
                fontSize: 12,
                fontFamily: 'Ubuntu',
                color: Colors.black,
              ),
            ),
            SizedBox(height: 3),
            Text(
              'WiFi',
              style: TextStyle(
                fontSize: 12,
                fontFamily: 'Ubuntu',
                color: Colors.black,
              ),
            ),
            SizedBox(height: 3),
            Text(
              'PC',
              style: TextStyle(
                fontSize: 12,
                fontFamily: 'Ubuntu',
                color: Colors.black,
              ),
            ),
            SizedBox(height: 3),
            Text(
              'Speaker',
              style: TextStyle(
                fontSize: 12,
                fontFamily: 'Ubuntu',
                color: Colors.black,
              ),
            ),
            SizedBox(height: 3),
            Text(
              'AC',
              style: TextStyle(
                fontSize: 12,
                fontFamily: 'Ubuntu',
                color: Colors.black,
              ),
            ),
            SizedBox(height: 3),
          ],
        ),
      ),
    );
  }
}
