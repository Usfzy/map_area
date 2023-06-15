import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nirsalfo/core/app_export.dart';
import 'package:nirsalfo/core/utils/extensions.dart';
import 'package:nirsalfo/core/utils/utils.dart';
import 'package:nirsalfo/features/farms/widgets/farm_item_widget.dart';
import 'package:nirsalfo/widgets/app_bar/appbar_image.dart';
import 'package:nirsalfo/widgets/app_bar/appbar_title.dart';
import 'package:nirsalfo/widgets/app_bar/custom_app_bar.dart';
import 'package:nirsalfo/widgets/custom_error_widget.dart';
import 'package:nirsalfo/widgets/custom_progress_indicator.dart';

import '../controllers/farm_list_controller.dart';

class ViewFarmsListScreen extends ConsumerStatefulWidget {
  final String farmId;

  const ViewFarmsListScreen({required this.farmId});

  @override
  ConsumerState<ViewFarmsListScreen> createState() => _ViewFarmsListScreenState();
}

class _ViewFarmsListScreenState extends ConsumerState<ViewFarmsListScreen> {
  @override
  void initState() {
    super.initState();

    _loadData(context);
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(farmListControllerProvider);

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
          title: AppbarTitle(text: 'View Farms', margin: getMargin(left: 8)),
          styleType: Style.bgFillGreenA700,
        ),
        body: state.when(
          data: (farmDetailsModel) {
            if (farmDetailsModel == null) return SizedBox.shrink();

            return SizedBox(
              width: size.width,
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
                            'View Farms',
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtInterSemiBold28,
                          ),
                          Padding(
                            padding: getPadding(top: 9),
                            child: Text(
                              '${farmDetailsModel.data.farmer.firstName} ${farmDetailsModel.data.farmer.lastName} ${farmDetailsModel.data.farmer.otherName}',
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtInterRegular20,
                            ),
                          )
                        ],
                      ),
                    ),
                    vSpace(),
                    Expanded(
                      child: ListView.builder(
                        itemCount: farmDetailsModel.data.farms.length,
                        itemBuilder: (context, index) {
                          return FarmItemWidget(
                            farmerName:
                                '${farmDetailsModel.data.farmer.firstName} ${farmDetailsModel.data.farmer.lastName} ${farmDetailsModel.data.farmer.otherName}',
                            farm: farmDetailsModel.data.farms[index],
                          );
                        },
                      ),
                    ),
                  ],
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

  void _loadData(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(farmListControllerProvider.notifier).getFarmList(widget.farmId);
    });
  }

  onTapRowahmedtuberfa(BuildContext context) {
    context.pushNamed(AppRoutes.viewSingleFarmScreen);
  }
}
