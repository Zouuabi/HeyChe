import 'package:flutter/material.dart';

class TextFieldInput extends StatefulWidget {
  TextFieldInput({
    super.key,
    required this.icon,
    required this.hintText,
    this.isPassword = false,
    required this.keyboardType,
    required this.textController,
  });
  final IconData? icon;
  final String hintText;
  final TextInputType keyboardType;
  final TextEditingController textController;
  bool isPassword = false;

  @override
  State<TextFieldInput> createState() => _TextFieldInputState();
}

class _TextFieldInputState extends State<TextFieldInput> {
  late bool isPressed;

  Widget showOrHidePasswor() {
    return IconButton(
      onPressed: () {
        setState(() {
          isPressed = isPressed ? false : true;
        });
      },
      icon: Icon(
        Icons.remove_red_eye_outlined,
        color: isPressed ? Colors.purple : Colors.black,
      ),
    );
  }

  @override
  void initState() {
    isPressed = false ; 
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        //! eye icon depends on isPassword property
        suffixIcon: widget.isPassword ? showOrHidePasswor() : null,
        prefixIcon: Icon(widget.icon),
        hintText: widget.hintText,
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
      ),
      keyboardType: widget.keyboardType,
      obscureText: widget.isPassword ? !isPressed : false,
      controller: widget.textController,
    );
  }
}
