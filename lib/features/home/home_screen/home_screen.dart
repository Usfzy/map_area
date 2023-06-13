import 'package:flutter/material.dart';
import 'package:nirsalfo/core/app_export.dart';
import 'package:nirsalfo/core/utils/extensions.dart';
import 'package:nirsalfo/widgets/app_bar/appbar_image.dart';
import 'package:nirsalfo/widgets/app_bar/appbar_title.dart';
import 'package:nirsalfo/widgets/app_bar/custom_app_bar.dart';
import 'package:nirsalfo/widgets/custom_button.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.whiteA700,
            appBar: CustomAppBar(
              height: getVerticalSize(44),
              leadingWidth: 45,
              leading: AppbarImage(
                height: getSize(24),
                width: getSize(24),
                svgPath: ImageConstant.imgMenu,
                margin: getMargin(left: 21, top: 9, bottom: 10),
                onTap: (){},
              ),
              title: AppbarTitle(text: "Home", margin: getMargin(left: 8)),
              styleType: Style.bgFillGreenA700,
            ),
            body: SizedBox(
                width: size.width,
                child: SingleChildScrollView(
                    padding: getPadding(top: 40),
                    child: Padding(
                        padding: getPadding(left: 21, right: 17, bottom: 5),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                  padding: getPadding(left: 3, right: 3),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text("Welcome, Albert",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle.txtInterSemiBold28),
                                        Padding(
                                            padding: getPadding(top: 6),
                                            child: Text(
                                                "Nirsal Field Officer Portal",
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style:
                                                    AppStyle.txtInterRegular20))
                                      ])),
                              Padding(
                                  padding: getPadding(top: 69),
                                  child: Text("What will you like to do?",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtInterSemiBold22)),
                              Padding(
                                  padding: getPadding(top: 23, right: 5),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                            child: GestureDetector(
                                                onTap: () {
                                                  onTapColumnvector(context);
                                                },
                                                child: Container(
                                                    margin:
                                                        getMargin(right: 12),
                                                    padding: getPadding(
                                                        left: 31,
                                                        top: 33,
                                                        right: 31,
                                                        bottom: 33),
                                                    decoration: AppDecoration
                                                        .fillGreen200
                                                        .copyWith(
                                                            borderRadius:
                                                                BorderRadiusStyle
                                                                    .roundedBorder4),
                                                    child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          CustomImageView(
                                                              svgPath:
                                                                  ImageConstant
                                                                      .imgVector,
                                                              height:
                                                                  getSize(36),
                                                              width:
                                                                  getSize(36),
                                                              margin: getMargin(
                                                                  top: 8)),
                                                          Padding(
                                                              padding:
                                                                  getPadding(
                                                                      top: 11),
                                                              child: Text(
                                                                  "View Farmers",
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style: AppStyle
                                                                      .txtInterRegular14))
                                                        ])))),
                                        Expanded(
                                            child: GestureDetector(
                                                onTap: () {
                                                  onTapColumnuser(context);
                                                },
                                                child: Container(
                                                    margin: getMargin(left: 12),
                                                    padding: getPadding(
                                                        left: 24,
                                                        top: 32,
                                                        right: 24,
                                                        bottom: 32),
                                                    decoration: AppDecoration
                                                        .fillLime100,
                                                    child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          CustomImageView(
                                                              svgPath:
                                                                  ImageConstant
                                                                      .imgUser,
                                                              height:
                                                                  getVerticalSize(
                                                                      36),
                                                              width:
                                                                  getHorizontalSize(
                                                                      49),
                                                              margin: getMargin(
                                                                  top: 9)),
                                                          Padding(
                                                              padding:
                                                                  getPadding(
                                                                      top: 12),
                                                              child: Text(
                                                                  "Register Farmer",
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style: AppStyle
                                                                      .txtInterRegular14))
                                                        ]))))
                                      ])),
                              Padding(
                                  padding: getPadding(left: 4, top: 56),
                                  child: Text("Summary",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtInterSemiBold25)),
                              Padding(
                                  padding:
                                      getPadding(left: 4, top: 24, right: 7),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomImageView(
                                            svgPath:
                                                ImageConstant.imgCropcategory,
                                            height: getSize(178),
                                            width: getSize(178)),
                                        Padding(
                                            padding:
                                                getPadding(top: 48, bottom: 45),
                                            child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Container(
                                                            height: getSize(22),
                                                            width: getSize(22),
                                                            margin: getMargin(
                                                                top: 4,
                                                                bottom: 7),
                                                            decoration: BoxDecoration(
                                                                color: ColorConstant
                                                                    .amber100)),
                                                        Container(
                                                            width:
                                                                getHorizontalSize(
                                                                    90),
                                                            margin: getMargin(
                                                                left: 14),
                                                            child: Text(
                                                                "Female Farmers \nRegistered",
                                                                maxLines: null,
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
                                                                style: AppStyle
                                                                    .txtInterRegular12))
                                                      ]),
                                                  Padding(
                                                      padding:
                                                          getPadding(top: 14),
                                                      child: Row(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Container(
                                                                height:
                                                                    getSize(22),
                                                                width:
                                                                    getSize(22),
                                                                margin:
                                                                    getMargin(
                                                                        top: 4,
                                                                        bottom:
                                                                            7),
                                                                decoration: BoxDecoration(
                                                                    color: ColorConstant
                                                                        .green900)),
                                                            Container(
                                                                width:
                                                                    getHorizontalSize(
                                                                        77),
                                                                margin:
                                                                    getMargin(
                                                                        left:
                                                                            14),
                                                                child: Text(
                                                                    "Male Farmers \nRegistered",
                                                                    maxLines:
                                                                        null,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .left,
                                                                    style: AppStyle
                                                                        .txtInterRegular12))
                                                          ]))
                                                ]))
                                      ])),
                              SizedBox(
                                  width: double.maxFinite,
                                  child: Container(
                                      margin: getMargin(left: 4, top: 24),
                                      padding: getPadding(
                                          left: 89,
                                          top: 41,
                                          right: 89,
                                          bottom: 41),
                                      decoration: AppDecoration.primary,
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text("20",
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle
                                                    .txtInterSemiBold36),
                                            Padding(
                                                padding: getPadding(top: 18),
                                                child: Text("Farms Recorded",
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    style: AppStyle
                                                        .txtInterRegular20WhiteA700))
                                          ]))),
                              CustomButton(
                                  height: getVerticalSize(44),
                                  text: "Change Password",
                                  margin: getMargin(left: 4, top: 96),
                                  variant: ButtonVariant.tertiary,
                                  fontStyle: ButtonFontStyle.interRegular14),
                              CustomButton(
                                  height: getVerticalSize(44),
                                  text: "Logout",
                                  margin: getMargin(left: 4, top: 16),
                                  variant: ButtonVariant.fillRed900,
                                  fontStyle: ButtonFontStyle.interBold14)
                            ]))))));
  }

  onTapColumnvector(BuildContext context) {
    context.pushNamed(AppRoutes.registeredFarmersScreen);
  }

  onTapColumnuser(BuildContext context) {
    context.pushNamed(AppRoutes.farmerVerificationScreen);
  }
}
