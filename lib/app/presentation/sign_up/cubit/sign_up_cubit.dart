import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_chat/app/data/firebase/collections/firebase_collection.dart';
import 'package:firebase_chat/app/models/users/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpState());

  Future<void> addUser() {
    return users.add(userModel.toJson())
      ..then((value) => log("User Added")).catchError(
        (error) => log("Failed to add user: $error"),
      );
  }

  Future<void> signUp() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email:
            state.copyWith(emailController: state.emailController).toString(),
        password: state
            .copyWith(passwordController: state.passwordController)
            .toString(),
      );
      // .then((value) => {
      //       addUser(),
      //     });

      log('email: state.emailController!.text ==> ${state.emailController!.text}');
      log('email: state.passwordController!.text ==> ${state.passwordController!.text}');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        log('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        log('The account already exists for that email.');
      }
    } catch (e) {
      log('catch error===> $e');
    }
  }
}
