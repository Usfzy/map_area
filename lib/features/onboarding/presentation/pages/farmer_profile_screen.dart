import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nirsalfo/core/app_export.dart';
import 'package:nirsalfo/core/utils/extensions.dart';
import 'package:nirsalfo/features/onboarding/controller/farmer_biodata_controller.dart';
import 'package:nirsalfo/widgets/app_bar/appbar_image.dart';
import 'package:nirsalfo/widgets/app_bar/appbar_title.dart';
import 'package:nirsalfo/widgets/app_bar/custom_app_bar.dart';
import 'package:nirsalfo/widgets/custom_error_widget.dart';
import 'package:nirsalfo/widgets/custom_progress_indicator.dart';

import '../../data/model/biodata_model.dart';

class FarmerProfileScreen extends ConsumerStatefulWidget {
  final String farmerId;

  const FarmerProfileScreen({required this.farmerId});

  @override
  ConsumerState<FarmerProfileScreen> createState() => _FarmerProfileScreenState();
}

class _FarmerProfileScreenState extends ConsumerState<FarmerProfileScreen> {
  @override
  void initState() {
    super.initState();

    _loadProfileData(context);
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(farmerBiodataControllerProvider);

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
            margin: getMargin(left: 21, top: 9, bottom: 10),
          ),
          title: AppbarTitle(
            text: 'Farmer Onboarding',
            margin: getMargin(left: 8),
          ),
          styleType: Style.bgFillGreenA700,
        ),
        body: state.when(
          data: (biodataModel) {
            if (biodataModel == null) return SizedBox.shrink();

            return SizedBox(
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
                              'Farmer’s Profile',
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtInterSemiBold28,
                            ),
                            Padding(
                              padding: getPadding(top: 11),
                              child: Text(
                                'Identity Verification',
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtInterRegular20,
                              ),
                            )
                          ],
                        ),
                      ),
                      CustomImageView(
                        url: biodataModel.data.photo,
                        height: getVerticalSize(250),
                        width: getHorizontalSize(336),
                        margin: getMargin(top: 20),
                      ),
                      Padding(
                        padding: getPadding(top: 21),
                        child: Text(
                          'Full Name',
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtInterMedium14,
                        ),
                      ),
                      Padding(
                        padding: getPadding(top: 11),
                        child: Text(
                          '${biodataModel.data.firstName} ${biodataModel.data.lastName} ${biodataModel.data.otherName}',
                          // 'Ahmad Abiola Amaka',
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtInterRegular14Gray900,
                        ),
                      ),
                      Padding(
                        padding: getPadding(left: 2, top: 30),
                        child: Text(
                          'Summary',
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtInterSemiBold22,
                        ),
                      ),
                      Padding(
                        padding: getPadding(left: 2, top: 26, right: 35),
                        child: Row(
                          children: [
                            CustomImageView(
                              svgPath: ImageConstant.imgCropcategory,
                              height: getSize(178),
                              width: getSize(178),
                            ),
                            Padding(
                              padding: getPadding(
                                left: 21,
                                top: 48,
                                bottom: 48,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: getSize(22),
                                        width: getSize(22),
                                        margin: getMargin(
                                          top: 4,
                                          bottom: 7,
                                        ),
                                        decoration: BoxDecoration(
                                          color: ColorConstant.amber100,
                                        ),
                                      ),
                                      Container(
                                        width: getHorizontalSize(
                                          63,
                                        ),
                                        margin: getMargin(left: 14),
                                        child: Text(
                                          'Tubers and Root Crops',
                                          maxLines: null,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtInterRegular12,
                                        ),
                                      )
                                    ],
                                  ),
                                  Padding(
                                    padding: getPadding(top: 14),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: getSize(22),
                                          width: getSize(22),
                                          margin: getMargin(
                                            top: 5,
                                            bottom: 5,
                                          ),
                                          decoration: BoxDecoration(
                                            color: ColorConstant.green900,
                                          ),
                                        ),
                                        Container(
                                          width: getHorizontalSize(
                                            60,
                                          ),
                                          margin: getMargin(
                                            left: 14,
                                          ),
                                          child: Text(
                                            'Grains and Cereals',
                                            maxLines: null,
                                            textAlign: TextAlign.left,
                                            style: AppStyle.txtInterRegular12,
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: double.maxFinite,
                        child: Container(
                          margin: getMargin(left: 2, top: 24),
                          padding: getPadding(
                            left: 88,
                            top: 41,
                            right: 88,
                            bottom: 41,
                          ),
                          decoration: AppDecoration.primary,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                '2',
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtInterSemiBold36,
                              ),
                              Padding(
                                padding: getPadding(top: 18),
                                child: Text(
                                  'Farms Recorded',
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtInterRegular20WhiteA700,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: getPadding(top: 26),
                        child: Text(
                          'Perform Actions',
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtInterSemiBold22,
                        ),
                      ),
                      SizedBox(
                        width: double.maxFinite,
                        child: GestureDetector(
                          onTap: () {
                            onTapAddfarm(context);
                          },
                          child: Container(
                            margin: getMargin(top: 33),
                            padding: getPadding(
                              left: 121,
                              top: 32,
                              right: 121,
                              bottom: 32,
                            ),
                            decoration: AppDecoration.fillLime300,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CustomImageView(
                                  svgPath: ImageConstant.imgQrcode,
                                  height: getSize(76),
                                  width: getSize(76),
                                ),
                                Padding(
                                  padding: getPadding(
                                    top: 25,
                                    bottom: 9,
                                  ),
                                  child: Text(
                                    'Add Farm',
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtInterRegular20,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: double.maxFinite,
                        child: GestureDetector(
                          onTap: () {
                            onTapViewbiodata(context, '64885db51d321f152c33613e');
                          },
                          child: Container(
                            margin: getMargin(top: 32),
                            padding: getPadding(
                              left: 105,
                              top: 41,
                              right: 105,
                              bottom: 41,
                            ),
                            decoration: AppDecoration.fillGreen200.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder4,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CustomImageView(
                                  svgPath: ImageConstant.imgVector,
                                  height: getSize(72),
                                  width: getSize(72),
                                ),
                                Padding(
                                  padding: getPadding(top: 19),
                                  child: Text(
                                    'View Biodata',
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtInterRegular20,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: double.maxFinite,
                        child: GestureDetector(
                          onTap: () {
                            onTapViewfarm(context, biodataModel?.data.id);
                          },
                          child: Container(
                            margin: getMargin(top: 32),
                            padding: getPadding(
                              left: 117,
                              top: 41,
                              right: 117,
                              bottom: 41,
                            ),
                            decoration: AppDecoration.fillLime100,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CustomImageView(
                                  svgPath: ImageConstant.imgMap,
                                  height: getVerticalSize(72),
                                  width: getHorizontalSize(80),
                                ),
                                Padding(
                                  padding: getPadding(top: 19),
                                  child: Text(
                                    'View Farm',
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtInterRegular20,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
          error: (error, stackTrace) => CustomErrorWidget(error: error.toString()),
          loading: () => CustomProgressIndicator(),
        ),
      ),
    );
  }

  void _loadProfileData(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(farmerBiodataControllerProvider.notifier).getFarmerBiodata(widget.farmerId);
    });
  }

  onTapAddfarm(BuildContext context) {
    context.pushNamed(AppRoutes.addFarmScreen);
  }

  onTapViewbiodata(BuildContext context, String farmerId) {
    context.pushNamed(AppRoutes.viewFarmerBiodataScreen, arguments: farmerId);
  }

  void onTapViewfarm(BuildContext context, String farmId) {
    context.pushNamed(AppRoutes.viewFarmsScreen, arguments: farmId);
  }
}
