import 'package:flutter/material.dart';

class Layout extends StatelessWidget {
  const Layout({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > 600) {
        return Container(
          width: 200,
          height: 200,
          color: Colors.blueAccent,
        );
      } else {
        return Container(
          width: 200,
          height: 200,
          color: Colors.amber,
        );
      }
    });
  }
}
