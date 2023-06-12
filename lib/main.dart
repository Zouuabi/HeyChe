import 'package:flutter/material.dart';
import 'layout/mobile_screen_layout.dart';
import 'layout/web_screen_layout.dart';
import './layout/layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    print("main build");
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Social Media App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const Layout(
          mobileScreenLayout: MobileScreenLayout(),
          webScreenLayout: WebScreenLayout(),
        ));
  }
}
