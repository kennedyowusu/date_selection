import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../screens/select_date.dart';
import '../screens/home_screen.dart';
import '../shared/colors.dart';

class AppRouter {
  late final GoRouter router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        name: 'home',
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const HomeScreen();
        },
      ),
      GoRoute(
        name: 'booking-details',
        path: '/booking-details',
        pageBuilder: (context, state) {
          return CustomTransitionPage<void>(
            key: state.pageKey,
            opaque: false,
            barrierColor: appBlack.withOpacity(0.5),
            transitionDuration: const Duration(milliseconds: 300),
            reverseTransitionDuration: const Duration(milliseconds: 300),
            child: const DateSelectionScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return child;
            },
          );
        },
      ),
    ],
  );
}
