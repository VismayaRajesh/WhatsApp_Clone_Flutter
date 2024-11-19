import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone_flutter/model.dart';

class Chatview extends StatefulWidget {
  final Contact contact;

  const Chatview({Key? key, required this.contact}) : super(key: key);

  @override
  State<Chatview> createState() => _ChatviewState();
}

class _ChatviewState extends State<Chatview> {
  final TextEditingController _messageController = TextEditingController();
  bool _isTyping = false;  // To track if the user is typing

  @override
  void initState() {
    super.initState();
    // Add a listener to the controller to detect text changes
    _messageController.addListener(_onMessageChanged);
  }

  @override
  void dispose() {
    // Remove the listener and dispose the controller
    _messageController.removeListener(_onMessageChanged);
    _messageController.dispose();
    super.dispose();
  }

  // Function to update the state when the message changes
  void _onMessageChanged() {
    setState(() {
      _isTyping = _messageController.text.isNotEmpty;  // Check if there's any text
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        leadingWidth: 35,
        toolbarHeight: 55,
        backgroundColor: Color(0xFF0B1014),
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
                backgroundImage: NetworkImage(widget.contact.url),
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
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "assets/images/backwall.jpg",
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 20,
            left: 6,
            right: 6,
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
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
                    color: Color(0xFF23A462),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    onPressed: () {
                      if (_isTyping) {
                        // Send the message
                        _messageController.clear();  // Clear input field after sending message
                      } else {
                        // Start recording if the mic is clicked
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
    );
  }
}
