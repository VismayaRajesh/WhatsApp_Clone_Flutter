import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Community.dart';
import 'Status.dart';
import 'call.dart';
import 'chatview.dart';
import 'contact_list.dart';
import 'model.dart';

class WhtChat extends StatefulWidget {
  const WhtChat({super.key});

  @override
  State<WhtChat> createState() => _WhtChatState();
}

class _WhtChatState extends State<WhtChat> {

  int _selectedIndex = 0;

  List<Widget>pages = [
    Chatwidget(),
    Status(),
    Community(),
    Call(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;  // Update the selected index
    });
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF0B1014),
        body: pages[_selectedIndex],
        bottomNavigationBar: NavigationBarTheme(
          data: NavigationBarThemeData(
            elevation: 10,
            indicatorColor: Color(0xFF103629),
            backgroundColor: Color(0xFF0B1014),
            labelTextStyle: WidgetStateProperty.all(
              TextStyle(color: Colors.white),
            ),
          ),
          child: NavigationBar(
            selectedIndex: _selectedIndex, // Set the selected index
            onDestinationSelected: _onItemTapped, // Handle tap on navigation items
            destinations: [
              const NavigationDestination(icon: Icon(Icons.chat_sharp, color: Colors.white), label: "Chats",),
              const NavigationDestination(icon: Icon(Icons.update_sharp, color: Colors.white), label: "Updates"),
              const NavigationDestination(icon: Icon(Icons.people_alt_sharp,  color: Colors.white), label: "Communities"),
              const NavigationDestination(icon: Icon(Icons.call,  color: Colors.white), label: "Calls"),
            ],),
        ),
      ),
    );
  }
}

class Chatwidget extends StatefulWidget {
  const Chatwidget({super.key});

  @override
  State<Chatwidget> createState() => _ChatwidgetState();
}

class _ChatwidgetState extends State<Chatwidget> {
  List<Chat>chatlist = [
    Chat(url: "assets/images/pm1.png", names: "alex", message: "Let me know if you're free", time: "7:45 am", readstatus: true, viewMsg: true, msgRevd : true, unreadCount: 0),
    Chat(url: "assets/images/pw1.png", names: "zoe", message: "Got the tickets!", time: "9:10 am", readstatus: false, viewMsg: false, msgRevd: true, unreadCount: 2),
    Chat(url: "assets/images/pm2.png", names: "david", message: "I'll join the meeting", time: "2:30 pm", readstatus: true, viewMsg: true, msgRevd: false,unreadCount: 0),
    Chat(url: "assets/images/pw2.png", names: "nina", message: "Can we reschedule?", time: "4:15 pm", readstatus: false, viewMsg: false, msgRevd: true, unreadCount: 1),
    Chat(url: "assets/images/pm4.png", names: "liam", message: "Heading out now", time: "5:45 pm", readstatus: false, viewMsg: true, msgRevd: false, unreadCount: 0),
    Chat(url: "assets/images/pm5.png", names: "chloe", message: "See you at the party!", time: "8:10 pm", readstatus: false, viewMsg: true, msgRevd: true, unreadCount: 0),
    Chat(url: "assets/images/pm6.png", names: "oliver", message: "Thanks for the help!", time: "9:20 pm", readstatus: false,  viewMsg: false, msgRevd: false, unreadCount: 0),
    Chat(url: "assets/images/pw3.png", names: "hope", message: "I’ll be there soon", time: "11:00 pm", readstatus: false, viewMsg: true, msgRevd: true, unreadCount: 0),
    Chat(url: "assets/images/pm7.png", names: "paul", message: "Okayy", time: "Yesterday", readstatus: false, viewMsg: false, msgRevd: true, unreadCount: 4),
    Chat(url: "assets/images/pw5.png", names: "yami", message: "will text you later", time: "Yesterday", readstatus: true, viewMsg: true, msgRevd: false, unreadCount: 0),
    Chat(url: "assets/images/pm8.png", names: "john", message: "See you tomorrow", time: "30/10/24", readstatus: false, viewMsg: false, msgRevd: true, unreadCount: 2),
    Chat(url: "assets/images/pw6.png", names: "emma", message: "I’ll call you later", time: "22/10/24", readstatus: true, viewMsg: true, msgRevd: false, unreadCount: 0),
    Chat(url: "assets/images/pw7.png", names: "sam", message: "Can we meet?", time: "10/01/24", readstatus: false, viewMsg: true, msgRevd: true, unreadCount: 0),
    Chat(url: "assets/images/pw4.png", names: "ava", message: "Thanks for the update", time: "25/12/23", readstatus: false,  viewMsg: true, msgRevd: false, unreadCount: 0),
    Chat(url: "assets/images/pw8.png", names: "riya", message: "Good night", time: "15/08/23", readstatus: false, viewMsg: false, msgRevd: true, unreadCount: 1),
  ];

