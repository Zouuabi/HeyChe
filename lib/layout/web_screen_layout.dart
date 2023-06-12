import 'package:flutter/material.dart';

class WebScreenLayout extends StatelessWidget {
  const WebScreenLayout({super.key});

  @override
  Widget build(BuildContext context) {
    print("web build");
    return const Scaffold(
      body: Center(
        child: Text("Web"),
      ),
    );
  }
}
