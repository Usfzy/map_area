import 'dart:convert';

import 'package:flutter/material.dart';

import '../../widgets/custom_snackbar.dart';

Widget vSpace([double height = 8]) => SizedBox(height: height);
Widget hSpace([double width = 8]) => SizedBox(height: width);

void showCustomSnackBarAfterFrame(BuildContext context, String content, {bool isError = false}) {
  WidgetsBinding.instance.addPostFrameCallback(
    (_) {
      showCustomSnackBar(context, content, isError: isError);
    },
  );
}

String parseError(e) {
  try {
    final json = jsonDecode(e.message.toString());
    String? message = json['message'];

    if (message == null || message.isEmpty) message = 'Error getting data';

    return message;
  } catch (e) {
    return 'Server Failure';
  }
}
