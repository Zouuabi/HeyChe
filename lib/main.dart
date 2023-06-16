import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';

import 'package:social_media_app/screens/sign_up_screen.dart';

import 'firebase_options.dart';
// import 'layout/layout.dart';
// import 'layout/mobile_screen_layout.dart';
// import 'layout/web_screen_layout.dart';
import 'screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Social Media App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: 'loginScreen',
        routes: {
          'loginScreen': (context) => const LoginScreen(),
          'SignUpScreen': (context) => const SignUpScreen(),
        });
    // home: const Layout(
    //   mobileScreenLayout: MobileScreenLayout(),
    //   webScreenLayout: WebScreenLayout(),
  }
}
