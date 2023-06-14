import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nirsalfo/core/app_export.dart';
import 'package:nirsalfo/features/farms/widgets/map_widget.dart';
import 'package:nirsalfo/widgets/app_bar/appbar_image.dart';
import 'package:nirsalfo/widgets/app_bar/appbar_title.dart';
import 'package:nirsalfo/widgets/app_bar/custom_app_bar.dart';
import 'package:nirsalfo/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class ViewFarmsMapScreen extends StatelessWidget {
  final farmAddressoneController = TextEditingController();

  Completer<GoogleMapController> googleMapController = Completer();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.whiteA700,
        resizeToAvoidBottomInset: false,
        appBar: CustomAppBar(
          height: getVerticalSize(44),
          leadingWidth: 45,
          leading: AppbarImage(
            height: getSize(24),
            width: getSize(24),
            svgPath: ImageConstant.imgArrowback,
            margin: getMargin(left: 21, top: 9, bottom: 10),
          ),
          title: AppbarTitle(text: 'View Farms', margin: getMargin(left: 8)),
          styleType: Style.bgFillGreenA700,
        ),
        body: SingleChildScrollView(
          padding: getPadding(top: 37),
          child: Padding(
            padding: getPadding(left: 21, right: 20, bottom: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'View Farms',
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtInterSemiBold28,
                    ),
                    Padding(
                      padding: getPadding(top: 9),
                      child: Text(
                        'Ahmed Kunle Obiora',
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtInterRegular20,
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: getPadding(top: 28),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Farm Address',
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtInterRegular14,
                      ),
                      CustomTextFormField(
                        autofocus: false,
                        controller: farmAddressoneController,
                        hintText: '12 Ezekiel Street, Ikeja',
                        margin: getMargin(top: 10),
                        textInputAction: TextInputAction.done,
                      )
                    ],
                  ),
                ),
                MapWidget(),
                Padding(
                  padding: getPadding(top: 30),
                  child: Text(
                    'Area',
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtInterMedium14,
                  ),
                ),
                Padding(
                  padding: getPadding(top: 11),
                  child: Text(
                    '400m2',
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtInterRegular14Gray900,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
