import 'package:flutter/material.dart';
import 'package:nirsalfo/core/app_export.dart';
import 'package:nirsalfo/core/utils/extensions.dart';
import 'package:nirsalfo/core/utils/utils.dart';
import 'package:nirsalfo/features/farms/data/model/farm_details_model.dart';
import 'package:nirsalfo/widgets/app_bar/appbar_image.dart';
import 'package:nirsalfo/widgets/app_bar/appbar_title.dart';
import 'package:nirsalfo/widgets/app_bar/custom_app_bar.dart';
import 'package:nirsalfo/widgets/custom_button.dart';

class ViewSingleFarmScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    final farm = arguments['farm'] as Farm;
    final farmerName = arguments['farmer_name'] as String;

    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.whiteA700,
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
            text: 'Single Farm Detail',
            margin: getMargin(
              left: 8,
            ),
          ),
          styleType: Style.bgFillGreenA700,
        ),
        body: SizedBox(
          width: size.width,
          child: SingleChildScrollView(
            padding: getPadding(
              top: 37,
            ),
            child: Padding(
              padding: getPadding(
                left: 19,
                right: 19,
                bottom: 5,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: getPadding(
                      left: 2,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'View Farm',
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtInterSemiBold28,
                        ),
                        Padding(
                          padding: getPadding(
                            top: 9,
                          ),
                          child: Text(
                            farmerName,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtInterRegular20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: double.maxFinite,
                    child: Container(
                      margin: getMargin(
                        top: 17,
                      ),
                      padding: getPadding(
                        left: 16,
                        top: 24,
                        right: 16,
                        bottom: 24,
                      ),
                      decoration: AppDecoration.fillGreen50.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder10,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: getPadding(
                              top: 5,
                            ),
                            child: Text(
                              'Farm Title',
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtInterSemiBold14,
                            ),
                          ),
                          Padding(
                            padding: getPadding(
                              top: 15,
                            ),
                            child: Text(
                              '${farm.farmTitle}',
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtInterRegular14Black90001,
                            ),
                          ),
                          Padding(
                            padding: getPadding(
                              top: 15,
                            ),
                            child: Text(
                              'Farm Address',
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtInterSemiBold14,
                            ),
                          ),
                          Padding(
                            padding: getPadding(
                              top: 16,
                            ),
                            child: Text(
                              '${farm.farmAddress}',
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtInterRegular14Black90001,
                            ),
                          ),
                          Padding(
                            padding: getPadding(
                              top: 13,
                            ),
                            child: Text(
                              'Land Size',
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtInterSemiBold14,
                            ),
                          ),
                          Padding(
                            padding: getPadding(
                              top: 15,
                            ),
                            child: Text(
                              '${farm.farmLandSize} ${farm.farmMeasurementType}',
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtInterRegular14Black90001,
                            ),
                          ),
                          Padding(
                            padding: getPadding(
                              top: 14,
                            ),
                            child: Text(
                              'Cultivated Area Size',
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtInterSemiBold14,
                            ),
                          ),
                          Padding(
                            padding: getPadding(
                              top: 15,
                            ),
                            child: Text(
                              '${farm.cultivatedAreaSize} ${farm.cultivatedAreaMeasurementType}',
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtInterRegular14Black90001,
                            ),
                          ),
                          Padding(
                            padding: getPadding(
                              top: 6,
                            ),
                            child: Text(
                              'Plantation',
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtInterSemiBold14,
                            ),
                          ),
                          Padding(
                            padding: getPadding(
                              top: 15,
                            ),
                            child: Text(
                              '${farm.plantation}',
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtInterRegular14Black90001,
                            ),
                          ),
                          Padding(
                            padding: getPadding(
                              top: 8,
                            ),
                            child: Text(
                              'Land Ownership',
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtInterSemiBold14,
                            ),
                          ),
                          Padding(
                            padding: getPadding(
                              top: 13,
                            ),
                            child: Text(
                              '${farm.landOwnership}',
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtInterRegular14Black90001,
                            ),
                          ),
                          Padding(
                            padding: getPadding(
                              top: 8,
                            ),
                            child: Text(
                              'Mapping Data',
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtInterSemiBold14,
                            ),
                          ),
                          vSpace(16),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: farm.map?.length,
                            itemBuilder: (context, index) {
                              return ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: farm.map?[index].points?.length,
                                itemBuilder: (context, index) {
                                  final point = farm.map?[index].points?[index];
                                  return Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Point: '),
                                      Text(
                                        'Lat ${point?.lat}°',
                                        maxLines: null,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.txtInterRegular12,
                                      ),
                                      Text(
                                        'Lon ${point?.long}°',
                                        maxLines: null,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.txtInterRegular12,
                                      ),
                                      vSpace(16),
                                    ],
                                  );
                                },
                              );
                            },
                          ),
                          vSpace(),
                          CustomButton(
                            height: getVerticalSize(
                              44,
                            ),
                            text: 'View Farm Map',
                            margin: getMargin(
                              top: 7,
                            ),
                            variant: ButtonVariant.tertiary,
                            fontStyle: ButtonFontStyle.interRegular14,
                            onTap: () {
                              context.pushNamed(
                                AppRoutes.viewFarmsMapScreen,
                                arguments: {
                                  'farm': farm,
                                  'farmer_name': farmerName,
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  CustomButton(
                    height: getVerticalSize(
                      44,
                    ),
                    text: 'Edit Farm',
                    margin: getMargin(
                      top: 12,
                    ),
                    variant: ButtonVariant.tertiary,
                    fontStyle: ButtonFontStyle.interRegular14,
                  ),
                  CustomButton(
                    height: getVerticalSize(
                      44,
                    ),
                    text: 'Delete Farm',
                    margin: getMargin(
                      top: 12,
                    ),
                    variant: ButtonVariant.fillRed900,
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
