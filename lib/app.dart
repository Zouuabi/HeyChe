import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:social_media_app/config/themes/themes.dart';

import 'injector.dart';
import 'presentation/login/pages/login_page.dart';
import 'presentation/register/pages/register_page.dart';
import 'presentation/main/main_screen.dart';
import 'core/utils/strings_manager.dart';

class MyApp extends StatelessWidget {
  // TODO : immigrate to Bloc pattern instead of provider
  // TODO : make profile screen Ui more responsive
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: StringsManager.appName,
        theme: applicationTheme(),
        home: StreamBuilder(
          // TODO: seperate myapp root logic and firebase auth persistence
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
              initLoginModule();
              return LoginPage();
            }
          },
        ),
        routes: {
          LoginPage.id: (context) {
            initLoginModule();
            return LoginPage();
          },
          RegisterPage.id: (context) => const RegisterPage(),
          MainScreen.id: (context) => MainScreen(),
        });
  }
}

// ! for later update
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
