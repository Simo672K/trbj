import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key, this.hintText, this.prefixIcon});
  final String? hintText;
  final IconData? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(left: 16, top: 1, bottom: 1),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(7.5)),
        hintText: hintText ?? 'buscar...',
        prefixIcon:
            prefixIcon != null
                ? Icon(prefixIcon, color: Colors.grey[600])
                : null,
        hintStyle: TextStyle(fontSize: 14, color: Colors.grey[600]),
        label: null,
      ),
      style: TextStyle(fontSize: 14),
    );
  }
}
