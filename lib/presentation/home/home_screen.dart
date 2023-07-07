import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:social_media_app/presentation/resources/app_images.dart';

class HomeSCreen extends StatelessWidget {
  const HomeSCreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(
            height: 10,
            width: 10,
            child: SvgPicture.asset(
              AppImages.messages,
            )),
        title: Image.asset(AppImages.logo, height: 50),
        centerTitle: true,
        elevation: 2,
        shadowColor: Colors.grey,
        actions: [
          IconButton(
              onPressed: () {
                // Navigate to search screen
                //todo : implemetn this func bruh
              },
              icon: const Icon(Icons.search))
        ],
      ),
      body: Container(),
    );
  }
}
