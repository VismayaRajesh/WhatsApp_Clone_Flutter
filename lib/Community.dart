import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Community extends StatefulWidget {
  const Community({super.key});

  @override
  State<Community> createState() => _CommunityState();
}

class _CommunityState extends State<Community> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFF0B1014),
        title: Text(
          "Communities",
          style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w400),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.qr_code_scanner),
            color: Colors.white,
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.camera_alt_outlined),
            color: Colors.white,
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert),
            color: Colors.white,
          ),
        ],
      ),
      backgroundColor:Color(0xFF0B1014),
      body: Column(
        children: [
          SizedBox(height: 22,),
          Center(
            child: Container(height: 198,
                width: 198,
                child: Image(image: AssetImage("assets/images/commy.png"))),
          ),
          Text("Stay connected with a community", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),),
          SizedBox(height: 5,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Text("Communities bring members together in topic-based groups, and make it easy to get admin announcements. Any community you're added to will appear here.",
              style: TextStyle(color: Colors.white, height: 1.4, fontSize: 14), textAlign: TextAlign.center,),
          ),
          TextButton(onPressed: () {}, child: Text("See example communities  >", style: TextStyle(color: Colors.lightBlueAccent, fontSize: 14),)),
          SizedBox(height: 12,),
          ElevatedButton(onPressed: () {}, child:Text("Start your community"),
              style:  ElevatedButton.styleFrom(
                alignment: Alignment.center,
                backgroundColor: Color(0xFF21C063),
                foregroundColor: Colors.black87,
                padding: const EdgeInsets.symmetric(horizontal: 82.0, vertical: 9.0),
                shape: const StadiumBorder(),
              ),)
        ],
      ),
    ));
  }
}
