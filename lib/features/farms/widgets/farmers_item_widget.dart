import 'package:flutter/material.dart';
import 'package:nirsalfo/core/app_export.dart';

// ignore: must_be_immutable
class FarmersItemWidget extends StatelessWidget {
  FarmersItemWidget({this.onTapColumnprofilepi});

  VoidCallback? onTapColumnprofilepi;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapColumnprofilepi?.call();
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgProfilepix269x324,
            height: getVerticalSize(
              269,
            ),
            width: getHorizontalSize(
              324,
            ),
          ),
          Padding(
            padding: getPadding(
              top: 13,
            ),
            child: Text(
              "Ahmed Kunle Obiora",
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: AppStyle.txtInterMedium14,
            ),
          ),
          Padding(
            padding: getPadding(
              top: 12,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Plateau",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtInterRegular14Gray900,
                ),
                Text(
                  "2 Farms",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtInterRegular14Gray900,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
