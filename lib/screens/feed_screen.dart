import 'package:flutter/material.dart';
import 'package:social_media_app/screens/login_screen.dart';
import '../resources/authentification.dart';

class FeedScreen extends StatelessWidget {
  static const String id = 'FeedScreen';
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
          onPressed: () async {
            await Auth().signUserOut();
            Navigator.of(context).pushReplacementNamed(LoginScreen.id);
          },
          child: const Text('Log Out')),
    );
  }
}
