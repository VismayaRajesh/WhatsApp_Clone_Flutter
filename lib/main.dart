import 'package:flutter/material.dart';
import 'package:whatsapp_clone_flutter/Community.dart';
import 'package:whatsapp_clone_flutter/call.dart';
import 'package:whatsapp_clone_flutter/splash.dart';
import 'package:whatsapp_clone_flutter/whatsapp_chat.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: splash(),
    );
  }
}




