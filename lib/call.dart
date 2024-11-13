import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'model.dart';

class Call extends StatefulWidget {
  const Call({super.key});

  @override
  State<Call> createState() => _CallState();
}

class _CallState extends State<Call> {
  List<CallModel> callList = [
    CallModel(url: "https://randomuser.me/api/portraits/men/4.jpg", names: "zoe", time: "45 minutes ago", callstatus: false, attended: true, calltype: true),
    CallModel(url: "https://randomuser.me/api/portraits/men/18.jpg", names: "david", time: "Today, 2:30 pm", callstatus: false, attended: false, calltype: true),
    CallModel(url:  "https://randomuser.me/api/portraits/women/9.jpg", names: "Maria", time: "Today, 9:12 am", callstatus: false, attended: true, calltype: true),
    CallModel(url: "https://randomuser.me/api/portraits/men/18.jpg", names: "david", time: "Yesterday, 11:30 pm", callstatus: true, attended: false, calltype: false),
    CallModel(url: "https://randomuser.me/api/portraits/women/12.jpg", names: "hope", time: "yesterday, 11:29 pm", callstatus: false, attended: true, calltype: false),
    CallModel(url: "https://randomuser.me/api/portraits/men/18.jpg", names: "david", time: "Yesterday, 11:18 pm", callstatus: false, attended: false, calltype: true),
    CallModel(url: "https://randomuser.me/api/portraits/men/18.jpg", names: "david", time: "Yesterday, 10:46 pm", callstatus: false, attended: true, calltype: false),
    CallModel(url: "https://randomuser.me/api/portraits/men/30.jpg", names: "liam", time: "yesterday, 8:23 pm", callstatus: false, attended: true, calltype: true),
    CallModel(url: "https://randomuser.me/api/portraits/women/12.jpg", names: "hope", time: "yesterday, 5:02 pm", callstatus: false, attended: false, calltype: false),
    CallModel(url: "https://m.media-amazon.com/images/I/917lA9Of4YL._AC_UF894,1000_QL80_.jpg", names: "veer", time: "Yesterday, 3:42 pm", callstatus: true, attended: true, calltype: true),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Color(0xFF0B1014),
          title: Text(
            "Calls",
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
              padding: const EdgeInsets.only(top: 13.0, left: 16.0),
              child: Text(
                "Favourites",
                style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0, left: 16.0),
              child: Row(
                children: [
                  Container(
                    height: 42,
                    width: 42,
                    decoration: BoxDecoration(
                      color: Color(0xFF21C063),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.favorite,
                      color: Colors.black,
                      size: 21,
                    ),
                  ),
                  SizedBox(width: 19),
                  Text(
                    "Add favourite",
                    style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 16.0),
              child: Text(
                "Recent",
                style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: callList.length,
              itemBuilder: (BuildContext context, int index) {
                var call = callList[index];
                return ListTile(
                  leading: CircleAvatar(
                    radius: 22,
                    backgroundImage: NetworkImage(call.url),
                  ),
                  title: Text(
                    call.names,
                    style: TextStyle(color: call.callstatus || call.attended ? Colors.white : Colors.red, fontSize: 19),
                  ),
                  subtitle: Row(
                    children: [
                      Icon(
                        call.callstatus ? Icons.call_made : Icons.call_received,
                        size: 18,
                        color: call.callstatus || call.attended ? Colors.green : Colors.red,
                      ),
                      SizedBox(width: 3),
                      Text(
                        call.time,
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                    ],
                  ),
                  trailing: Icon(
                    call.calltype ? Icons.call_outlined : Icons.videocam_outlined,
                    color: Colors.white,
                    size: call.calltype ? 24 : 29,
                  ),
                );
              },
            ),
          ],
        ),
        floatingActionButton: Container(
          height: 55,
          width: 55,
          child: FloatingActionButton(
            onPressed: () {},
            backgroundColor: Color(0xFF21C063),
            elevation: 20,
            child: Icon(
              Icons.add_ic_call_sharp,
              color: Colors.black,
              size: 24,
            ),
          ),
        ),
        bottomNavigationBar: NavigationBarTheme(
          data: NavigationBarThemeData(
            elevation: 10,
            indicatorColor: Color(0xFF103629),
            backgroundColor: Color(0xFF0B1014),
            labelTextStyle: MaterialStateProperty.all(
              TextStyle(color: Colors.white),
            ),
          ),
          child: NavigationBar(
            destinations: [
              NavigationDestination(
                icon: Icon(Icons.chat_sharp, color: Colors.white),
                label: "Chats",
              ),
              NavigationDestination(
                icon: Icon(Icons.update_sharp, color: Colors.white),
                label: "Updates",
              ),
              NavigationDestination(
                icon: Icon(Icons.people_alt_sharp, color: Colors.white),
                label: "Communities",
              ),
              NavigationDestination(
                icon: Icon(Icons.call, color: Colors.white),
                label: "Calls",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
