import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone_flutter/screens/whatsapp_chat.dart';

class splash extends StatefulWidget {
  const splash({super.key});
  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  void initState() {
    super.initState();
    // Timer(
    //   Duration(seconds: 2),() {
    //     Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
    //       return screen();
    //     }));
    // });
    Future.delayed(Duration(seconds: 1), () {
      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
        return WhtChat();
      }));
    });}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0B141B),
      body: Center(
          child: Container(
              height: 70,
              width: 70,
              child: Image(image: AssetImage("assets/images/whatsApp.png"),
                fit: BoxFit.cover,))
      ),
    );
  }
}

