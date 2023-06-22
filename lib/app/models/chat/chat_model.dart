import 'package:firebase_auth/firebase_auth.dart';

class ChatModel {
  String? senderId;
  String? sender;
  String? smsId;
  String? sms = '';

  ChatModel({
    this.senderId = '',
    this.sender = '',
    this.smsId = '',
    this.sms = '',
  });
  Map<String, dynamic> toJson() => {
        'senderId': senderId,
        'sender': sender,
        'smsId': smsId,
        'sms': sms,
      };
  factory ChatModel.fromJson(Map<String, dynamic> json) => ChatModel(
        senderId: json['senderId'],
        sender: json['sender'],
        smsId: json['smsId'],
        sms: json['sms'],
      );
}

final ChatModel chatModel = ChatModel();
