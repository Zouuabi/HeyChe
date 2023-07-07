import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

import 'package:social_media_app/presentation/resources/app_strings.dart';

import '../presentation/authentification/login_screen.dart';
import '../presentation/authentification/sign_up_screen.dart';
import '../presentation/main/main_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: AppStrings.appName,
        theme: ThemeData(
        
          useMaterial3: true,
        ),
        home: StreamBuilder(
          stream: FirebaseAuth.instance.userChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              if (snapshot.hasData) {
                return MainScreen();
              } else if (snapshot.hasError) {
                return const Center(
                  child: Text('there is an eroor'),
                );
              }
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return const LoginScreen();
            }
          },
        ),
        routes: {
          LoginScreen.id: (context) => const LoginScreen(),
          SignUpScreen.id: (context) => const SignUpScreen(),
          MainScreen.id: (context) => MainScreen(),
        });

    // home: const Layout(
    //   mobileScreenLayout: MobileScreenLayout(),
    //   webScreenLayout: WebScreenLayout(),
  }
}

class Layout extends StatelessWidget {
  const Layout(
      {super.key,
      required this.mobileScreenLayout,
      required this.webScreenLayout});
  final Widget mobileScreenLayout;
  final Widget webScreenLayout;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > 600) {
        return webScreenLayout;
      } else {
        return mobileScreenLayout;
      }
    });
  }
}

class WebScreenLayout extends StatelessWidget {
  const WebScreenLayout({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Center(
        child: Text(
          "Web",
          style: TextStyle(fontSize: width * 0.1),
        ),
      ),
    );
  }
}

class MobileScreenLayout extends StatelessWidget {
  const MobileScreenLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Mobile"),
      ),
    );
  }
}
