import 'package:firebase_chat/app/components/buttons/register_widget.dart';
import 'package:firebase_chat/app/constants/containers/containers.dart';
import 'package:firebase_chat/app/constants/text_styles/app_text_styles.dart';
import 'package:firebase_chat/app/models/users/user_model.dart';
import 'package:firebase_chat/app/presentation/sign_up/cubit/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SignUpView'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: BlocBuilder<SignUpCubit, SignUpState>(
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    onChanged: (value) {
                      userModel.name = value;
                    },
                    decoration: registerDecoration.copyWith(
                        hintText: 'Name', prefixIcon: const Icon(Icons.person)),
                  ),
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
                      userModel.password = value;
                    },
                    decoration: registerDecoration.copyWith(
                        hintText: 'Password',
                        prefixIcon: const Icon(Icons.key)),
                  ),
                  Row(
                    children: [
                      const Text(
                        'already have an account?',
                        style: AppTextStyles.black20,
                      ),
                      sizedBoxWidth20,
                      InkWell(
                        onTap: () => context.go('/sign_in'),
                        child: const Text(
                          'Sign In',
                          style: AppTextStyles.black25Bold,
                        ),
                      ),
                    ],
                  ),
                  sizedBox,
                  RegisterWidget(
                    text: 'Sign Up',
                    onTap: () {
                      context.read<SignUpCubit>().signUp();
                      context.go('/chat');
                    },
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
