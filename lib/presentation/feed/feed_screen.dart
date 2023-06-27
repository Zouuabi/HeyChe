import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:social_media_app/core/user_view_model.dart';

import 'package:social_media_app/presentation/shared.dart';

import '../../data/authentification.dart';

class FeedScreen extends StatefulWidget {
  static const String id = 'FeedScreen';
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  String t = 'nothing';

  void f() async {
    var user = await Auth().getUserDetails();

    setState(() {
      t = user.data().toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserViewModel(),
      builder: (context, child) {
        return Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(t),
              ),
              Center(
                child: StandardButton(
                    label: "print email",
                    onPressed: () {
                      f();
                    }),
              ),
            ],
          ),
        );
        ;
      },
    );
  }
}
