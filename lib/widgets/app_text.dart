import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  String label;
  String hint;
  bool password;
  TextEditingController controller;
  FormFieldValidator<String>? validator;
  TextInputType? keyboardType;
  TextInputAction? textInputAction;
  FocusNode? focusNode;
  FocusNode? nextFocus;

  AppText(this.label,
      this.hint,
      {this.password = false,
        required this.controller,
        this.validator,
        this.keyboardType,
        this.textInputAction,
        this.focusNode,
        this.nextFocus});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: password,
      validator: validator,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      focusNode: focusNode,
      onFieldSubmitted: (String text) {
        if (nextFocus != null) {
          FocusScope.of(context).requestFocus(nextFocus);
        }
      },
      style: const TextStyle(fontSize: 25, color: Colors.blue),
      decoration: InputDecoration(
          border:OutlineInputBorder(
            borderRadius: BorderRadius.circular(16)
          ),
          labelText: label,
          labelStyle: const TextStyle(fontSize: 25, color: Colors.grey),
          hintText: hint,
          hintStyle: const TextStyle(fontSize: 16)),
    );
  }
}