  TextEditingController seacrhController = TextEditingController();

  List<Chat>filtereditems = []; //to store filtered data

  @override
  void initState() {
    super.initState();
    filtereditems = chatlist; //initially diaply all items
  }

  // Function to filter the list based on search input
  void filterSearch(String query) {
    List<Chat> tempList = [];
    if (query.isNotEmpty) {
      tempList = chatlist
          .where((item) => item.names.toLowerCase().contains(query.toLowerCase()))
          .toList();
    } else {
      tempList = chatlist; // If query is empty, show all items
    }
    setState(() {
      filtereditems = tempList;
    });
  }

  @override
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF0B1014),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: const Color(0xFF0B1014),
          title: const Text(
            "WhatsApp",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.qr_code_scanner),
              color: Colors.white,
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.camera_alt_outlined),
              color: Colors.white,
            ),
            PopupMenuButton<int>(
              icon: const Icon(Icons.more_vert, color: Colors.white),
              color: const Color(0xFF151D24),
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              onSelected: (value) {
                // Handle menu item selection
                switch (value) {
                  case 1:
                    print("New group selected");
                    break;
                  case 2:
                    print("New broadcast selected");
                    break;
                  case 3:
                    print("Linked devices selected");
                    break;
                  case 4:
                    print("Starred messages");
                    break;
                  case 5:
                    print("Payments");
                    break;
                  case 6:
                    print("Settings");
                    break;
                }
              },
              offset: const Offset(0, 50),
              itemBuilder: (context) => [
                const PopupMenuItem(
                  value: 1,
                  child: Text("New group", style: TextStyle(color: Colors.white, fontSize: 16)),
                ),
                const PopupMenuItem(
                  value: 2,
                  child: Text("New broadcast", style: TextStyle(color: Colors.white, fontSize: 16)),
                ),
                const PopupMenuItem(
                  value: 3,
                  child: Text("Linked devices", style: TextStyle(color: Colors.white, fontSize: 16)),
                ),
                const PopupMenuItem(
                  value: 4,
                  child: Text("Starred messages", style: TextStyle(color: Colors.white, fontSize: 16)),
                ),
                const PopupMenuItem(
                  value: 5,
                  child: Text("Payments", style: TextStyle(color: Colors.white, fontSize: 16)),
                ),
                const PopupMenuItem(
                  value: 6,
                  child: Text("Settings", style: TextStyle(color: Colors.white, fontSize: 16)),
                ),
              ],
            ),
          ],
        ),
        body: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            const SizedBox(height: 3),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: TextField(
                controller: seacrhController,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(0),
                  filled: true,
                  fillColor: const Color(0xFF242b31),
                  hintText: "Search",
                  hintStyle: const TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                ),
                style: const TextStyle(color: Colors.white),
                onChanged: (value) {
                  filterSearch(value);
                },
              ),
            ),
            const SizedBox(height: 20),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: filtereditems.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {},
                  child: Container(
                    height: 80,
                    width: 200,
                    color: const Color(0xFF0B1014),
                    child: Stack(
                      children: [
                        Positioned(
                          left: 15,
                          child: CircleAvatar(
                            radius: 25,
                            backgroundImage: AssetImage(filtereditems[index].url),
                          ),
                        ),
                        Positioned(
                          left: 75,
                          top: 4,
                          child: Text(
                            filtereditems[index].names,
                            style: const TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                        Positioned(
                          left: 75,
                          top: 31,
                          child: Text(
                            filtereditems[index].message,
                            style: const TextStyle(color: Colors.grey, fontSize: 15),
                          ),
                        ),
                        Positioned(
                          right: 16,
                          top: 15,
                          child: Text(
                            filtereditems[index].time,
                            style: const TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                        ),
                        if (!filtereditems[index].viewMsg && filtereditems[index].unreadCount > 0)
                          Positioned(
                            right: 18,
                            top: 38,
                            child: Container(
                              width: 20,
                              height: 20,
                              decoration: const BoxDecoration(
                                color: Color(0xFF21C063),
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Text(
                                  "${filtereditems[index].unreadCount}",
                                  style: const TextStyle(
                                    color: Color(0xFF0B1014),
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) {
                  return const Contact_list();
                },
              ),
            );
          },
          backgroundColor: const Color(0xFF21C063),
          elevation: 20,
          child: const Icon(Icons.add_comment_sharp, color: Colors.black, size: 23),
        ),
      ),
    );
  }
}
