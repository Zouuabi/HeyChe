import 'dart:typed_data';

import 'package:flutter/material.dart';

import '../../resources/app_colors.dart';

// !! this must be changed
notifyUserWithMsg(BuildContext context, String msg) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          icon: const Icon(
            Icons.remove_red_eye_outlined,
            color: Colors.purpleAccent,
          ),
          title: const Text('7ell 3inek ! '),
          content: Text(msg),
          actions: [
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("7adher 3arfi"))
          ],
        );
      });
}

class TextFieldInput extends StatefulWidget {
  const TextFieldInput({
    super.key,
    required this.icon,
    required this.hintText,
    required this.isPassword,
    required this.keyboardType,
    required this.textController,
  });
  final IconData? icon;
  final String hintText;
  final TextInputType keyboardType;
  final TextEditingController textController;
  final bool isPassword;

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
    isPressed = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
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

class StandardTextButton extends StatelessWidget {
  const StandardTextButton({
    super.key,
    required this.onPressed,
    required this.label,
  });

  final String label;

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(label),
    );
  }
}

class StandardButton extends StatelessWidget {
  const StandardButton({
    super.key,
    required this.onPressed,
    required this.label,
  });
  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          fixedSize: MaterialStateProperty.all(
              const Size(double.maxFinite * 0.5, 50))),
      onPressed: onPressed,
      child: Text(label),
    );
  }
}

class ProfileImage extends StatelessWidget {
  const ProfileImage({
    super.key,
    required this.onAdd,
    required this.image,
  });

  final Uint8List? image;
  final VoidCallback onAdd;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: AppColors.blue),
            width: 90,
            height: 90,
            child: image == null
                ? const Icon(
                    Icons.person,
                    size: 50,
                    color: Colors.white,
                  )
                : Image.memory(
                    //! selected image appearance must be recoded
                    image!,
                    fit: BoxFit.cover,
                  )),
        Positioned(
          bottom: -10,
          left: 45,
          child: IconButton(
            onPressed: onAdd,
            icon: const Icon(
              Icons.add_a_photo,
              color: AppColors.blue,
            ),
          ),
        )
      ],
    );
  }
}
