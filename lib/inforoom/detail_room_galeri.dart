import 'package:flutter/material.dart';

class PageDetailGaleri extends StatefulWidget {
  const PageDetailGaleri(TabController? tabcontroll, {Key? key}) : super(key: key);

  @override
  _PageDetailGaleriState createState() => _PageDetailGaleriState();
}

class _PageDetailGaleriState extends State<PageDetailGaleri> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffDCE5F0),
        body: GridView.count(
          crossAxisCount: 2,
          padding: EdgeInsets.all(8),
          children: [
            buildCard(Image.asset('images/boar1.jpg'), "Foto 1"),
            buildCard(Image.asset('images/boar1.jpg'), "Foto 2"),
            buildCard(Image.asset('images/boar1.jpg'), "Foto 3"),
            buildCard(Image.asset('images/boar1.jpg'), "Foto 4"),
            buildCard(Image.asset('images/boar1.jpg'), "Foto 5"),
            buildCard(Image.asset('images/boar1.jpg'), "Foto 6"),
            buildCard(Image.asset('images/boar1.jpg'), "Foto 7"),
            buildCard(Image.asset('images/boar1.jpg'), "Foto 8"),
            buildCard(Image.asset('images/boar1.jpg'), "Foto 9"),
            buildCard(Image.asset('images/boar1.jpg'), "Foto 10"),
            buildCard(Image.asset('images/boar1.jpg'), "Foto 11"),
            buildCard(Image.asset('images/boar1.jpg'), "Foto 12"),
          ],

      )
    );
  }

  Card buildCard(Image image, String text) {
    return Card(
      child: Column(
        children: [
          image,
          SizedBox(height: 20),
          Text(text, style: TextStyle(
            fontSize: 14,
            fontFamily: 'ubuntu',
            color: Colors.black,

          ),),
        ],

      ),
    );
  }
}
