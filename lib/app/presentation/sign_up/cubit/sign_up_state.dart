part of 'sign_up_cubit.dart';

class SignUpState {
  final TextEditingController? nameController;
  final TextEditingController? emailController;
  final TextEditingController? passwordController;

  SignUpState({
    this.nameController,
    this.emailController,
    this.passwordController,
  });
  SignUpState copyWith({
    TextEditingController? nameController,
    TextEditingController? emailController,
    TextEditingController? passwordController,
  }) {
    return SignUpState(
      nameController: nameController ?? this.nameController,
      emailController: emailController ?? this.emailController,
      passwordController: passwordController ?? this.passwordController,
    );
  }
}
