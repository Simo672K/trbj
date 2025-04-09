import 'package:flutter/material.dart';
import 'package:trbj/src/features/init/presentation/navigation_bar/navbar_notifier.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: screenIndex,
      builder: (context, selectedIndex, child) {
        return NavigationBar(
          onDestinationSelected: (int index) {
            screenIndex.value = index;
          },

          selectedIndex: selectedIndex,
          destinations: [
            NavigationDestination(
              icon: Icon(Icons.home_rounded),
              label: "Inicio",
            ),
            NavigationDestination(
              icon: Icon(Icons.business_rounded),
              label: "Clients",
            ),
            NavigationDestination(icon: Icon(Icons.people), label: "Obreros"),
            NavigationDestination(icon: Icon(Icons.settings), label: "Ajustes"),
          ],
        );
      },
    );
  }
}
