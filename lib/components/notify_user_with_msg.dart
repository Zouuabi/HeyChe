import 'package:flutter/material.dart';

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
