import 'package:flutter/material.dart';
import 'package:nirsalfo/core/app_export.dart';
import 'package:nirsalfo/widgets/app_bar/appbar_image.dart';
import 'package:nirsalfo/widgets/app_bar/appbar_title.dart';
import 'package:nirsalfo/widgets/app_bar/custom_app_bar.dart';
import 'package:nirsalfo/widgets/custom_button.dart';
import 'package:nirsalfo/widgets/custom_drop_down.dart';
import 'package:nirsalfo/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class ViewFarmerBiodataScreen extends StatelessWidget {
  TextEditingController primaryphonenumController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  List<String> dropdownItemList = ["Item One", "Item Two", "Item Three"];

  TextEditingController addressoneController = TextEditingController();

  List<String> dropdownItemList1 = ["Item One", "Item Two", "Item Three"];

  TextEditingController lgaoneController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                    text: "Farmer Biodata", margin: getMargin(left: 8)),
                styleType: Style.bgFillGreenA700),
            body: Form(
                key: _formKey,
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text("View Biodata",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle.txtInterSemiBold28),
                                        Padding(
                                            padding: getPadding(top: 11),
                                            child: Text("Biodata Recording",
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style:
                                                    AppStyle.txtInterRegular20))
                                      ])),
                              CustomImageView(
                                  imagePath: ImageConstant.imgProfilepix250x336,
                                  height: getVerticalSize(250),
                                  width: getHorizontalSize(336),
                                  margin: getMargin(top: 19)),
                              CustomButton(
                                  height: getVerticalSize(44),
                                  text: "Update Photo",
                                  margin: getMargin(top: 8),
                                  variant: ButtonVariant.fillLime800),
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
                                            controller:
                                                primaryphonenumController,
                                            hintText: "07015152515",
                                            margin: getMargin(top: 9),
                                            textInputType: TextInputType.phone)
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
                                            controller: emailController,
                                            hintText: "johndoe@gmail.com",
                                            margin: getMargin(top: 10),
                                            textInputType:
                                                TextInputType.emailAddress)
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
                                            hintText: "Male",
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
                                            controller: addressoneController,
                                            hintText: "12 Ezekiel Street, Jos",
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
                                            hintText: "Plateau",
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
                                            controller: lgaoneController,
                                            hintText: "Jos",
                                            margin: getMargin(top: 10),
                                            textInputAction:
                                                TextInputAction.done)
                                      ])),
                              CustomButton(
                                  height: getVerticalSize(44),
                                  text: "Edit Biodata",
                                  margin: getMargin(top: 16),
                                  variant: ButtonVariant.tertiary,
                                  onTap: () {
                                    onTapEditbiodata(context);
                                  })
                            ]))))));
  }

  onTapEditbiodata(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.farmerProfileScreen);
  }
}
