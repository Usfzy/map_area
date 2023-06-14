import 'package:flutter/material.dart';
import 'package:nirsalfo/core/app_export.dart';

class AppbarTitle extends StatelessWidget {
  const AppbarTitle({
    required this.text,
    this.margin,
    this.onTap,
  });

  final String text;

  final EdgeInsetsGeometry? margin;

  final Function? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap?.call();
      },
      child: Padding(
        padding: margin ?? EdgeInsets.zero,
        child: Text(
          text,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.left,
          style: AppStyle.txtInterSemiBold18.copyWith(
            color: ColorConstant.whiteA700,
          ),
        ),
      ),
    );
  }
}
