// DART
import 'package:flutter/material.dart';
import 'package:cashflow/core/colors.dart';

// FUCTIONS NOTIFICY APP
warningMessage(BuildContext context, String text) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        text,
        style: const TextStyle(
          fontSize: 12.5,
          color: lead,
        ),
        textAlign: TextAlign.center,
      ),
      backgroundColor: message,
      shape: const OutlineInputBorder(
        borderSide: BorderSide(color: brmessage),
      ),
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 5),
    ),
  );
}
