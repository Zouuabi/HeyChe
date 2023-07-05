
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 200,
          width: 200,
          color : Colors.blue,
        ),
        Container(
          height: 200,
          width: 200,
          color : const Color.fromARGB(255, 243, 110, 33),
        )
      ],
    );
  }
}
