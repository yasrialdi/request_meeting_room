import 'package:flutter/material.dart';
import 'package:request_meeting_room/inforoom/detail_room_deskripsi.dart';
import 'package:request_meeting_room/inforoom/detail_room_galeri.dart';

class PageDetailRoom extends StatefulWidget {
  const PageDetailRoom({Key? key}) : super(key: key);

  @override
  _PageDetailRoomState createState() => _PageDetailRoomState();
}

class _PageDetailRoomState extends State<PageDetailRoom>
    with SingleTickerProviderStateMixin {
  bool changed = true;
  TabController?tabcontroll;

  @override
  void initState() {
    tabcontroll = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabcontroll?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _emptyAppBar(),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  'images/boar1.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back),
              ),
            ],
          ),
          TabBar(
            controller: tabcontroll,
            tabs: [
              Tab(
                child: Text(
                  'Deskripsi',
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: 'Ubuntu',
                    color: Colors.black,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  'Galeri',
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: 'Ubuntu',
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
              child: TabBarView(
                controller: tabcontroll,
                children: [
                  PageDetailDeskripsi(tabcontroll),
                  PageDetailGaleri(tabcontroll)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  PreferredSize _emptyAppBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(0.0),
      child: AppBar(backgroundColor: Colors.white),
    );
  }
}

