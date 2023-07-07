import 'package:flutter/material.dart';
import 'package:social_media_app/presentation/add_post/add_post.dart';
import 'package:social_media_app/presentation/home/home_screen.dart';

import '../profile/profile_screen.dart';

class MainProvider with ChangeNotifier {
  //!! have reset current index and intial to 0
  int currentIndex = 3;
  final PageController pageController = PageController(
    initialPage: 3,
    keepPage: true,
  );

  var pages = [
    const HomeSCreen(),
    Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.green,
    ),
    const AddPostScreen(),
    const ProfileScreen(),
  ];

  void onPageChanged(int value) {
    currentIndex = value;

    pageController.animateToPage(value,
        duration: const Duration(milliseconds: 150), curve: Curves.bounceInOut);
    notifyListeners();
  }

  void onItemTaped(int value) {
    currentIndex = value;

    pageController.jumpToPage(value);
    notifyListeners();
  }

  void goto(int to) {
    onPageChanged(to);
    notifyListeners();
  }
}
