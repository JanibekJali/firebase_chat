import 'package:firebase_chat/app/models/chat/chat_model.dart';
import 'package:firebase_chat/app/presentation/chat/cubit/chat_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SendMessages extends StatelessWidget {
  const SendMessages({
    Key? key,
    this.onChanged,
  }) : super(key: key);
  final Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        chatModel.sms = value;
      },
      decoration: InputDecoration(
        suffixIcon: IconButton(
          onPressed: () {
            context.read<ChatCubit>().sendMessage();
          },
          icon: const Icon(Icons.send),
        ),
        hintText: 'Type something...',
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(2.0)),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(10), topRight: Radius.circular(10)),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
      ),
    );
  }
}
