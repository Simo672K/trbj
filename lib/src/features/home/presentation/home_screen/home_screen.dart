import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trbj/src/features/client/domain/client_provider.dart';
import 'package:trbj/src/features/home/presentation/widgets/home_overview_card.dart';
import 'package:trbj/src/features/home/presentation/widgets/operation_record_card.dart';
import 'package:trbj/src/features/home/presentation/widgets/section_title.dart';
import 'package:trbj/src/features/home/presentation/widgets/text_widget.dart';
import 'package:trbj/src/features/home/presentation/widgets/transactions_record.dart';
import 'package:trbj/src/theme/app_theme.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(clientsProvider);

    return SingleChildScrollView(
      child: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                    colors: [
                      AppThemeColors.secondaryColorAccent,
                      AppThemeColors.secondaryColor,
                      AppThemeColors.primaryColorAccent,
                      AppThemeColors.primaryColor,
                    ],
                  ),
                ),
                margin: EdgeInsets.symmetric(vertical: 16),
                padding: EdgeInsets.symmetric(vertical: 24, horizontal: 8),
                child: StyledDisplay(
                  "👋 Holla, buenas!",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SectionTitle(
                icon: Icons.info_outline,
                title: "Inicio y informaciones.",
              ),
              SizedBox(height: 12),
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
                      data: data.clients.length.toString(),
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

              Divider(indent: 36, endIndent: 36),

              SizedBox(height: 16),
              SectionTitle(icon: Icons.description_outlined, title: "Nóminas"),

              SizedBox(height: 12),
              OperationRecordCard(),
              SizedBox(height: 16),

              Divider(indent: 36, endIndent: 36),
              SizedBox(height: 16),

              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.history, size: 16, color: Colors.grey[600]),
                  SizedBox(width: 4),
                  StyledTitle("operaciones recientes"),
                  Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "ver mas",
                      style: TextStyle(fontSize: 14, color: Colors.blueAccent),
                    ),
                  ),
                ],
              ),
              TransactionsRecord(),
              TransactionsRecord(),
              TransactionsRecord(),
              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
