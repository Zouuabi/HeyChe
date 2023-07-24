import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:social_media_app/core/utils/color_manager.dart';

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

