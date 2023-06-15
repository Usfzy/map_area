import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nirsalfo/core/app_export.dart';
import 'package:nirsalfo/features/farms/data/model/register_farmer_model.dart';
import 'package:nirsalfo/features/onboarding/controller/upload_image_controller.dart';
import 'package:nirsalfo/features/onboarding/data/model/verify_model.dart';
import 'package:nirsalfo/widgets/app_bar/appbar_image.dart';
import 'package:nirsalfo/widgets/app_bar/appbar_title.dart';
import 'package:nirsalfo/widgets/app_bar/custom_app_bar.dart';
import 'package:nirsalfo/widgets/custom_button.dart';
import 'package:nirsalfo/widgets/custom_drop_down.dart';
import 'package:nirsalfo/widgets/custom_error_widget.dart';
import 'package:nirsalfo/widgets/custom_progress_indicator.dart';
import 'package:nirsalfo/widgets/custom_text_form_field.dart';

import '../../../../core/utils/utils.dart';
import '../../controller/farmer_registration_controller.dart';
import '../dialog/farmer_biodata_one_dialog.dart';

class FarmerBiodataScreen extends ConsumerStatefulWidget {
  const FarmerBiodataScreen();

  @override
  ConsumerState<FarmerBiodataScreen> createState() => _FarmerBiodataScreenState();
}

class _FarmerBiodataScreenState extends ConsumerState<FarmerBiodataScreen> {
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController emailAddressController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController lgaController = TextEditingController();

  final List<String> dropdownGenders = ['Male', 'Female', 'Other'];
  final List<String> dropdownItemList1 = ['Item One', 'Item Two', 'Item Three'];

  String state = '';

  String gender = '';

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> result = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;

