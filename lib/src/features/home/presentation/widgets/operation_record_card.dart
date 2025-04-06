import 'package:flutter/material.dart';
import 'package:trbj/src/features/home/presentation/widgets/text_widget.dart';
import 'package:trbj/src/theme/app_theme.dart';

class OperationRecordCard extends StatelessWidget {
  const OperationRecordCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppThemeColors.primaryColor.withAlpha(20),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.only(top: 16, bottom: 8),
      margin: EdgeInsets.only(top: 8),
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.access_time,
                        size: 16,
                        color: AppThemeColors.secondaryColor,
                      ),
                      SizedBox(width: 4),
                      CardHeading(
                        "pendiente",
                        style: TextStyle(color: AppThemeColors.secondaryColor),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  StyledDisplay(
                    "1",
                    style: TextStyle(
                      color: AppThemeColors.secondaryColorAccent,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 60, child: VerticalDivider(indent: 8, endIndent: 8)),
          Expanded(
            child: SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.monetization_on,
                        size: 16,
                        color: AppThemeColors.primaryColor,
                      ),
                      SizedBox(width: 4),
                      CardHeading(
                        "Pagado",
                        style: TextStyle(color: AppThemeColors.primaryColor),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  StyledDisplay(
                    "1",
                    style: TextStyle(color: AppThemeColors.primaryColorAccent),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
