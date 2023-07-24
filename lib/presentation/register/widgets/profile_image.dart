import 'dart:typed_data';

import 'package:flutter/material.dart';

import '../../../core/utils/color_manager.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({
    super.key,
    required this.onAdd,
    required this.image,
  });

  final Uint8List? image;
  final VoidCallback onAdd;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: ColorManager.primary),
            width: 90,
            height: 90,
            child: image == null
                ? Icon(
                    Icons.person,
                    size: 50,
                    color: ColorManager.white,
                  )
                : Image.memory(
                    //TODO: selected image appearance must be recoded
                    image!,
                    fit: BoxFit.cover,
                  )),
        Positioned(
          bottom: -10,
          left: 45,
          child: IconButton(
            onPressed: onAdd,
            icon: Icon(
              Icons.add_a_photo,
              color: ColorManager.grey,
            ),
          ),
        )
      ],
    );
  }
}
