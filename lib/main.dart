import 'package:firebase_chat/app/presentation/sign_in/cubit/sign_in_cubit.dart';
import 'package:firebase_chat/app/presentation/welcome/view/welcome_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app/presentation/sign_up/cubit/sign_up_cubit.dart';
import 'app/router/go_router.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SignInCubit>(
          create: (BuildContext context) => SignInCubit(),
        ),
        BlocProvider<SignUpCubit>(
          create: (BuildContext context) => SignUpCubit(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRoutes.router,
      ),
    );
  }
}
