import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

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
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(boxShadow: [
          BoxShadow(color: Colors.grey, spreadRadius: 1, blurRadius: 6)
        ]),
        child: CupertinoTabBar(
          currentIndex: ,
          height: 60,
          onTap: ,
          items: barItems,
        ),
      ),
      body: PageView.builder(itemBuilder: (ctx,i){
        return Container();

      }),
      // body: PageView(
      //     controller: mainprovider.pageController,
      //     onPageChanged: mainprovider.onPageChanged,
      //     children: mainprovider.pages),
    );
  }
}
