import 'package:flutter/material.dart';
import 'package:trbj/src/features/home/presentation/navigation_bar/nav_bar.dart';
import 'package:trbj/src/features/home/presentation/widgets/action_btn.dart';
import 'package:trbj/src/features/home/presentation/widgets/employees_table.dart';
import 'package:trbj/src/features/home/presentation/widgets/home_overview_card.dart';
import 'package:trbj/src/features/home/presentation/widgets/text_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Trbj".toUpperCase())),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 32),
              StyledHeading("Inicio y informaciones."),
              SizedBox(height: 10),
              Row(
                spacing: 8,
                children: [
                  Expanded(
                    child: HomeOverviewCard(
                      title: "Obreros total",
                      data: "15",
                      icon: Icons.people,
                    ),
                  ),
                  Expanded(
                    child: HomeOverviewCard(
                      primary: false,
                      title: "clientes total",
                      data: "5",
                      icon: Icons.business_rounded,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                spacing: 8,
                children: [
                  Expanded(
                    child: HomeOverviewCard(
                      primary: false,
                      title: "Obreros activo",
                      data: "4",
                      icon: Icons.people,
                    ),
                  ),
                  Expanded(
                    child: HomeOverviewCard(
                      title: "clientes activo",
                      data: "2",
                      icon: Icons.business_rounded,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              StyledHeading("Nómina mensual"),
              EmployeesTable(),
            ],
          ),
        ),
      ),
      floatingActionButton: ActionBtn(),
      bottomNavigationBar: NavBar(),
    );
  }
}
