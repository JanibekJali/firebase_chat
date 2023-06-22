import 'package:firebase_chat/app/presentation/chat/messages/send_messages.dart';
import 'package:firebase_chat/app/presentation/chat/messages/stream_message.dart';
import 'package:flutter/material.dart';

class ChatView extends StatelessWidget {
  const ChatView({
    Key? key,
  }) : super(key: key);
  // final String? senderId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to Chat View'),
      ),
      body: Column(
        children: [
          StreamMessage(),
          SendMessages(),
        ],
      ),
    );
  }
}
