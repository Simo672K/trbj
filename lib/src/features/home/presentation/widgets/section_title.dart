import 'package:flutter/material.dart';
import 'package:trbj/src/features/home/presentation/widgets/text_widget.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({super.key, required this.icon, required this.title});
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 16, color: Colors.grey[600]),
        SizedBox(width: 4),
        StyledTitle(title),
      ],
    );
  }
}
