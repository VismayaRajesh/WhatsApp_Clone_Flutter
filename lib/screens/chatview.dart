import 'package:flutter/material.dart';

import 'model.dart';

class Chatview extends StatefulWidget {
  final Contact contact;

  const Chatview({Key? key, required this.contact}) : super(key: key);

  @override
  State<Chatview> createState() => _ChatviewState();
}

class _ChatviewState extends State<Chatview> {
  final TextEditingController _messageController = TextEditingController();
  bool _isTyping = false; // To track if the user is typing
  List<Map<String, String>> _messages = []; // List to store messages

  @override
  void initState() {
    super.initState();
    _messageController.addListener(_onMessageChanged);
  }

  @override
  void dispose() {
    _messageController.removeListener(_onMessageChanged);
    _messageController.dispose();
    super.dispose();
  }

  void _onMessageChanged() {
    setState(() {
      _isTyping = _messageController.text.isNotEmpty;
    });
  }

  // Function to format the time manually
  String _formatTime(String timeString) {
    try {
      final DateTime time = DateTime.parse(timeString);
      int hour = time.hour;
      int minute = time.minute;

      String amPm = hour >= 12 ? "PM" : "AM";
      hour = hour % 12;
      if (hour == 0) hour = 12;

      return "$hour:${minute.toString().padLeft(2, '0')} $amPm";
    } catch (e) {
      return 'Invalid Time';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        leadingWidth: 35,
        toolbarHeight: 55,
        backgroundColor: Color(0xFF0B1014), // Original dark theme
        title: Padding(
          padding: const EdgeInsets.only(left: 4.0),
          child: Row(
            children: [
              InkWell(
                child: Icon(
                  Icons.arrow_back_sharp,
                  color: Colors.white,
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              CircleAvatar(
                backgroundImage: AssetImage(widget.contact.url),
                radius: 20,
              ),
              const SizedBox(width: 10),
              Text(
                widget.contact.name,
                style: const TextStyle(fontSize: 22, color: Colors.white),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.videocam_outlined, color: Colors.white, size: 26),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.call_outlined, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/backwall.jpg'), // Original dark wallpaper
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            // Message display area
            Expanded(
              child: ListView.builder(
                reverse: true,
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  return Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFF1F272A), // Original bubble background
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 4,
                                bottom: 19,
                                left: 15,
                                right: 40,
                              ),
                              child: Text(
                                _messages[index]['text']!,
                                style: TextStyle(color: Colors.white, fontSize: 16),
                              ),
                            ),
                            Positioned(
                              bottom: 4,
                              right: 10,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    _formatTime(_messages[index]['time']!),
                                    style: TextStyle(
                                      color: Color(0xFF8D9598),
                                      fontSize: 12,
                                    ),
                                  ),
                                  const SizedBox(width: 6),
                                  Icon(
                                    Icons.done_all,
                                    color: Colors.grey,
                                    size: 16,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            // Message input field
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _messageController,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Message',
                        hintStyle: const TextStyle(
                          color: Color(0xFF8D9598),
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                        prefixIcon: const Icon(
                          Icons.emoji_emotions_outlined,
                          color: Color(0xFF8D9598),
                        ),
                        suffixIcon: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Icon(Icons.attach_file, color: Color(0xFF8D9598), size: 22),
                            SizedBox(width: 14),
                            Icon(Icons.paid_sharp, color: Color(0xFF8D9598)),
                            SizedBox(width: 14),
                            Icon(Icons.camera_alt_outlined, color: Color(0xFF8D9598)),
                            SizedBox(width: 10),
                          ],
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: const Color(0xFF1F272A),
                        contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                      ),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Container(
                    height: 48,
                    width: 48,
                    decoration: const BoxDecoration(
                      color: Color(0xFF23A462), // Original send button green
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      onPressed: () {
                        if (_isTyping) {
                          setState(() {
                            _messages.add({
                              'text': _messageController.text,
                              'time': DateTime.now().toIso8601String(),
                            });
                          });
                          _messageController.clear();
                        }
                      },
                      icon: Icon(
                        _isTyping ? Icons.send_sharp : Icons.mic,
                        size: 25,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
