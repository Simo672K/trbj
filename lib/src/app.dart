import 'package:flutter/material.dart';
import 'package:trbj/src/routing/router.dart';
import 'package:trbj/src/theme/app_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: appTheme,
      routerConfig: appRouter,
    );
  }
}
