import 'package:flutter/material.dart';
import 'package:nirsalfo/core/app_export.dart';

class AppDecoration {
  static BoxDecoration get fillLime300 => BoxDecoration(
        color: ColorConstant.lime300,
      );
  static BoxDecoration get fillGreen200 => BoxDecoration(
        color: ColorConstant.green200,
      );
  static BoxDecoration get fillLime100 => BoxDecoration(
        color: ColorConstant.lime100,
      );
  static BoxDecoration get white => BoxDecoration(
        color: ColorConstant.whiteA700,
      );
  static BoxDecoration get primary => BoxDecoration(
        color: ColorConstant.greenA700,
      );
  static BoxDecoration get fillGreen50 => BoxDecoration(
        color: ColorConstant.green50,
      );
}

class BorderRadiusStyle {
  static BorderRadius roundedBorder4 = BorderRadius.circular(
    getHorizontalSize(
      4,
    ),
  );

  static BorderRadius roundedBorder10 = BorderRadius.circular(
    getHorizontalSize(
      10,
    ),
  );
}

// Comment/Uncomment the below code based on your Flutter SDK version.

// For Flutter SDK Version 3.7.2 or greater.

double get strokeAlignInside => BorderSide.strokeAlignInside;

double get strokeAlignCenter => BorderSide.strokeAlignCenter;

double get strokeAlignOutside => BorderSide.strokeAlignOutside;

// For Flutter SDK Version 3.7.1 or less.

// StrokeAlign get strokeAlignInside => StrokeAlign.inside;
//
// StrokeAlign get strokeAlignCenter => StrokeAlign.center;
//
// StrokeAlign get strokeAlignOutside => StrokeAlign.outside;
