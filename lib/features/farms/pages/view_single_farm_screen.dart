import 'package:flutter/material.dart';
import 'package:nirsalfo/core/app_export.dart';
import 'package:nirsalfo/core/utils/extensions.dart';
import 'package:nirsalfo/widgets/app_bar/appbar_image.dart';
import 'package:nirsalfo/widgets/app_bar/appbar_title.dart';
import 'package:nirsalfo/widgets/app_bar/custom_app_bar.dart';
import 'package:nirsalfo/widgets/custom_button.dart';

class ViewSingleFarmScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.whiteA700,
        appBar: CustomAppBar(
          height: getVerticalSize(
            44,
          ),
          leadingWidth: 45,
          leading: AppbarImage(
            height: getSize(
              24,
            ),
            width: getSize(
              24,
            ),
            svgPath: ImageConstant.imgArrowback,
            margin: getMargin(
              left: 21,
              top: 9,
              bottom: 10,
            ),
          ),
          title: AppbarTitle(
            text: 'Single Farm Detail',
            margin: getMargin(
              left: 8,
            ),
          ),
          styleType: Style.bgFillGreenA700,
        ),
        body: SizedBox(
          width: size.width,
          child: SingleChildScrollView(
            padding: getPadding(
              top: 37,
            ),
            child: Padding(
              padding: getPadding(
                left: 19,
                right: 19,
                bottom: 5,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: getPadding(
                      left: 2,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'View Farm',
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtInterSemiBold28,
                        ),
                        Padding(
                          padding: getPadding(
                            top: 9,
                          ),
                          child: Text(
                            'Ahmed Kunle Obiora',
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtInterRegular20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: double.maxFinite,
                    child: Container(
                      margin: getMargin(
                        top: 17,
                      ),
                      padding: getPadding(
                        left: 16,
                        top: 24,
                        right: 16,
                        bottom: 24,
                      ),
                      decoration: AppDecoration.fillGreen50.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder10,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: getPadding(
                              top: 5,
                            ),
                            child: Text(
                              'Farm Title',
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtInterSemiBold14,
                            ),
                          ),
                          Padding(
                            padding: getPadding(
                              top: 15,
                            ),
                            child: Text(
                              'Ahmed’s Yam Plantation',
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtInterRegular14Black90001,
                            ),
                          ),
                          Padding(
                            padding: getPadding(
                              top: 15,
                            ),
                            child: Text(
                              'Farm Address',
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtInterSemiBold14,
                            ),
                          ),
                          Padding(
                            padding: getPadding(
                              top: 16,
                            ),
                            child: Text(
                              '12 Ezekiel Street Ikeja',
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtInterRegular14Black90001,
                            ),
                          ),
                          Padding(
                            padding: getPadding(
                              top: 13,
                            ),
                            child: Text(
                              'Land Size',
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtInterSemiBold14,
                            ),
                          ),
                          Padding(
                            padding: getPadding(
                              top: 15,
                            ),
                            child: Text(
                              '4 Hectares ',
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtInterRegular14Black90001,
                            ),
                          ),
                          Padding(
                            padding: getPadding(
                              top: 14,
                            ),
                            child: Text(
                              'Cultivated Area Size',
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtInterSemiBold14,
                            ),
                          ),
                          Padding(
                            padding: getPadding(
                              top: 15,
                            ),
                            child: Text(
                              '3.5 Hectares ',
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtInterRegular14Black90001,
                            ),
                          ),
                          Padding(
                            padding: getPadding(
                              top: 6,
                            ),
                            child: Text(
                              'Plantation',
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtInterSemiBold14,
                            ),
                          ),
                          Padding(
                            padding: getPadding(
                              top: 15,
                            ),
                            child: Text(
                              'Yam Tubers',
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtInterRegular14Black90001,
                            ),
                          ),
                          Padding(
                            padding: getPadding(
                              top: 8,
                            ),
                            child: Text(
                              'Land Ownership',
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtInterSemiBold14,
                            ),
                          ),
                          Padding(
                            padding: getPadding(
                              top: 13,
                            ),
                            child: Text(
                              'Lease',
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtInterRegular14Black90001,
                            ),
                          ),
                          Padding(
                            padding: getPadding(
                              top: 8,
                            ),
                            child: Text(
                              'Mapping Data',
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtInterSemiBold14,
                            ),
                          ),
                          Container(
                            width: getHorizontalSize(
                              275,
                            ),
                            margin: getMargin(
                              top: 13,
                              right: 30,
                            ),
                            child: Text(
                              'Point 1: Lat 37.7750° N, Lon 122.4200° W\nPoint 2: Lat 37.7750° N, Lon 122.4180° W\nPoint 3: Lat 37.7735° N, Lon 122.4180° W\nPoint 4: Lat 37.7735° N, Lon 122.4200° W',
                              maxLines: null,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtInterRegular14Black90001,
                            ),
                          ),
                          CustomButton(
                            height: getVerticalSize(
                              44,
                            ),
                            text: 'View Farm Map',
                            margin: getMargin(
                              top: 7,
                            ),
                            variant: ButtonVariant.tertiary,
                            fontStyle: ButtonFontStyle.interRegular14,
                            onTap: () {
                              context.pushNamed(AppRoutes.viewFarmsMapScreen);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  CustomButton(
                    height: getVerticalSize(
                      44,
                    ),
                    text: 'Edit Farm',
                    margin: getMargin(
                      top: 12,
                    ),
                    variant: ButtonVariant.tertiary,
                    fontStyle: ButtonFontStyle.interRegular14,
                  ),
                  CustomButton(
                    height: getVerticalSize(
                      44,
                    ),
                    text: 'Delete Farm',
                    margin: getMargin(
                      top: 12,
                    ),
                    variant: ButtonVariant.fillRed900,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
