import 'package:flutter/material.dart';

mixin CommonDialogMixin<T extends StatefulWidget> on State<T> {
  void showSnackBar(String message, {Color? backgroundColor}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: backgroundColor,
      ),
    );
  }

  void showConfirm(String message, {VoidCallback? onConfirmed}) {
    var actionBuilder = (String text, [VoidCallback? onPressed]) {
      return ElevatedButton(
        child: Text(text),
        onPressed: () {
          Navigator.of(context).pop();
          onPressed?.call();
        },
      );
    };

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        content: Text(message),
        actions: [
          actionBuilder('OK', onConfirmed),
          actionBuilder('Cancel'),
        ],
      ),
    );
  }
}
