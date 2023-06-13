import 'package:flutter/material.dart';
import 'package:nirsalfo/core/app_export.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.greenA700,
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: getPadding(
                    top: 316,
                  ),
                  child: CustomImageView(
                    imagePath: ImageConstant.imgLogo,
                    height: getVerticalSize(
                      766,
                    ),
                    width: getHorizontalSize(
                      375,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
