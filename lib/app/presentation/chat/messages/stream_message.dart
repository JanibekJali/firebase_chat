import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_chat/app/models/chat/chat_model.dart';
import 'package:firebase_chat/app/models/users/user_model.dart';
import 'package:flutter/material.dart';

class StreamMessage extends StatelessWidget {
  StreamMessage({Key? key}) : super(key: key);
  final Stream<QuerySnapshot> _chats =
      FirebaseFirestore.instance.collection('chats').snapshots();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _chats,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator(
            color: Colors.blue,
          );
        }

        return Expanded(
          child: ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data()! as Map<String, dynamic>;
              ChatModel chatModel = ChatModel.fromJson(data);
              return ListTile(
                title: !userModel.isMe!
                    ? Container(
                        decoration: const BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                        ),
                        child: Column(
                          children: [
                            Text(userModel.dateTime.toString()),
                            Text(userModel.name!),
                            Text(chatModel.sms!),
                          ],
                        ),
                      )
                    : Container(
                        decoration: const BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(10),
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                          ),
                        ),
                        child: Text(chatModel.sms!),
                      ),
                // subtitle: Text(
                //   data['company'],
                // ),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
