import 'package:flutter/material.dart';

class Alert extends StatelessWidget {
  const Alert({
    super.key,
    required this.msg,
  });

  final String msg;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      height: 100,
      width: 50,
      child: Text('Error'),
    );
  }
}
