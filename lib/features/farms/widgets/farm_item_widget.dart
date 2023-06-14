import 'package:flutter/material.dart';
import 'package:nirsalfo/core/app_export.dart';
import 'package:nirsalfo/core/utils/extensions.dart';
import 'package:nirsalfo/features/farms/data/model/farm_details_model.dart';

class FarmItemWidget extends StatelessWidget {
  final String farmerName;
  final Farm farm;
  const FarmItemWidget({Key? key, required this.farmerName, required this.farm}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _onTap(
        context,
      ),
      child: Container(
        margin: getMargin(top: 21),
        padding: getPadding(all: 8),
        decoration: AppDecoration.fillGreen50.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder4,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: getPadding(top: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    farm.farmTitle,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtInterMedium18,
                  ),
                  Padding(
                    padding: getPadding(
                      top: 6,
                    ),
                    child: Text(
                      '${farm.farmLandSize} ${farm.farmMeasurementType} ${farm.plantation}',
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtInterRegular12,
                    ),
                  )
                ],
              ),
            ),
            CustomImageView(
              svgPath: ImageConstant.imgArrowright,
              height: getVerticalSize(44),
              width: getHorizontalSize(35),
              margin: getMargin(
                top: 1,
                bottom: 1,
              ),
            )
          ],
        ),
      ),
    );
  }

  void _onTap(BuildContext context) {
    context.pushNamed(AppRoutes.viewSingleFarmScreen, arguments: {
      'farm': farm,
      'farmer_name': farmerName,
    });
  }
}
