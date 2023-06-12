import 'package:firebase_chat/app/components/buttons/register_widget.dart';
import 'package:firebase_chat/app/constants/containers/containers.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welocome View'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RegisterWidget(
                text: 'Sign In',
                onTap: () => context.go('/sign_in'),
              ),
              sizedBox,
              RegisterWidget(
                text: 'Sign Up',
                onTap: () => context.go('/sign_up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
