import 'package:flutter/material.dart';
import 'package:social_media_app/presentation/login/pages/login_page.dart';
import 'package:social_media_app/presentation/main/main_screen.dart';
import 'package:social_media_app/presentation/register/pages/register_page.dart';

import '../../injector.dart';

class Routes {
  static const String splash = "/";
  static const String login = "/login";
  static const String register = "/register";
  static const String forgotPassword = "/forgotPassword";
  static const String onBoarding = "/onBoarding";
  static const String main = "/main";
  static const String storeDetails = "/profile";
}

Route<dynamic> unDefinedRoute() {
  return (MaterialPageRoute(builder: (_) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
              width: double.infinity, child: Center(child: Text('404 !'))),
          ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(_, Routes.login);
              },
              child: const Text('Go Back'))
        ],
      ),
    );
  }));
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(builder: (_) => const Placeholder());
      case Routes.login:
        initLoginModule();
        return MaterialPageRoute(builder: (_) => LoginPage());
      case Routes.register:
        initRegisterModule();
        return MaterialPageRoute(builder: (_) => const RegisterPage());
      case Routes.main:
        return MaterialPageRoute(builder: (_) => MainScreen());
      default:
        return unDefinedRoute();
    }
  }
}
