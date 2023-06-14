import 'package:flutter/material.dart';
import 'package:nirsalfo/core/app_export.dart';
import 'package:nirsalfo/features/farms/data/model/farmer_model.dart';

// ignore: must_be_immutable
class FarmersItemWidget extends StatelessWidget {
  final FarmerDatum farmerModel;
  final VoidCallback onTapColumnprofilepi;

  FarmersItemWidget({required this.farmerModel, required this.onTapColumnprofilepi});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapColumnprofilepi.call();
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomImageView(
            url: farmerModel.photo,
            height: getVerticalSize(
              269,
            ),
            width: getHorizontalSize(
              324,
            ),
          ),
          Padding(
            padding: getPadding(
              top: 13,
            ),
            child: Text(
              '${farmerModel.firstName} ${farmerModel.lastName} ${farmerModel.otherName}',
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: AppStyle.txtInterMedium14,
            ),
          ),
          Padding(
            padding: getPadding(
              top: 12,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  farmerModel.location,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtInterRegular14Gray900,
                ),
                Text(
                  '${farmerModel.farms} Farms',
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtInterRegular14Gray900,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
