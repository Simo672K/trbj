import 'package:flutter/material.dart';
import 'package:trbj/src/theme/app_theme.dart';

class ActionBtn extends StatelessWidget {
  const ActionBtn({super.key, this.action});
  final VoidCallback? action;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: action,
      elevation: 0,
      backgroundColor: AppThemeColors.primaryColor,
      child: Icon(Icons.add, color: Colors.white),
    );
  }
}
