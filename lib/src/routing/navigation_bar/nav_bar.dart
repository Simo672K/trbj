import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      onDestinationSelected: (int index) {
        setState(() {
          selectedIndex = index;
        });
        switch (index) {
          case 0:
            context.go("/home");
            break;
          case 1:
            context.go("/client");
            break;
          case 2:
            context.go("/employee");
            break;
          case 3:
            context.go("/settings");
            break;
        }
      },

      selectedIndex: selectedIndex,
      destinations: [
        NavigationDestination(icon: Icon(Icons.home_rounded), label: "Inicio"),
        NavigationDestination(
          icon: Icon(Icons.business_rounded),
          label: "Clients",
        ),
        NavigationDestination(icon: Icon(Icons.people), label: "Obreros"),
        NavigationDestination(icon: Icon(Icons.settings), label: "Ajustes"),
      ],
    );
  }
}
