import 'package:flutter/material.dart';
import 'package:social_media_app/presentation/login/pages/login_page.dart';
import 'package:social_media_app/presentation/register/register.dart';

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
    return const Scaffold(
      body: Center(
        child: Text('404 !'),
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
        return MaterialPageRoute(builder: (_) => LoginPage());
      case Routes.register:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      default:
        return unDefinedRoute();
    }
  }
}
