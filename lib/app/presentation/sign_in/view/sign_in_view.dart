import 'package:firebase_chat/app/components/buttons/register_widget.dart';
import 'package:firebase_chat/app/constants/containers/containers.dart';
import 'package:firebase_chat/app/constants/text_styles/app_text_styles.dart';
import 'package:firebase_chat/app/models/users/user_model.dart';
import 'package:firebase_chat/app/presentation/sign_in/cubit/sign_in_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignInView extends StatelessWidget {
  const SignInView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SignUpView'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                sizedBox,
                TextField(
                  onChanged: (value) {
                    userModel.email = value;
                  },
                  decoration: registerDecoration.copyWith(
                      hintText: 'Email', prefixIcon: const Icon(Icons.email)),
                ),
                sizedBox,
                TextField(
                  onChanged: (value) {
                    // _controller.password.value = value;
                    userModel.password = value;
                  },
                  decoration: registerDecoration.copyWith(
                      hintText: 'Password', prefixIcon: const Icon(Icons.key)),
                ),
                Row(
                  children: [
                    const Text(
                      'Don\'t have an account?',
                      style: AppTextStyles.black20,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    InkWell(
                      onTap: () => context.go('/sign_up'),
                      child: const Text(
                        'Sign Up',
                        style: AppTextStyles.black25Bold,
                      ),
                    ),
                  ],
                ),
                sizedBox,
                RegisterWidget(
                  text: 'Sign In',
                  onTap: () {
                    context.read<SignInCubit>().signIn();
                    context.go('/chat');
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
