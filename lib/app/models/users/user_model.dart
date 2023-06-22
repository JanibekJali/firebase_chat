import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  String? name;
  String? email;
  String? password;
  String? id;
  DateTime dateTime = DateTime.parse('dateTime');

  bool? isMe;

  UserModel({
    this.name = '',
    this.email = '',
    this.id = '',
    this.password,
    this.isMe = false,
    required this.dateTime,
  });
  static UserModel fromJson(Map<String, dynamic> json) {
    return UserModel(
      dateTime: DateTime.fromMillisecondsSinceEpoch(
        json['dateTime'],
      ),
      name: json['name'],
      email: json['email'],
      id: json['id'],
      isMe: json['isMe'] != null ? json['isMe'] : false,
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'id': id,
        'isMe': isMe,
        'dateTime': dateTime.millisecondsSinceEpoch,
      };
}

final UserModel userModel = UserModel(dateTime: DateTime.parse('dateTime'));
