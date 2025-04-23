import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  const InputField({
    super.key,
    this.controller,
    required this.placeholder,
    this.type,
    this.validatorRules,
  });

  final TextInputType? type;
  final TextEditingController? controller;
  final String placeholder;
  final FormFieldValidator<String>? validatorRules;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      keyboardType: type,
      validator: validatorRules,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(left: 16, top: 1, bottom: 1),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(7.5)),
        hintText: placeholder,
        hintStyle: TextStyle(fontSize: 14, color: Colors.grey[600]),
      ),
      style: TextStyle(fontSize: 14),
    );
  }
}
