import 'package:flutter/material.dart';
import 'package:trbj/src/features/client/presentation/client_screen/client_screen.dart';
import 'package:trbj/src/features/employee/presentation/employee_screen/employee_screen.dart';
import 'package:trbj/src/features/home/presentation/home_screen/home_screen.dart';
import 'package:trbj/src/features/home/presentation/widgets/action_btn.dart';
import 'package:trbj/src/features/init/presentation/navigation_bar/nav_bar.dart';
import 'package:trbj/src/features/init/presentation/navigation_bar/navbar_notifier.dart';
import 'package:trbj/src/features/settings/presentation/settings_screen/settings_screen.dart';

final List<Widget> screens = [
  HomeScreen(),
  ClientScreen(),
  EmployeeScreen(),
  SettingsScreen(),
];

class InitScreen extends StatelessWidget {
  const InitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Trbj".toUpperCase())),
      body: ValueListenableBuilder(
        valueListenable: screenIndex,
        builder: (context, index, child) {
          return screens[index];
        },
      ),
      floatingActionButton: ActionBtn(),

      bottomNavigationBar: NavBar(),
    );
  }
}
