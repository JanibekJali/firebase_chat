import 'package:cloud_firestore/cloud_firestore.dart';

final CollectionReference users =
    FirebaseFirestore.instance.collection('users');
final CollectionReference chats =
    FirebaseFirestore.instance.collection('chats');
