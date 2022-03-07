import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  final String chatWithUsername;
  final String username;
  const ChatScreen(
      {Key? key, required this.chatWithUsername, required this.username})
      : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late String chatId, messageId = "";
  late String myname, myPic, myUsername,myEmail;

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.username),
      ),
    );
  }
}
