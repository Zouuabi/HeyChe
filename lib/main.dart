import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'screens/feed_screen.dart';
import 'screens/login_screen.dart';



import 'firebase_options.dart';
import 'screens/sign_up_screen.dart';
// import 'layout/layout.dart';
// import 'layout/mobile_screen_layout.dart';
// import 'layout/web_screen_layout.dart';


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
        initialRoute: LoginScreen.id,
        routes: {
          LoginScreen.id: (context) => const LoginScreen(),
          SignUpScreen.id: (context) => const SignUpScreen(),
          FeedScreen.id: (context) => const FeedScreen(),
        });
        
    // home: const Layout(
    //   mobileScreenLayout: MobileScreenLayout(),
    //   webScreenLayout: WebScreenLayout(),
  }
}
