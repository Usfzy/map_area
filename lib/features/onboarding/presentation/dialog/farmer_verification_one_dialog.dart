import 'package:flutter/material.dart';
import 'package:nirsalfo/core/app_export.dart';
import 'package:nirsalfo/core/utils/extensions.dart';
import 'package:nirsalfo/features/onboarding/data/model/verify_model.dart';
import 'package:nirsalfo/widgets/custom_button.dart';

Future<void> showFarmerVerificationOneDialog(
  BuildContext context,
  VerifyModel verifyModel,
) {
  return showDialog(
    context: context,
    builder: (_) => AlertDialog(
      content: FarmerVerificationOneDialog(verifyModel),
      backgroundColor: Colors.transparent,
      contentPadding: EdgeInsets.zero,
      insetPadding: EdgeInsets.only(left: 0),
    ),
  );
}

class FarmerVerificationOneDialog extends StatelessWidget {
  final VerifyModel verifyModel;
  const FarmerVerificationOneDialog(this.verifyModel);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: getMargin(left: 20, right: 19, bottom: 326),
      padding: getPadding(all: 32),
      decoration: AppDecoration.white.copyWith(borderRadius: BorderRadiusStyle.roundedBorder10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: getPadding(top: 5),
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
              '${verifyModel.data.firstName} ${verifyModel.data.lastName}',
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: AppStyle.txtInterRegular14Gray900,
            ),
          ),
          Padding(
            padding: getPadding(top: 24),
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
          Container(
            padding: getPadding(top: 17),
            width: 400,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: CustomButton(
                    height: getVerticalSize(44),
                    text: 'Cancel',
                    margin: getMargin(right: 8),
                    variant: ButtonVariant.fillRed900,
                    onTap: () {
                      onTapCancel(context);
                    },
                  ),
                ),
                Expanded(
                  child: CustomButton(
                    height: getVerticalSize(44),
                    text: 'Proceed',
                    margin: getMargin(left: 8),
                    onTap: () {
                      onTapProceed(context);
                    },
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  onTapCancel(BuildContext context) {
    context.pop();
  }

  onTapProceed(BuildContext context) {
    context.pushReplacementNamed(AppRoutes.farmerBiodataScreen, arguments: verifyModel);
  }
}
