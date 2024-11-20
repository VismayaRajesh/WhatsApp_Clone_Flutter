import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'chatview.dart';
import 'model.dart';

class Contact_list extends StatefulWidget {
  const Contact_list({super.key});

  @override
  State<Contact_list> createState() => _Contact_listState();
}

class _Contact_listState extends State<Contact_list> {
  List<Contact> Contactlist = [
    Contact(name: 'Sophia', subtitle: 'Loving the little things 🌸', url: 'assets/images/cw1.png'),
    Contact(name: 'david', subtitle: 'Dreaming big, living small ✨', url: 'assets/images/pm2.png'),
    Contact(name: 'Amélie', subtitle: "I believe in kindness, coffee, and late-night talks ☕", url: 'assets/images/cw2.png'),
    Contact(name: 'ava', subtitle: 'The world is my playground 🌍', url: 'assets/images/pw4.png'),
    Contact(name: 'Hiro', subtitle: 'Exploring life one step at a time 🎌', url: 'assets/images/cm1.png'),
    Contact(name: 'Lena', subtitle: 'Bookworm in a tech-driven world 📚💻', url: 'assets/images/cw3.png'),
    Contact(name: 'hope', subtitle: 'Coding by day, gaming by night 🎮', url: 'assets/images/pw3.png'),
    Contact(name: 'Mia', subtitle: 'Catching sunsets and chasing dreams!', url: 'assets/images/cw4.png'),
    Contact(name: 'paul', subtitle: 'Lost in music 🎵, found in books 📖', url: 'assets/images/pm7.png'),
    Contact(name: 'john', subtitle: 'Life’s too short for bad coffee ☕', url: 'assets/images/pm8.png'),
    Contact(name: 'sam', subtitle: 'Adventurer at heart, dreamer by soul 🚴‍♂️', url: 'assets/images/pw7.png'),
    Contact(name: 'Elena', subtitle: 'Making memories and collecting smiles.', url: 'assets/images/cm3.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0B1014),
        titleSpacing: 0,
        leading: InkWell(child: Icon(Icons.arrow_back_sharp, color: Colors.white, size: 26),
        onTap: (){
          Navigator.pop(context);
        },),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Select contact",
              style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 1),
            Text("10 contacts", style: TextStyle(color: Colors.white, fontSize: 12)),
          ],
        ),
        actions: [
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
          SizedBox(height: 8),
          ListTile(
            leading: const CircleAvatar(
              backgroundColor: Color(0xFF25D366), // Green WhatsApp color
              child: Icon(
                Icons.group_add_sharp,
                color: Colors.black,
              ),
            ),
            title: const Text(
              "New group",
              style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.w500),
            ),
            onTap: () {},
          ),
          SizedBox(height: 12),

          // "New Contact"
          ListTile(
            leading: const CircleAvatar(
              backgroundColor: Color(0xFF25D366),
              child: Icon(
                Icons.person_add_alt_sharp,
                color: Colors.black,
              ),
            ),
            title: const Text(
              "New contact",
              style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.w500),
            ),
            trailing: Padding(
              padding: const EdgeInsets.only(right: 30.0),
              child: const Icon(
                Icons.qr_code,
                color: Colors.white,
              ),
            ),
            onTap: () {
            },
          ),
          SizedBox(height: 12),
          ListTile(
            leading: const CircleAvatar(
              backgroundColor: Color(0xFF25D366),
              child: Icon(
                Icons.groups, size: 28,
                color: Colors.black,
              ),
            ),
            title: const Text(
              "New community",
              style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.w500),
            ),
            onTap: () {},
          ),
          SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.only(top: 4.0, left: 17.0),
            child: Text("Contacts on WhatsApp", style: TextStyle(color: Colors.grey, fontSize: 14, fontWeight: FontWeight.w500)),
          ),
          SizedBox(height: 6),
          ListTile(
            onTap: (){

            },
            leading: CircleAvatar(
              backgroundImage: AssetImage("assets/images/nora.jpg"),
            ),
            title: Text(
              "Vis (You)",
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500 , fontSize: 17),
            ),
            subtitle: Text(
              "Message yourself",
              style: const TextStyle(color: Colors.white70),
            ),
          ),
          // List of contacts
          ListView.builder(
            shrinkWrap: true, // Prevents the builder from taking up too much space
            physics: NeverScrollableScrollPhysics(), // Disable scrolling for this list, it's handled by the parent ListView
            itemCount: Contactlist.length,
            itemBuilder: (BuildContext context, int index) {
              final contact = Contactlist[index];
              return ListTile(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Chatview(contact: Contactlist[index]),
                      ),
                    );
                  },
                leading: CircleAvatar(
                  backgroundImage: AssetImage(contact.url),
                ),
                title: Text(
                  contact.name,
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 17),
                ),
                subtitle: Text(
                  contact.subtitle,
                  style: const TextStyle(color: Colors.white70),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
