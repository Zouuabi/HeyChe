import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' show ElevatedButton;

import '../../../core/utils/color_manager.dart';
import '../../../core/utils/styles_manager.dart';
import '../../../core/utils/values_manager.dart';

class ErrorAlert extends StatelessWidget {
  const ErrorAlert({
    super.key,
    required this.message,
  });
  final String message;
  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(
        'Eroor! ',
        style: getSemiBoldStyle(
            color: ColorManager.primary, fontSize: AppSize.s20),
      ),
      content: Text(
        message,
        style: getRegularStyle(color: ColorManager.darkGrey),
      ),
      actions: [
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              "Try Again",
              style: getRegularStyle(color: ColorManager.primary),
            ))
      ],
    );
  }
}
