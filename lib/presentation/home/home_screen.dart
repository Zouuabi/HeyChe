import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/utils/images_manager.dart';
import '../../data/data_source/remote_data_source/firebase_auth.dart';

class HomeSCreen extends StatelessWidget {
  const HomeSCreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          padding: const EdgeInsets.all(10),
          child: SvgPicture.asset(
            ImagesManager.messages,
          ),
        ),
        title: Image.asset(ImagesManager.logo, height: 50),
        centerTitle: true,
        elevation: 2,
        shadowColor: Colors.grey,
        actions: [
          IconButton(
              onPressed: () {
                // Navigate to search screen
                //todo : implemetn this func bruh
              },
              icon: const Icon(
                Icons.search,
                size: 35,
              ))
        ],
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              FirebaseAuthentication().logOut();
            },
            child: const Text("Logout")),
      ),
    );
  }
}
