import 'package:flutter/material.dart';
import 'package:nirsalfo/core/app_export.dart';
import 'package:nirsalfo/widgets/app_bar/appbar_image.dart';
import 'package:nirsalfo/widgets/app_bar/appbar_title.dart';
import 'package:nirsalfo/widgets/app_bar/custom_app_bar.dart';
import 'package:nirsalfo/widgets/custom_button.dart';
import 'package:nirsalfo/widgets/custom_drop_down.dart';
import 'package:nirsalfo/widgets/custom_text_form_field.dart';

import '../dialog/farmer_biodata_one_dialog.dart';

Future<void> shoFarmerBiodataScreen(BuildContext context) {
  return showDialog(
      context: context,
      builder: (_) => AlertDialog(
        content: FarmerBiodataScreen(),
        backgroundColor: Colors.transparent,
        contentPadding: EdgeInsets.zero,
        insetPadding: EdgeInsets.only(left: 0),
      ));
}

// ignore_for_file: must_be_immutable
class FarmerBiodataScreen extends StatelessWidget {
  TextEditingController addressController = TextEditingController();

  TextEditingController addressoneController = TextEditingController();

  List<String> dropdownItemList = ["Item One", "Item Two", "Item Three"];

  TextEditingController addressthreeController = TextEditingController();

  List<String> dropdownItemList1 = ["Item One", "Item Two", "Item Three"];

  TextEditingController addressfourController = TextEditingController();

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
                    margin: getMargin(left: 21, top: 9, bottom: 10)),
                title: AppbarTitle(
                    text: "Farmer Onboarding", margin: getMargin(left: 8)),
                styleType: Style.bgFillGreenA700),
            body: SizedBox(
                width: size.width,
                child: SingleChildScrollView(
                    padding: getPadding(top: 40),
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
                                        Text("Step 2",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle.txtInterSemiBold28),
                                        Padding(
                                            padding: getPadding(top: 8),
                                            child: Text("Biodata Recording",
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style:
                                                    AppStyle.txtInterRegular20))
                                      ])),
                              CustomImageView(
                                  imagePath: ImageConstant.imgProfilepix,
                                  height: getVerticalSize(250),
                                  width: getHorizontalSize(336),
                                  margin: getMargin(top: 19)),
                              CustomButton(
                                  height: getVerticalSize(44),
                                  text: "Take Photo",
                                  margin: getMargin(top: 8)),
                              Padding(
                                  padding: getPadding(top: 21),
                                  child: Text("First Name",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtInterMedium14)),
                              Padding(
                                  padding: getPadding(top: 12),
                                  child: Text("Ahmed ",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style:
                                          AppStyle.txtInterRegular14Gray900)),
                              Padding(
                                  padding: getPadding(top: 15),
                                  child: Text("Last Name",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtInterMedium14)),
                              Padding(
                                  padding: getPadding(top: 12),
                                  child: Text("Kunle ",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style:
                                          AppStyle.txtInterRegular14Gray900)),
                              Padding(
                                  padding: getPadding(top: 14),
                                  child: Text("Other Names",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtInterMedium14)),
                              Padding(
                                  padding: getPadding(top: 11),
                                  child: Text("Obiora",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style:
                                          AppStyle.txtInterRegular14Gray900)),
                              Padding(
                                  padding: getPadding(top: 16),
                                  child: Text("Birthday",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtInterMedium14)),
                              Padding(
                                  padding: getPadding(top: 10),
                                  child: Text("22-01-1976",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style:
                                          AppStyle.txtInterRegular14Gray900)),
                              Padding(
                                  padding: getPadding(top: 49),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text("Primary Phone Number",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle.txtInterRegular14),
                                        CustomTextFormField(
                                            focusNode: FocusNode(),
                                            autofocus: true,
                                            controller: addressController,
                                            hintText: "Write here",
                                            margin: getMargin(top: 9))
                                      ])),
                              Padding(
                                  padding: getPadding(top: 21),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text("Email Address",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle.txtInterRegular14),
                                        CustomTextFormField(
                                            focusNode: FocusNode(),
                                            autofocus: true,
                                            controller: addressoneController,
                                            hintText: "Write here",
                                            margin: getMargin(top: 10))
                                      ])),
                              Padding(
                                  padding: getPadding(top: 21),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text("Gender",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle.txtInterRegular14),
                                        CustomDropDown(
                                            focusNode: FocusNode(),
                                            autofocus: true,
                                            icon: Container(
                                                margin: getMargin(
                                                    left: 30, right: 12),
                                                child: CustomImageView(
                                                    svgPath: ImageConstant
                                                        .imgArrowdown)),
                                            hintText: "Select Option",
                                            margin: getMargin(top: 10),
                                            items: dropdownItemList,
                                            onChanged: (value) {})
                                      ])),
                              Padding(
                                  padding: getPadding(top: 21),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text("Address",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle.txtInterRegular14),
                                        CustomTextFormField(
                                            focusNode: FocusNode(),
                                            autofocus: true,
                                            controller: addressthreeController,
                                            hintText: "Write here",
                                            margin: getMargin(top: 10))
                                      ])),
                              Padding(
                                  padding: getPadding(top: 21),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text("State",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle.txtInterRegular14),
                                        CustomDropDown(
                                            focusNode: FocusNode(),
                                            autofocus: true,
                                            icon: Container(
                                                margin: getMargin(
                                                    left: 30, right: 12),
                                                child: CustomImageView(
                                                    svgPath: ImageConstant
                                                        .imgArrowdown)),
                                            hintText: "Select Option",
                                            margin: getMargin(top: 10),
                                            items: dropdownItemList1,
                                            onChanged: (value) {})
                                      ])),
                              Padding(
                                  padding: getPadding(top: 21),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text("LGA",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle.txtInterRegular14),
                                        CustomTextFormField(
                                            focusNode: FocusNode(),
                                            autofocus: true,
                                            controller: addressfourController,
                                            hintText: "Write here",
                                            margin: getMargin(top: 10),
                                            textInputAction:
                                                TextInputAction.done)
                                      ])),
                              CustomButton(
                                  height: getVerticalSize(44),
                                  text: "Save Information",
                                  margin: getMargin(top: 16),
                                  onTap: () {
                                    showFarmerBiodataOneDialog(context);
                                  })
                            ]))))));
  }
}
