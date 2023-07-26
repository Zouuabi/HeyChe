import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' show ElevatedButton;

import '../../../core/utils/color_manager.dart';
import '../../../core/utils/styles_manager.dart';
import '../../../core/utils/values_manager.dart';

class MyAlert extends StatelessWidget {
  const MyAlert({
    super.key,
    required this.message,
    required this.title,
    required this.actionText,
    this.action,
  });
  final String message;
  final String title;
  final String actionText;
  final VoidCallback? action;
  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(
        title,
        style: getSemiBoldStyle(
            color: ColorManager.primary, fontSize: AppSize.s20),
      ),
      content: Text(
        message,
        style: getRegularStyle(color: ColorManager.darkGrey),
      ),
      actions: [
        ElevatedButton(
            onPressed: action ??
                () {
                  Navigator.of(context).pop();
                },
            child: Text(
              actionText,
              style: getRegularStyle(color: ColorManager.primary),
            ))
      ],
    );
  }
}
