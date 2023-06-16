import 'package:flutter/material.dart';
import './dimensions.dart';

class Layout extends StatelessWidget {
  const Layout(
      {super.key,
      required this.mobileScreenLayout,
      required this.webScreenLayout});
  final Widget mobileScreenLayout;
  final Widget webScreenLayout;

  @override
  Widget build(BuildContext context) {
  
    return LayoutBuilder(builder: (context, constraints) {
      
      if (constraints.maxWidth > webScreenSize) {
        return webScreenLayout;
      } else {
        return mobileScreenLayout;
      }
    });
  }
}
