import 'package:flutter/material.dart';

class Alert {
  static void showAlert(
      BuildContext context,
      String title,
      String message,
      Color backgroundColor,
      ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        Future.delayed(const Duration(seconds: 2), () {
          Navigator.of(context).pop(true); // Close the dialog
        });
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          backgroundColor: backgroundColor,
        );
      },
    );
  }
}
