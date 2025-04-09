import 'package:flutter/material.dart';
import 'package:trbj/src/features/init/presentation/init_screen/init_screen.dart';
import 'package:trbj/src/theme/app_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: appTheme,
      home: InitScreen(),
    );
  }
}
