import 'package:flutter/material.dart';

class DataTableFallbackMsg extends StatelessWidget {
  const DataTableFallbackMsg({super.key, required this.msg});
  final String msg;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.all(16),
        child: Text(
          msg.toUpperCase(),
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 10,
            color: Colors.grey[600],
          ),
        ),
      ),
    );
  }
}
