import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nirsalfo/core/app_export.dart';
import 'package:nirsalfo/core/utils/extensions.dart';
import 'package:nirsalfo/features/onboarding/controller/farmer_biodata_controller.dart';
import 'package:nirsalfo/widgets/app_bar/appbar_image.dart';
import 'package:nirsalfo/widgets/app_bar/appbar_title.dart';
import 'package:nirsalfo/widgets/app_bar/custom_app_bar.dart';
import 'package:nirsalfo/widgets/custom_button.dart';
import 'package:nirsalfo/widgets/custom_drop_down.dart';
import 'package:nirsalfo/widgets/custom_error_widget.dart';
import 'package:nirsalfo/widgets/custom_progress_indicator.dart';
import 'package:nirsalfo/widgets/custom_text_form_field.dart';

import '../../../../core/utils/utils.dart';
import '../../controller/upload_image_controller.dart';

// ignore_for_file: must_be_immutable
class ViewFarmerBiodataScreen extends ConsumerStatefulWidget {
  final String farmerId;

  const ViewFarmerBiodataScreen({required this.farmerId});

  @override
  ConsumerState<ViewFarmerBiodataScreen> createState() => _ViewFarmerBiodataScreenState();
}

class _ViewFarmerBiodataScreenState extends ConsumerState<ViewFarmerBiodataScreen> {
  final primaryphonenumController = TextEditingController();
  final emailController = TextEditingController();
  final lgaoneController = TextEditingController();
  final addressoneController = TextEditingController();

  final List<String> dropdownItemList = ['Item One', 'Item Two', 'Item Three'];
  final List<String> dropdownItemList1 = ['Item One', 'Item Two', 'Item Three'];
  final _formKey = GlobalKey<FormState>();

  String gender = 'Male';

  @override
  void initState() {
    super.initState();

    _loadData(widget.farmerId);
  }

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
          title: AppbarTitle(
            text: 'Farmer Biodata',
            margin: getMargin(left: 8),
          ),
          styleType: Style.bgFillGreenA700,
        ),
        body: Consumer(
          builder: (_, WidgetRef ref, __) {
            final state = ref.watch(farmerBiodataControllerProvider);

            return state.when(
              data: (biodataModel) {
                if (biodataModel == null) return SizedBox.shrink();

                return Form(
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
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'View Biodata',
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtInterSemiBold28,
                                ),
                                Padding(
                                  padding: getPadding(top: 11),
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
                          Consumer(
                            builder: (_, WidgetRef ref, __) {
                              final state = ref.watch(uploadImageControllerProvider);
                              return state.when(
                                data: (data) {
                                  String imageUri = biodataModel?.data.photo;
                                  if (data != null) {
                                    imageUri = data.data;

                                    showCustomSnackBarAfterFrame(
                                      context,
                                      data.data == null ? 'Error uploading file' : 'Image updated successfully',
                                    );
                                  }

                                  return CustomImageView(
                                    url: imageUri,
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
                            text: 'Update Photo',
                            margin: getMargin(top: 8),
                            variant: ButtonVariant.fillLime800,
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
                              '${biodataModel?.data.firstName}',
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
                              '${biodataModel?.data.lastName}',
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
                              '${biodataModel?.data.otherName}',
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
                              '${biodataModel?.data.birthday}',
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
                                  controller: primaryphonenumController
                                    ..text = biodataModel?.data.primaryPhoneNumber ?? '',
                                  hintText: '07015152515',
                                  margin: getMargin(top: 9),
                                  textInputType: TextInputType.phone,
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
                                  controller: emailController..text = biodataModel?.data.email ?? '',
                                  hintText: 'johndoe@gmail.com',
                                  margin: getMargin(top: 10),
                                  textInputType: TextInputType.emailAddress,
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
                                  hintText: 'Male',
                                  margin: getMargin(top: 10),
                                  items: dropdownItemList,
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
                                  controller: addressoneController..text = biodataModel?.data.address ?? '',
                                  hintText: '12 Ezekiel Street, Jos',
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
                                  hintText: 'Plateau',
                                  margin: getMargin(top: 10),
                                  items: dropdownItemList1,
                                  onChanged: (value) {},
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
                                  controller: lgaoneController..text = biodataModel?.data.lga ?? '',
                                  hintText: 'Jos',
                                  margin: getMargin(top: 10),
                                  textInputAction: TextInputAction.done,
                                )
                              ],
                            ),
                          ),
                          CustomButton(
                            height: getVerticalSize(44),
                            text: 'Edit Biodata',
                            margin: getMargin(top: 16),
                            variant: ButtonVariant.tertiary,
                            onTap: () {
                              onTapEditbiodata(context, biodataModel?.data.id ?? '');
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
              error: (error, stackTrace) => CustomErrorWidget(error: error.toString()),
              loading: () => CustomProgressIndicator(),
            );
          },
        ),
      ),
    );
  }

  void _loadData(String farmerId) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(farmerBiodataControllerProvider.notifier).getFarmerBiodata(farmerId);
    });
  }

  onTapEditbiodata(BuildContext context, String farmerId) {
    if (farmerId.isEmpty) return;

    context.pushNamed(AppRoutes.farmerProfileScreen, arguments: farmerId);
  }
}
