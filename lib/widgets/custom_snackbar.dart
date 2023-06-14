import 'package:flutter/material.dart';
import 'package:nirsalfo/core/app_export.dart';

showCustomSnackBar(
  BuildContext context,
  String content, {
  bool isError = false,
  Duration duration = const Duration(milliseconds: 3000),
}) {
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(content),
      backgroundColor: isError ? ColorConstant.red900 : ColorConstant.green900,
      behavior: SnackBarBehavior.floating,
      padding: const EdgeInsets.all(16),
    ),
  );
}
