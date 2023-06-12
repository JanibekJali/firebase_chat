import 'package:firebase_chat/app/presentation/chat/views/chat_view.dart';
import 'package:firebase_chat/app/presentation/sign_in/view/sign_in_view.dart';
import 'package:firebase_chat/app/presentation/sign_up/view/sign_up_view.dart';
import 'package:firebase_chat/app/presentation/welcome/view/welcome_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const WelcomeView();
        },
        routes: <RouteBase>[
          GoRoute(
            path: 'sign_in',
            builder: (BuildContext context, GoRouterState state) {
              return const SignInView();
            },
          ),
          GoRoute(
            path: 'sign_up',
            builder: (BuildContext context, GoRouterState state) {
              return const SignUpView();
            },
          ),
          GoRoute(
            path: 'chat',
            builder: (BuildContext context, GoRouterState state) {
              return const ChatView();
            },
          ),
        ],
      ),
    ],
  );
}
