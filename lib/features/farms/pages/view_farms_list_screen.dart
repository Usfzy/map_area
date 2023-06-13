import 'package:flutter/material.dart';
import 'package:nirsalfo/core/app_export.dart';
import 'package:nirsalfo/widgets/app_bar/appbar_image.dart';
import 'package:nirsalfo/widgets/app_bar/appbar_title.dart';
import 'package:nirsalfo/widgets/app_bar/custom_app_bar.dart';

class ViewFarmsListScreen extends StatelessWidget {
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
                    svgPath: ImageConstant.imgArrowback,
                    margin: getMargin(left: 21, top: 9, bottom: 10)),
                title:
                    AppbarTitle(text: "View Farms", margin: getMargin(left: 8)),
                styleType: Style.bgFillGreenA700),
            body: SizedBox(
                width: size.width,
                child: SingleChildScrollView(
                    padding: getPadding(top: 37),
                    child: Padding(
                        padding: getPadding(left: 20, right: 19, bottom: 5),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                  padding: getPadding(left: 1),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text("View Farms",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle.txtInterSemiBold28),
                                        Padding(
                                            padding: getPadding(top: 9),
                                            child: Text("Ahmed Kunle Obiora",
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style:
                                                    AppStyle.txtInterRegular20))
                                      ])),
                              GestureDetector(
                                  onTap: () {
                                    onTapRowahmedtuberfa(context);
                                  },
                                  child: Container(
                                      margin: getMargin(top: 21),
                                      padding: getPadding(all: 8),
                                      decoration: AppDecoration.fillGreen50
                                          .copyWith(
                                              borderRadius: BorderRadiusStyle
                                                  .roundedBorder4),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                                padding: getPadding(top: 4),
                                                child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Text("Ahmed Tuber Farm",
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: AppStyle
                                                              .txtInterMedium18),
                                                      Padding(
                                                          padding: getPadding(
                                                              top: 6),
                                                          child: Text(
                                                              "2 Hectares Yam Plantation",
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: AppStyle
                                                                  .txtInterRegular12))
                                                    ])),
                                            CustomImageView(
                                                svgPath:
                                                    ImageConstant.imgArrowright,
                                                height: getVerticalSize(44),
                                                width: getHorizontalSize(35),
                                                margin: getMargin(
                                                    top: 1, bottom: 1))
                                          ]))),
                              GestureDetector(
                                  onTap: () {
                                    onTapRowahmedtuberfa1(context);
                                  },
                                  child: Container(
                                      margin: getMargin(top: 6),
                                      padding: getPadding(all: 8),
                                      decoration: AppDecoration.fillGreen50
                                          .copyWith(
                                              borderRadius: BorderRadiusStyle
                                                  .roundedBorder4),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                                padding: getPadding(top: 4),
                                                child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Text("Ahmed Grains",
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: AppStyle
                                                              .txtInterMedium18),
                                                      Padding(
                                                          padding: getPadding(
                                                              top: 6),
                                                          child: Text(
                                                              "2 Hectares Wheat Plantation",
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: AppStyle
                                                                  .txtInterRegular12))
                                                    ])),
                                            CustomImageView(
                                                svgPath:
                                                    ImageConstant.imgArrowright,
                                                height: getVerticalSize(44),
                                                width: getHorizontalSize(35),
                                                margin: getMargin(
                                                    top: 1, bottom: 1))
                                          ])))
                            ]))))));
  }

  onTapRowahmedtuberfa(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.viewSingleFarmScreen);
  }

  onTapRowahmedtuberfa1(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.viewSingleFarmScreen);
  }
}
