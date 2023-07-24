// ignore_for_file: sort_child_properties_last, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../shared/providers/user_provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List <Widget>dummyposts = [for (int i = 0; i < 1000; i++) Container(color: Colors.blueGrey,height: 100,width: 100,)];

    
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            right: 0,
            left: 0,
            bottom: size.height * 0.4,
            child: SizedBox(
                child: Image.asset(
              'assets/man3oucha.jpg',
              fit: BoxFit.contain,
            )),
          ),
          Positioned(
              top: size.height * 0.3,
              left: size.width * 0.05,
              right: size.width * 0.05,
              child: ProfileBanner(size: size)),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: size.height * 0.55,
            child: Container(
              padding: const EdgeInsets.only(top: 30, right: 10, left: 20),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'sdfsdfsdf',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        letterSpacing: 2),
                  ),
                  Text(
                    'Graphic designer @something',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, letterSpacing: 2),
                  ),
                  Text(
                      'sdfdf sdf sdfk sd kksd dsfd sdf sdfjdjfd sfll jkd sddfds fsdf sddf sdf ',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                      )),
                  SizedBox(
                    width: size.width,
                    height: 300,
                    child: GridView(
                      children: dummyposts,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                        crossAxisCount: 3,
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ProfileBanner extends StatelessWidget {
  const ProfileBanner({
    super.key,
    required this.size,
  });

  final Size size;
  static const textStyle = TextStyle(
      color: Color.fromARGB(255, 255, 255, 255),
      fontSize: 20,
      fontWeight: FontWeight.bold);
  static const textStyle2 = TextStyle(
      color: Color.fromARGB(255, 215, 208, 208),
      fontSize: 15,
      fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const Expanded(
          flex: 4,
          child: SizedBox(
            height: 50,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      '135',
                      style: textStyle,
                    ),
                    Text(
                      '5.321k',
                      style: textStyle,
                    ),
                    Text(
                      '99',
                      style: textStyle,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'posts',
                      style: textStyle2,
                    ),
                    Text(
                      'followers',
                      style: textStyle2,
                    ),
                    Text(
                      'following',
                      style: textStyle2,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            margin: EdgeInsets.only(
              left: size.width * 0.05,
            ),
            height: 50,
            child:
                ElevatedButton(onPressed: () {}, child: const Text('Follow')),
          ),
        ),
      ],
    );
  }
}
