import 'package:flutter/material.dart';
import 'package:nirsalfo/core/app_export.dart';
import 'package:nirsalfo/widgets/app_bar/appbar_image.dart';
import 'package:nirsalfo/widgets/app_bar/appbar_title.dart';
import 'package:nirsalfo/widgets/app_bar/custom_app_bar.dart';
import 'package:nirsalfo/widgets/custom_button.dart';
import 'package:nirsalfo/widgets/custom_drop_down.dart';
import 'package:nirsalfo/widgets/custom_text_form_field.dart';

import '../dialog/farmer_verification_one_dialog.dart';

class FarmerVerificationScreen extends StatelessWidget {
  final List<String> dropdownItemList = [
    "Item One",
    "Item Two",
    "Item Three",
  ];

  final idnumberplacehoController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.whiteA700,
        resizeToAvoidBottomInset: false,
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
            text: "Farmer Onboarding",
            margin: getMargin(
              left: 8,
            ),
          ),
          styleType: Style.bgFillGreenA700,
        ),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: getPadding(
              top: 40,
            ),
            child: Padding(
              padding: getPadding(
                left: 20,
                right: 19,
                bottom: 5,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: getPadding(
                      left: 1,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Step 1",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtInterSemiBold28,
                        ),
                        Padding(
                          padding: getPadding(
                            top: 8,
                          ),
                          child: Text(
                            "Identity Verification",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtInterRegular20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      top: 58,
                    ),
                    child: Text(
                      "Verify farmer identity to proceed",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtInterMedium20,
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      top: 26,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Select Identity Type *",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtInterRegular14,
                        ),
                        CustomDropDown(
                          focusNode: FocusNode(),
                          autofocus: true,
                          icon: Container(
                            margin: getMargin(
                              left: 30,
                              right: 12,
                            ),
                            child: CustomImageView(
                              svgPath: ImageConstant.imgArrowdown,
                            ),
                          ),
                          hintText: "BVN",
                          margin: getMargin(
                            top: 9,
                          ),
                          items: dropdownItemList,
                          onChanged: (value) {},
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      top: 25,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Enter Farmer’s ID Number *",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtInterRegular14,
                        ),
                        CustomTextFormField(
                          focusNode: FocusNode(),
                          autofocus: true,
                          controller: idnumberplacehoController,
                          hintText: "ID Number",
                          margin: getMargin(
                            top: 10,
                          ),
                          textInputAction: TextInputAction.done,
                          textInputType: TextInputType.number,
                        ),
                      ],
                    ),
                  ),
                  CustomButton(
                    height: getVerticalSize(
                      44,
                    ),
                    text: "Verify Identity",
                    margin: getMargin(
                      top: 20,
                    ),
                    onTap: () {
                      showFarmerVerificationOneDialog(context);
                    },
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
