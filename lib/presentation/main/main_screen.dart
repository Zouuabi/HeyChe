import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  static const String id = 'FeedScreen';
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;
  final PageController pageController =
      PageController(initialPage: 0, keepPage: true);
  List<BottomNavigationBarItem> barItems = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.home_sharp),
      label: '',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.search),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.notifications_none_sharp),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
    ),
  ];
  var pages = [
    Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.red,
    ),
    Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.green,
    ),
    Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.blue,
    ),
    Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.white,
    ),
  ];
  void onPageChanged(int value) {
    setState(() {
      currentIndex = value;
    });
    pageController.animateToPage(value,
        duration: const Duration(milliseconds: 250), curve: Curves.bounceInOut);
  }

  void onItemTaped(int value) {
    setState(() {
      currentIndex = value;
    });
    pageController.jumpToPage(value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Align(
        alignment: Alignment.bottomCenter,
        child: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.camera_alt_outlined),
        ),
      ),
      bottomNavigationBar: CupertinoTabBar(
        activeColor: Colors.blueAccent,
        inactiveColor: Colors.grey.shade500,
        currentIndex: currentIndex,
        height: 60,
        onTap: onItemTaped,
        items: barItems,
      ),
      body: PageView(
          controller: pageController,
          onPageChanged: onPageChanged,
          children: pages),
    );
  }
}
