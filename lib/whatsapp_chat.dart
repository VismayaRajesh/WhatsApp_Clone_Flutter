import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'call.dart';
import 'model.dart';

class WhtChat extends StatefulWidget {
  const WhtChat({super.key});

  @override
  State<WhtChat> createState() => _WhtChatState();
}

class _WhtChatState extends State<WhtChat> {
  List<Chat>chatlist = [
    Chat(url: "https://images.unsplash.com/photo-1507525428034-b723cf961d3e", names: "alex", message: "Let me know if you're free", time: "7:45 am", readstatus: true, viewMsg: true, msgRevd : true, unreadCount: 0),
    Chat(url: "https://images.unsplash.com/photo-1506748686214-e9df14d4d9d0", names: "zoe", message: "Got the tickets!", time: "9:10 am", readstatus: false, viewMsg: false, msgRevd: true, unreadCount: 2),
    Chat(url: "https://images.unsplash.com/photo-1481277542470-605612bd2d61", names: "david", message: "I'll join the meeting", time: "2:30 pm", readstatus: true, viewMsg: true, msgRevd: false,unreadCount: 0),
    Chat(url: "https://images.unsplash.com/photo-1501973801540-537f08ccae7b", names: "nina", message: "Can we reschedule?", time: "4:15 pm", readstatus: false, viewMsg: false, msgRevd: true, unreadCount: 1),
    Chat(url: "https://images.unsplash.com/photo-1517423440428-a5a00ad493e8", names: "liam", message: "Heading out now", time: "5:45 pm", readstatus: false, viewMsg: true, msgRevd: false, unreadCount: 0),
    Chat(url: "https://images.unsplash.com/photo-1498050108023-c5249f4df085", names: "chloe", message: "See you at the party!", time: "8:10 pm", readstatus: false, viewMsg: true, msgRevd: true, unreadCount: 0),
    Chat(url: "https://images.unsplash.com/photo-1519125323398-675f0ddb6308", names: "oliver", message: "Thanks for the help!", time: "9:20 pm", readstatus: false,  viewMsg: false, msgRevd: false, unreadCount: 0),
    Chat(url: "https://images.unsplash.com/photo-1461749280684-dccba630e2f6", names: "hope", message: "I’ll be there soon", time: "11:00 pm", readstatus: false, viewMsg: true, msgRevd: true, unreadCount: 0),
    Chat(url: "https://m.media-amazon.com/images/I/917lA9Of4YL._AC_UF894,1000_QL80_.jpg", names: "veer", message: "Okayy", time: "Yesterday", readstatus: false, viewMsg: false, msgRevd: true, unreadCount: 4),
    Chat(url: "https://images.unsplash.com/photo-1454165804606-c3d57bc86b40", names: "yami", message: "will text you later", time: "Yesterday", readstatus: true, viewMsg: true, msgRevd: false, unreadCount: 0),
    Chat(url: "https://images.unsplash.com/photo-1495567720989-cebdbdd97913", names: "john", message: "See you tomorrow", time: "30/10/24", readstatus: false, viewMsg: false, msgRevd: true, unreadCount: 2),
    Chat(url: "https://images.unsplash.com/photo-1522202176988-66273c2fd55f", names: "emma", message: "I’ll call you later", time: "22/10/24", readstatus: true, viewMsg: true, msgRevd: false, unreadCount: 0),
    Chat(url: "https://images.unsplash.com/photo-1521747116042-5a810fda9664", names: "sam", message: "Can we meet?", time: "10/01/24", readstatus: false, viewMsg: true, msgRevd: true, unreadCount: 0),
    Chat(url: "https://images.unsplash.com/photo-1435527173128-983b87201f4d", names: "ava", message: "Thanks for the update", time: "25/12/23", readstatus: false,  viewMsg: true, msgRevd: false, unreadCount: 0),
    Chat(url: "https://images.unsplash.com/photo-1470071459604-3b5ec3a7fe05", names: "leo", message: "Good night", time: "15/08/23", readstatus: false, viewMsg: false, msgRevd: true, unreadCount: 1),
  ];

