import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trbj/src/features/client/presentation/client_screen/client_screen.dart';
import 'package:trbj/src/features/employee/presentation/employee_screen/employee_screen.dart';
import 'package:trbj/src/features/home/presentation/home_screen/home_screen.dart';
import 'package:trbj/src/routing/navigation_bar/nav_bar.dart';
import 'package:trbj/src/features/settings/presentation/settings_screen/settings_screen.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey();
final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey();

final GoRouter appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/home',
  routes: [
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder:
          (context, state, child) => Scaffold(
            appBar: AppBar(title: Text("Trbj".toUpperCase())),
            body: child,
            bottomNavigationBar: NavBar(),
          ),

      routes: [
        GoRoute(
          path: "/home",
          pageBuilder:
              (context, state) => const NoTransitionPage(child: HomeScreen()),
        ),
        GoRoute(
          path: "/client",
          pageBuilder:
              (context, state) => const NoTransitionPage(child: ClientScreen()),
        ),
        GoRoute(
          path: "/employee",
          pageBuilder:
              (context, state) =>
                  const NoTransitionPage(child: EmployeeScreen()),
        ),
        GoRoute(
          path: "/settings",
          pageBuilder:
              (context, state) =>
                  const NoTransitionPage(child: SettingsScreen()),
        ),
      ],
    ),
  ],
);
