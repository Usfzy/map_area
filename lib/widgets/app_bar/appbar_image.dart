import 'package:flutter/material.dart';
import 'package:nirsalfo/core/app_export.dart';

class AppbarImage extends StatelessWidget {
  const AppbarImage({
    required this.height,
    required this.width,
    this.imagePath,
    this.svgPath,
    this.margin,
    this.onTap,
  });

  final double height;

  final double width;

  final String? imagePath;

  final String? svgPath;

  final EdgeInsetsGeometry? margin;

  final Function? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap?.call();
        if (onTap == null) Navigator.of(context).pop();
      },
      child: Padding(
        padding: margin ?? EdgeInsets.zero,
        child: CustomImageView(
          svgPath: svgPath,
          imagePath: imagePath,
          height: height,
          width: width,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