  TextEditingController seacrhController = TextEditingController();

  int _selectedIndex = 0;
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

  void onNavItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Add navigation logic based on the selected index
    if (index == 4) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Call()), // Navigate to the Call screen
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF0B1014),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Color(0xFF0B1014),
          title: Text("WhatsApp", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w600),),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.qr_code_scanner), color: Colors.white,),
            IconButton(onPressed: () {}, icon: Icon(Icons.camera_alt_outlined), color: Colors.white,),
            IconButton(onPressed: () {}, icon: Icon(Icons.more_vert), color: Colors.white,),
          ],
        ),
        body: Column(
          children: [
            SizedBox(
              height: 3,
            ),
            Container(
              height: 42,
              child: Padding(
                padding: const EdgeInsets.only(left: 14, right: 14,),
                child: TextField(
                  controller: seacrhController,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(0),
                      filled: true,
                      fillColor: Color(0xFF242b31),
                      hintText: "Search",
                      hintStyle: TextStyle(
                          color: Colors.grey
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide.none
                      ),
                      prefixIcon: Icon(Icons.search, color:  Colors.grey,)
                  ),
                  style: TextStyle(color: Colors.white),
                  onChanged: (value) {
                    filterSearch(value);
                  },
                ),
              ),
            ),

            SizedBox(
              height: 20,
            ),

            Flexible(
              child: Container(
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: filtereditems.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 80,
                      width: 200,
                      color: Color(0xFF0B1014),
                      child: Stack(
                        children: [
                          Positioned(
                            left: 15,
                            child: Container(
                              height: 50,
                              width: 50,
                              child: CircleAvatar(
                                backgroundImage: NetworkImage("${filtereditems[index].url}"),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 75,
                            top: 4,
                            child: Text(
                              "${filtereditems[index].names}",
                              style: TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                          if (filtereditems[index].msgRevd == true)
                          Positioned(
                            left: 75,
                            top: 31,
                            child: Text(
                              "${filtereditems[index].message}",
                              style: TextStyle(color: Colors.grey, fontSize: 15),
                            ),
                          ),
                          if (filtereditems[index].msgRevd == false)
                           Positioned(
                           left: 98,
                           top: 31,
                           child: Text(
                           "${filtereditems[index].message}",
                           style: TextStyle(color: Colors.grey, fontSize: 15),
                           ),
                          ),
                          Positioned(
                            right: 16,
                            top: 15,
                            child: Text(
                              "${filtereditems[index].time}",
                              style: TextStyle(color: Colors.grey, fontSize: 12),
                            ),
                          ),
                          if (filtereditems[index].msgRevd == true)
                            Positioned(
                              right: 18,
                              top: 38,
                              child: filtereditems[index].viewMsg == false
                                  ? Container(
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                  color: Color(0xFF21C063),
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: Text(
                                    "${filtereditems[index].unreadCount}",
                                    style: TextStyle(
                                      color: Color(0xFF0B1014),
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              )
                                  : SizedBox.shrink(),
                            )
                          else
                            Positioned(
                              left: 75,
                              top: 31,
                              child: Icon(
                                Icons.done_all_sharp,
                                color: filtereditems[index].readstatus ? Colors.blueAccent : Colors.grey,
                                size: 19,
                              ),
                            ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
        floatingActionButton: Container(
          height: 55,
          width: 55,
          child: FloatingActionButton(onPressed: () {},
            backgroundColor: Color(0xFF21C063),
            elevation: 20,
            child: Icon(Icons.add_comment_sharp, color: Colors.black, size: 23,),
          ),
        ) ,
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
            selectedIndex: _selectedIndex,
            onDestinationSelected: onNavItemTapped,
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
