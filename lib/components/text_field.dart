import 'package:flutter/material.dart';

class TextFieldInput extends StatelessWidget {
  const TextFieldInput({
    super.key,
    required this.icon,
    required this.hintText,
    this.ispassword = false,
    required this.keyboardType,
    required this.textController,
  });
  final IconData? icon;
  final String hintText;
  final bool ispassword;
  final TextInputType keyboardType;
  final TextEditingController textController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        hintText: hintText,
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
      ),
      keyboardType: keyboardType,
      obscureText: ispassword,
      controller: textController,
    );
  }
}
