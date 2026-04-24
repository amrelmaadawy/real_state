import 'package:flutter/material.dart';
import 'package:real_state/core/widgets/app_button.dart';

class AppDialogs {
  AppDialogs._(); // Private constructor to prevent instantiation

  static Future<void> showAlertDialog(
    BuildContext context, {
    required String title,
    required String message,
  }) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            AppButton(
              text: 'OK',
              onPressed: () {
                Navigator.of(dialogContext).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
