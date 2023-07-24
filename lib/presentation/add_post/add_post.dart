import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media_app/presentation/main/main_screen_provider.dart';

class AddPostScreen extends StatelessWidget {
  const AddPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Post'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 226, 197, 231),
        elevation: 3,
        leading: TextButton(
            child: const Icon(Icons.arrow_back),
            onPressed: () {
              Provider.of<MainScreenProvider>(context, listen: false).goto(0);
            }),
      ),
    );
  }
}
