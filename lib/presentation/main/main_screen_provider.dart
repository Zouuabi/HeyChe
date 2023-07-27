import 'package:flutter/material.dart'
    show ChangeNotifier, PageController, Curves;
import 'package:social_media_app/presentation/main/add_post/add_post.dart';
import 'package:social_media_app/presentation/main/home/home_screen.dart';

import 'profile/profile_screen.dart';

class MainScreenProvider with ChangeNotifier {
  int currentIndex = 0;
  final PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  var pages = [
    const HomeSCreen(),
    const ProfileScreen(),
    const AddPostScreen(),
    const ProfileScreen(),
  ];

  int get currentPage => currentIndex;

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
