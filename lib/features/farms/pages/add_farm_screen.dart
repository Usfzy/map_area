import 'package:flutter/material.dart';
import 'package:nirsalfo/core/app_export.dart';
import 'package:nirsalfo/core/utils/extensions.dart';
import 'package:nirsalfo/widgets/app_bar/appbar_image.dart';
import 'package:nirsalfo/widgets/app_bar/appbar_title.dart';
import 'package:nirsalfo/widgets/app_bar/custom_app_bar.dart';
import 'package:nirsalfo/widgets/custom_button.dart';
import 'package:nirsalfo/widgets/custom_drop_down.dart';
import 'package:nirsalfo/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class AddFarmScreen extends StatelessWidget {
  TextEditingController farmaddressController = TextEditingController();

  TextEditingController farmaddresstwoController = TextEditingController();

  TextEditingController farmaddressController1 = TextEditingController();

  TextEditingController farmaddressController2 = TextEditingController();

  TextEditingController farmaddressController3 = TextEditingController();

  List<String> dropdownItemList = ['Item One', 'Item Two', 'Item Three'];

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
          title: AppbarTitle(text: 'Add Farm', margin: getMargin(left: 8)),
          styleType: Style.bgFillGreenA700,
        ),
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Add Farm',
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
                  ),
                  Padding(
                    padding: getPadding(top: 24),
                    child: Text(
                      'Farm Information',
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtInterSemiBold22,
                    ),
                  ),
                  Padding(
                    padding: getPadding(top: 21),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Farm Title',
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtInterRegular14,
                        ),
                        CustomTextFormField(
                          focusNode: FocusNode(),
                          autofocus: true,
                          controller: farmaddressController,
                          hintText: 'Write here',
                          margin: getMargin(top: 10),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: getPadding(top: 21),
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
                          focusNode: FocusNode(),
                          autofocus: true,
                          controller: farmaddresstwoController,
                          hintText: 'Write here',
                          margin: getMargin(top: 10),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: getPadding(top: 21),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Farm  Size',
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtInterRegular14,
                        ),
                        CustomTextFormField(
                          focusNode: FocusNode(),
                          autofocus: true,
                          controller: farmaddressController1,
                          hintText: 'Write here',
                          margin: getMargin(top: 10),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: getPadding(top: 21),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Cultivated Area Size',
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtInterRegular14,
                        ),
                        CustomTextFormField(
                          focusNode: FocusNode(),
                          autofocus: true,
                          controller: farmaddressController2,
                          hintText: 'Write here',
                          margin: getMargin(top: 10),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: getPadding(top: 21),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Plantation',
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtInterRegular14,
                        ),
                        CustomTextFormField(
                          focusNode: FocusNode(),
                          autofocus: true,
                          controller: farmaddressController3,
                          hintText: 'Write here',
                          margin: getMargin(top: 10),
                          textInputAction: TextInputAction.done,
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: getPadding(top: 22),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Property Ownership Type',
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
                          hintText: 'Select Option',
                          margin: getMargin(top: 9),
                          items: dropdownItemList,
                          onChanged: (value) {},
                        )
                      ],
                    ),
                  ),
                  CustomButton(
                    height: getVerticalSize(44),
                    text: 'Map Farm',
                    margin: getMargin(top: 16),
                    variant: ButtonVariant.tertiary,
                    fontStyle: ButtonFontStyle.interRegular14,
                    onTap: () {
                      onTapMapfarm(context);
                    },
                  ),
                  CustomButton(
                    height: getVerticalSize(44),
                    text: 'Save Farm',
                    margin: getMargin(top: 16),
                    onTap: () {
                      onTapSavefarm(context);
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  onTapMapfarm(BuildContext context) {
    context.pushNamed(AppRoutes.viewFarmsMapScreen);
  }

  onTapSavefarm(BuildContext context) {}
}
