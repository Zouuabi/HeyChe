import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:social_media_app/presentation/main/main_screen_provider.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:social_media_app/presentation/shared/providers/user_provider.dart';

import '../../core/utils/images_manager.dart';

class MainScreen extends StatelessWidget {
  static const String id = 'FeedScreen';
  MainScreen({super.key});

  final List<BottomNavigationBarItem> barItems = [
    BottomNavigationBarItem(
      icon: SvgPicture.asset(
        ImagesManager.home,
      ),
      label: '',
    ),
    BottomNavigationBarItem(
        icon: SvgPicture.asset(
      ImagesManager.stories,
    )),
    BottomNavigationBarItem(
        icon: SvgPicture.asset(ImagesManager.notifications)),
    BottomNavigationBarItem(icon: SvgPicture.asset(ImagesManager.search)),
  ];
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MainScreenProvider>(
          create: (context) => MainScreenProvider(),
        ),
        ChangeNotifierProvider<UserProvider>(
          create: (context) => UserProvider(),
        ),
      ],
      builder: (ctx, _) {
        return Consumer<MainScreenProvider>(
          builder: (ctx, mainprovider, _) {
            return Scaffold(
              bottomNavigationBar: Container(
                decoration: const BoxDecoration(boxShadow: [
                  BoxShadow(color: Colors.grey, spreadRadius: 1, blurRadius: 6)
                ]),
                child: CupertinoTabBar(
                  currentIndex: mainprovider.currentIndex,
                  height: 60,
                  onTap: mainprovider.onItemTaped,
                  items: barItems,
                ),
              ),
              body: PageView(
                  controller: mainprovider.pageController,
                  onPageChanged: mainprovider.onPageChanged,
                  children: mainprovider.pages),
            );
          },
        );
      },
    );
  }
}
