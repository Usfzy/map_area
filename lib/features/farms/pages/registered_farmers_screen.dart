import 'package:flutter/material.dart';
import 'package:nirsalfo/core/app_export.dart';
import 'package:nirsalfo/widgets/app_bar/appbar_image.dart';
import 'package:nirsalfo/widgets/app_bar/appbar_title.dart';
import 'package:nirsalfo/widgets/app_bar/custom_app_bar.dart';
import 'package:nirsalfo/widgets/custom_text_form_field.dart';

import '../widgets/farmers_item_widget.dart';

// ignore_for_file: must_be_immutable
class RegisteredFarmersScreen extends StatelessWidget {
  TextEditingController nameController = TextEditingController();

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
                    text: "Registered Farmers", margin: getMargin(left: 8)),
                styleType: Style.bgFillGreenA700),
            body: Form(
                key: _formKey,
                child: Container(
                    width: double.maxFinite,
                    padding:
                        getPadding(left: 24, top: 40, right: 24, bottom: 40),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                              padding: getPadding(right: 2),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text("Registered Farmers",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.txtInterSemiBold28),
                                    Padding(
                                        padding: getPadding(top: 6),
                                        child: Text("237 record of all farmers",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle.txtInterRegular20))
                                  ])),
                          Padding(
                              padding: getPadding(top: 23, right: 2),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text("Search Record",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.txtInterRegular14),
                                    CustomTextFormField(
                                        focusNode: FocusNode(),
                                        autofocus: true,
                                        controller: nameController,
                                        hintText:
                                            "Search by name, location, gender etc",
                                        margin: getMargin(top: 10),
                                        textInputAction: TextInputAction.done)
                                  ])),
                          Expanded(
                              child: Padding(
                                  padding:
                                      getPadding(left: 1, top: 25, right: 2),
                                  child: GridView.builder(
                                      shrinkWrap: true,
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                              mainAxisExtent:
                                                  getVerticalSize(329),
                                              crossAxisCount: 1,
                                              mainAxisSpacing:
                                                  getHorizontalSize(1),
                                              crossAxisSpacing:
                                                  getHorizontalSize(1)),
                                      physics: BouncingScrollPhysics(),
                                      itemCount: 3,
                                      itemBuilder: (context, index) {
                                        return FarmersItemWidget(
                                            onTapColumnprofilepi: () {
                                          onTapColumnprofilepi(context);
                                        });
                                      })))
                        ])))));
  }

  onTapColumnprofilepi(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.farmerProfileScreen);
  }
}
