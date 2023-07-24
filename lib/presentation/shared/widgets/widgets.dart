import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:social_media_app/core/utils/color_manager.dart';

// !! this must be changed
notifyUserWithMsg(BuildContext context, String msg) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          icon: const Icon(
            Icons.remove_red_eye_outlined,
            color: Colors.purpleAccent,
          ),
          title: const Text('7ell 3inek ! '),
          content: Text(msg),
          actions: [
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("7adher 3arfi"))
          ],
        );
      });
}


class StandardTextButton extends StatelessWidget {
  const StandardTextButton({
    super.key,
    required this.onPressed,
    required this.label,
  });

  final String label;

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(label),
    );
  }
}

class StandardButton extends StatelessWidget {
  const StandardButton({
    super.key,
    required this.onPressed,
    required this.label,
  });
  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          fixedSize: MaterialStateProperty.all(
              const Size(double.maxFinite * 0.5, 50))),
      onPressed: onPressed,
      child: Text(label),
    );
  }
}

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
                ? const Icon(
                    Icons.person,
                    size: 50,
                    color: Colors.white,
                  )
                : Image.memory(
                    //! selected image appearance must be recoded
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
              color: ColorManager.primary,
            ),
          ),
        )
      ],
    );
  }
}
