import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:status_view/status_view.dart';

import 'model.dart';

class Status extends StatefulWidget {
  const Status({super.key});

  @override
  State<Status> createState() => _StatusState();
}

class _StatusState extends State<Status> {
  List<Statusmodel> statuslist = [
    Statusmodel(
        url: "assets/images/sw1.png",
        name: "Helen",
        time: "6 minutes ago",
        isSeen: false, numberofStatus : 3),
    Statusmodel(
        url: "assets/images/sm1.png",
        name: "John",
        time: "45 minutes ago",
        isSeen: false, numberofStatus : 1),
    Statusmodel(
        url: "assets/images/sw2.png",
        name: "Emma",
        time: "10:30 am",
        isSeen: true, numberofStatus : 4),
    Statusmodel(
        url: "assets/images/sm2.png",
        name: "Michael",
        time: "6:10 am",
        isSeen: false, numberofStatus: 2),
    Statusmodel(
        url: "assets/images/sw3.png",
        name: "Sophia",
        time: "Yesterday",
        isSeen: true, numberofStatus: 3),
  ];

  List<StatusSeen> seenlist = [
  StatusSeen(
  url: "assets/images/sw4.png",
  name: "Rose",
  time: "4:22 pm",
  isSeen: true, ),
  StatusSeen(
  url: "assets/images/sw5.png",
  name: "Nora",
  time: "Yesterday",
  isSeen:true,),
  StatusSeen(
  url: "assets/images/sm3.png",
  name: "david",
  time: "Yesterday",
  isSeen: true, )];



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Color(0xFF0B1014),
          title: Text(
            "Updates",
            style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w400),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.qr_code_scanner),
              color: Colors.white,
            ),
            SizedBox(width: 2),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.camera_alt_outlined),
              color: Colors.white,
            ),
            SizedBox(width: 2),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.search_sharp),
              color: Colors.white,
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.more_vert),
              color: Colors.white,
            ),
          ],
        ),
        backgroundColor: Color(0xFF0B1014),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 18.0, left: 16.0),
              child: Text(
                "Status",
                style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(top: 3.0, left: 16.0),
              child: Row(
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage("assets/images/nora.jpg"),
                        radius: 28,
                      ),
                      Positioned(
                        top: 33,
                        left: 32,
                        child: Container(
                          height: 24,
                          width: 24,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFF0B1014),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 34,
                        left: 34,
                        child: GestureDetector(
                          onTap: () {
                            // Navigate to a new screen to add a status (either via camera or gallery)
                          },
                          child: Container(
                            height: 22,
                            width: 22,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFF21C063),
                            ),
                            child: Icon(Icons.add, size: 19),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("My status", style: TextStyle(color: Colors.white, fontSize: 19, fontWeight: FontWeight.w500)),
                      SizedBox(height: 1),
                      Text("Tap to add status update", style: TextStyle(color: Colors.grey, fontSize: 16)),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 19.0, left: 16.0),
              child: Text(
                "Recent updates",
                style: TextStyle(color: Colors.grey, fontSize: 14, fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(height: 13,),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: statuslist.length,
              itemBuilder: (BuildContext context, int index) {
                var list = statuslist[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 6),
                  child: ListTile(
                    leading: Stack(
                      alignment: Alignment.center,
                      children: [
                        StatusView(
                          radius: 28,
                          spacing: 15,
                          strokeWidth: 2,
                          indexOfSeenStatus: list.isSeen ? 2 : 0, // Show seen status
                          numberOfStatus: list.numberofStatus ?? 1,
                          padding: 4,
                          centerImageUrl: "", // Leave this empty or null
                          seenColor: Colors.grey,
                          unSeenColor: Color(0xFF21C063),
                        ),
                        CircleAvatar(
                          radius: 25, // Match the radius of the StatusView
                          backgroundImage: AssetImage(list.url), // Use AssetImage here
                        ),
                      ],
                    ),
                    title: Text(
                      list.name,
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    subtitle: Text(
                      list.time,
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 6.0, left: 16.0),
              child: Text(
                "Viewed updates",
                style: TextStyle(color: Colors.grey, fontSize: 14, fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(height: 11,),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount:seenlist.length,
              itemBuilder: (BuildContext context, int index) {
                var list = seenlist[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 6),
                  child: ListTile(
                    leading: Stack(
                      alignment: Alignment.center,
                      children: [
                        StatusView(
                          radius: 28,
                          spacing: 15,
                          strokeWidth: 2,
                          indexOfSeenStatus: list.isSeen ? 2 : 0, // Show seen status
                          numberOfStatus: 1,
                          padding: 4,
                          centerImageUrl: "", // Leave this empty or null
                          seenColor: Colors.grey,
                          unSeenColor: Color(0xFF21C063),
                        ),
                        CircleAvatar(
                          radius: 25, // Match the radius of the StatusView
                          backgroundImage: AssetImage(list.url), // Use AssetImage here
                        ),
                      ],
                    ),
                    title: Text(
                      list.name,
                      style: TextStyle(color: Colors.white, fontSize: 19),
                    ),
                    subtitle: Text(
                      list.time,
                      style: TextStyle(color: Colors.grey, fontSize: 15),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Material(
              color: Colors.transparent, // Make background transparent
              elevation: 30,
                shadowColor: Colors.black,
                child: FloatingActionButton(
                  onPressed: () {},
                  backgroundColor: Color(0xFF1F272A),
                  mini: true,
                  child: Icon(
                    Icons.edit,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
              ),
            SizedBox(height: 10), // Space between buttons
            Container(
              height: 55,
              width: 55,
              child: FloatingActionButton(
                onPressed: () {},
                backgroundColor: Color(0xFF21C063),
                elevation: 20,
                child: Icon(Icons.photo_camera_rounded, color: Colors.black, size: 23),
              ),
            ),
          ],
        ),

      ),
    );
  }
}


