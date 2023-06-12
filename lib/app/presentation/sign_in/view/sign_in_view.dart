import 'package:firebase_chat/app/components/buttons/register_widget.dart';
import 'package:firebase_chat/app/constants/containers/containers.dart';
import 'package:firebase_chat/app/constants/text_styles/app_text_styles.dart';
import 'package:flutter/material.dart';
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
                    // _controller.email.value = value;
                  },
                  decoration: registerDecoration.copyWith(
                      hintText: 'Email', prefixIcon: const Icon(Icons.email)),
                ),
                sizedBox,
                TextField(
                  onChanged: (value) {
                    // _controller.password.value = value;
                  },
                  decoration: registerDecoration.copyWith(
                      hintText: 'Password', prefixIcon: const Icon(Icons.key)),
                ),
                Row(
                  children: [
                    const Text(
                      'Don\'t have an account?',
                      style: AppTextStyles.black25,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    InkWell(
                      onTap: () => context.go('/sign_up'),
                      child: const Text(
                        'Sign Up',
                        style: AppTextStyles.black30Bold,
                      ),
                    ),
                  ],
                ),
                sizedBox,
                RegisterWidget(
                  text: 'Sign In',
                  onTap: () {
                    // _controller.signIn();
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
