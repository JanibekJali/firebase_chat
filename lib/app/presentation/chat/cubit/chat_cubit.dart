import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_chat/app/data/firebase/collections/firebase_collection.dart';
import 'package:firebase_chat/app/models/chat/chat_model.dart';
import 'package:firebase_chat/app/models/users/user_model.dart';
import 'package:meta/meta.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());
  Future<void> sendMessage() async {
    // User user;
    final _chatModel = ChatModel(
      sender: userModel.email,
      senderId: userModel.id,
      sms: chatModel.sms,
      smsId: userModel.id,
    );
    return chats
        .add(_chatModel.toJson())
        .then((_) => log("User Added"))
        .catchError(
          (error) => log("Failed to add user: $error"),
        );
  }
}