    final VerifyModel verifyModel = result['verify_model'];
    final String idNumber = result['id_number'];
    final String idType = result['id_type'];

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
          title: AppbarTitle(
            text: 'Farmer Onboarding',
            margin: getMargin(left: 8),
          ),
          styleType: Style.bgFillGreenA700,
        ),
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Step 2',
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtInterSemiBold28,
                        ),
                        Padding(
                          padding: getPadding(top: 8),
                          child: Text(
                            'Biodata Recording',
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtInterRegular20,
                          ),
                        )
                      ],
                    ),
                  ),
                  vSpace(),
                  Consumer(
                    builder: (_, WidgetRef ref, __) {
                      final state = ref.watch(uploadImageControllerProvider);

                      return state.when(
                        data: (data) {
                          if (data != null) {
                            showCustomSnackBarAfterFrame(
                              context,
                              data.data == null ? 'Error uploading file' : 'Image uploaded successfully',
                            );
                          }

                          return CustomImageView(
                            url: data.data,
                            height: getVerticalSize(250),
                            width: getHorizontalSize(336),
                            margin: getMargin(top: 19),
                          );
                        },
                        error: (error, stackTrace) => CustomErrorWidget(error: error.toString()),
                        loading: () => CustomProgressIndicator(),
                      );
                    },
                  ),
                  CustomButton(
                    height: getVerticalSize(44),
                    text: 'Take Photo',
                    margin: getMargin(top: 8),
                    onTap: _onTakePhotoTap,
                  ),
                  Padding(
                    padding: getPadding(top: 21),
                    child: Text(
                      'First Name',
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtInterMedium14,
                    ),
                  ),
                  Padding(
                    padding: getPadding(top: 12),
                    child: Text(
                      '${verifyModel.data.firstName} ',
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtInterRegular14Gray900,
                    ),
                  ),
                  Padding(
                    padding: getPadding(top: 15),
                    child: Text(
                      'Last Name',
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtInterMedium14,
                    ),
                  ),
                  Padding(
                    padding: getPadding(top: 12),
                    child: Text(
                      '${verifyModel.data.lastName} ',
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtInterRegular14Gray900,
                    ),
                  ),
                  Padding(
                    padding: getPadding(top: 14),
                    child: Text(
                      'Other Names',
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtInterMedium14,
                    ),
                  ),
                  Padding(
                    padding: getPadding(top: 11),
                    child: Text(
                      verifyModel.data.otherName,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtInterRegular14Gray900,
                    ),
                  ),
                  Padding(
                    padding: getPadding(top: 16),
                    child: Text(
                      'Birthday',
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtInterMedium14,
                    ),
                  ),
                  Padding(
                    padding: getPadding(top: 10),
                    child: Text(
                      verifyModel.data.birthday,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtInterRegular14Gray900,
                    ),
                  ),
                  Padding(
                    padding: getPadding(top: 49),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Primary Phone Number',
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtInterRegular14,
                        ),
                        CustomTextFormField(
                          focusNode: FocusNode(),
                          autofocus: true,
                          controller: phoneNumberController,
                          hintText: 'Write here',
                          margin: getMargin(top: 9),
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
                          'Email Address',
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtInterRegular14,
                        ),
                        CustomTextFormField(
                          focusNode: FocusNode(),
                          autofocus: true,
                          controller: emailAddressController,
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
                          'Gender',
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
                          margin: getMargin(top: 10),
                          items: dropdownGenders,
                          onChanged: (value) {
                            gender = value;
                          },
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
                          'Address',
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtInterRegular14,
                        ),
                        CustomTextFormField(
                          focusNode: FocusNode(),
                          autofocus: true,
                          controller: addressController,
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
                          'State',
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
                          margin: getMargin(top: 10),
                          items: dropdownItemList1,
                          onChanged: (value) {
                            state = value;
                          },
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
                          'LGA',
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtInterRegular14,
                        ),
                        CustomTextFormField(
                          focusNode: FocusNode(),
                          autofocus: true,
                          controller: lgaController,
                          hintText: 'Write here',
                          margin: getMargin(top: 10),
                          textInputAction: TextInputAction.done,
                        )
                      ],
                    ),
                  ),
                  vSpace(16),
                  Consumer(
                    builder: (_, WidgetRef ref, __) {
                      final result = ref.watch(farmerRegistrationControllerProvider);

                      return result.when(
                        data: (data) {
                          if (data != null) {
                            RegisterFarmerModel farmerModel = data;
                            _showFarmerBiodataDialog(context, farmerModel.registerFarmer);
                          }
                          return _saveInformationButton(ref, idType, idNumber);
                        },
                        error: (error, stackTrace) {
                          showCustomSnackBarAfterFrame(context, error.toString(), isError: true);

                          return _saveInformationButton(ref, idType, idNumber);
                        },
                        loading: () => CustomProgressIndicator(),
                      );
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

  Widget _saveInformationButton(WidgetRef ref, String idType, String idNUmber) {
    return CustomButton(
      height: getVerticalSize(44),
      text: 'Save Information',
      onTap: () => _onSaveInformationTap(ref, idType, idNUmber),
    );
  }

  void _onSaveInformationTap(WidgetRef ref, String idType, String idNumber) {
    ref.read(farmerRegistrationControllerProvider.notifier).registerFarmer({
      'photo':
          'https://uatdrive.s3.us-west-002.backblazeb2.com/african-american-agriculturist-holds-corncob-standing-farm-field_255755-8406.avif',
      'id_type': idType,
      'id_number': idNumber,
      'primary_phone_number': phoneNumberController.text.trim(),
      'other_phone_number': phoneNumberController.text.trim(),
      'email': emailAddressController.text.trim(),
      'gender': gender,
      'state_of_origin': state,
      'address': addressController.text.trim(),
      'state': state,
      'lga': lgaController.text,
    });
  }

  void _onTakePhotoTap() async {
    final picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.camera);

    if (image != null) {
      final imageFile = File(image.path);
      ref.read(uploadImageControllerProvider.notifier).uploadFile(imageFile, '');
    }
  }

  void _showFarmerBiodataDialog(BuildContext context, RegisterFarmer farmerModel) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showFarmerBiodataDialog(context, farmerModel);
    });
  }
}
