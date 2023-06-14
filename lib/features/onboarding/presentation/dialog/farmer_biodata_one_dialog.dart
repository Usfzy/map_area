import 'package:flutter/material.dart';
import 'package:nirsalfo/core/app_export.dart';
import 'package:nirsalfo/core/utils/extensions.dart';
import 'package:nirsalfo/widgets/custom_button.dart';

import '../../../farms/data/model/register_farmer_model.dart';

Future<void> showFarmerBiodataDialog(BuildContext context, RegisterFarmer farmerModel) {
  return showDialog(
    context: context,
    builder: (_) => AlertDialog(
      content: FarmerBiodataDialog(farmerModel),
      backgroundColor: Colors.transparent,
      contentPadding: EdgeInsets.zero,
      insetPadding: EdgeInsets.only(left: 0),
    ),
  );
}

class FarmerBiodataDialog extends StatelessWidget {
  final RegisterFarmer farmerModel;

  const FarmerBiodataDialog(this.farmerModel);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: getMargin(left: 20, right: 19, bottom: 327),
        padding: getPadding(left: 25, top: 32, right: 25, bottom: 32),
        decoration: AppDecoration.white.copyWith(borderRadius: BorderRadiusStyle.roundedBorder10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: getPadding(top: 1),
              child: Text(
                '${farmerModel.firstName} ${farmerModel.lastName} ${farmerModel.otherName} Has been Onboarded. ',
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: AppStyle.txtInterRegular14Gray900,
              ),
            ),
            Container(
              padding: getPadding(top: 17),
              width: 400,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: CustomButton(
                      height: getVerticalSize(44),
                      text: 'Onboard Another',
                      margin: getMargin(right: 8),
                      variant: ButtonVariant.fillRed900,
                      padding: ButtonPadding.paddingT13,
                      onTap: () {
                        onTapOnboardanother(context);
                      },
                    ),
                  ),
                  Expanded(
                    child: CustomButton(
                      height: getVerticalSize(44),
                      text: 'View Profile',
                      margin: getMargin(left: 8),
                      onTap: () {
                        onTapVewprofile(context, farmerModel.id);
                      },
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  onTapOnboardanother(BuildContext context) {
    Navigator.pushReplacementNamed(context, AppRoutes.farmerVerificationScreen);
  }

  onTapVewprofile(BuildContext context, String farmerId) {
    if (farmerId.isEmpty) return;

    context.pushReplacementNamed(AppRoutes.farmerProfileScreen, arguments: farmerId);
    // context.pop();
  }
}
