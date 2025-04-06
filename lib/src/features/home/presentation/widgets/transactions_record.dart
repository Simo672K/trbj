import 'package:flutter/material.dart';
import 'package:trbj/src/features/home/presentation/widgets/text_widget.dart';
import 'package:trbj/src/theme/app_theme.dart';

class TransactionsRecord extends StatelessWidget {
  const TransactionsRecord({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 12),
      width: double.infinity,
      height: 80,
      child: Card(
        elevation: 0,
        color: AppThemeColors.primaryColor.withAlpha(20),
        surfaceTintColor: Colors.transparent,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.person, size: 16),
                  SizedBox(width: 4),
                  StyledTitle(
                    "Mohammed HAMKI",
                    style: TextStyle(color: Colors.black),
                  ),
                  Expanded(child: SizedBox()),
                  Icon(
                    Icons.check,
                    size: 16,
                    color: const Color.fromARGB(255, 50, 107, 52),
                  ),
                  SizedBox(width: 1),
                  Text(
                    "pagado",
                    style: TextStyle(
                      color: const Color.fromARGB(255, 50, 107, 52),
                      fontWeight: FontWeight.w900,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              Expanded(child: SizedBox()),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.date_range_outlined,
                    size: 14,
                    color: Colors.grey[800],
                  ),
                  SizedBox(width: 4),
                  Text(
                    "Mar 25 - Avr 25",
                    style: TextStyle(color: Colors.grey[800], fontSize: 12),
                  ),
                  Expanded(child: SizedBox()),

                  Text("1370€", style: TextStyle(fontWeight: FontWeight.w900)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
