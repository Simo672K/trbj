import 'package:flutter/material.dart';
import 'package:trbj/src/features/home/presentation/widgets/text_widget.dart';
import 'package:trbj/src/theme/app_theme.dart';

class HomeOverviewCard extends StatelessWidget {
  const HomeOverviewCard({
    super.key,
    this.primary = true,
    required this.title,
    required this.icon,
    required this.data,
  });
  final String title;
  final IconData icon;
  final String data;

  final bool primary;
  @override
  Widget build(BuildContext context) {
    return Card(
      color:
          primary ? AppThemeColors.primaryColor : AppThemeColors.secondaryColor,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        // side: BorderSide(color: Colors.grey),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color:
                        primary
                            ? AppThemeColors.primaryColorAccent
                            : AppThemeColors.secondaryColorAccent,
                  ),
                  width: 24,
                  height: 24,
                  child: Icon(icon, size: 18, color: Colors.grey[300]),
                ),
                Expanded(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.centerLeft,
                    child: CardHeading(
                      title,
                      style: TextStyle(color: Colors.grey[300]),
                    ),
                  ),
                ),
              ],
            ),
            Divider(height: 12),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 4),
              child: StyledDisplay(data, style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
