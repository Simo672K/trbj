import 'package:flutter/material.dart';

class ChooseImageFile extends StatelessWidget {
  const ChooseImageFile({super.key, required this.callback});

  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: callback,
      style: OutlinedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),

        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
      ),

      icon: Icon(Icons.image_outlined, size: 14),
      label: Text('Seleccione imagen', style: TextStyle(fontSize: 12)),
    );
  }
}
