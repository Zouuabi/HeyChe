import 'package:flutter/material.dart';

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
