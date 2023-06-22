import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nirsalfo/core/app_export.dart';
import 'package:nirsalfo/core/utils/utils.dart';
import 'package:nirsalfo/features/farms/controllers/add_farm_controller.dart';
import 'package:nirsalfo/widgets/app_bar/appbar_image.dart';
import 'package:nirsalfo/widgets/app_bar/appbar_title.dart';
import 'package:nirsalfo/widgets/app_bar/custom_app_bar.dart';
import 'package:nirsalfo/widgets/custom_button.dart';
import 'package:nirsalfo/widgets/custom_drop_down.dart';
import 'package:nirsalfo/widgets/custom_progress_indicator.dart';
import 'package:nirsalfo/widgets/custom_text_form_field.dart';

import '../data/model/add_farm_model.dart';

class AddFarmScreen extends ConsumerStatefulWidget {
  const AddFarmScreen();

  @override
  ConsumerState<AddFarmScreen> createState() => _AddFarmScreenState();
}

class _AddFarmScreenState extends ConsumerState<AddFarmScreen> {
  final _formKey = GlobalKey<FormState>();

  final titleController = TextEditingController();
  final addressController = TextEditingController();
  final farmSizeController = TextEditingController();
  final farmTypeController = TextEditingController();
  final areaSizeController = TextEditingController();
  final areaTypeController = TextEditingController();
  final plantationController = TextEditingController();

  final List<String> propertyOwnershipTypes = [
    'Lease',
    'Item Two',
    'Item Three',
  ];

  String propertyOwnershipType = 'Lease';

  late List<AddMapElement> farmMapElement;

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    final String farmerId = arguments['farmer_id'];
    final String farmerName = arguments['farmer_name'];

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
          title: AppbarTitle(text: 'Add Farm', margin: getMargin(left: 8)),
          styleType: Style.bgFillGreenA700,
        ),
        body: SizedBox(
          width: size.width,
          child: Form(
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Add Farm',
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtInterSemiBold28,
                          ),
                          Padding(
                            padding: getPadding(top: 9),
                            child: Text(
                              farmerName,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtInterRegular20,
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: getPadding(top: 24),
                      child: Text(
                        'Farm Information',
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtInterSemiBold22,
                      ),
                    ),
                    Padding(
                      padding: getPadding(top: 21),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Farm Title',
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtInterRegular14,
                          ),
                          CustomTextFormField(
                            focusNode: FocusNode(),
                            autofocus: true,
                            controller: titleController,
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
                            'Farm Address',
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
                            'Farm Size',
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtInterRegular14,
                          ),
                          CustomTextFormField(
                            focusNode: FocusNode(),
                            autofocus: true,
                            controller: farmSizeController,
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
                            'Farm Measurement Type',
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtInterRegular14,
                          ),
                          CustomTextFormField(
                            focusNode: FocusNode(),
                            autofocus: true,
                            controller: farmTypeController,
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
                            'Cultivated Area Size',
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtInterRegular14,
                          ),
                          CustomTextFormField(
                            focusNode: FocusNode(),
                            autofocus: true,
                            controller: areaSizeController,
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
                            'Cultivated Area Measurement Type',
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtInterRegular14,
                          ),
                          CustomTextFormField(
                            focusNode: FocusNode(),
                            autofocus: true,
                            controller: areaTypeController,
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
                            'Plantation',
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtInterRegular14,
                          ),
                          CustomTextFormField(
                            focusNode: FocusNode(),
                            autofocus: true,
                            controller: plantationController,
                            hintText: 'Write here',
                            margin: getMargin(top: 10),
                            textInputAction: TextInputAction.done,
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: getPadding(top: 22),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Property Ownership Type',
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
                            margin: getMargin(top: 9),
                            items: propertyOwnershipTypes,
                            onChanged: (value) {
                              propertyOwnershipType = value;
                            },
                          )
                        ],
                      ),
                    ),
                    CustomButton(
                      height: getVerticalSize(44),
                      text: 'Map Farm',
                      margin: getMargin(top: 16),
                      variant: ButtonVariant.tertiary,
                      fontStyle: ButtonFontStyle.interRegular14,
                      onTap: () {
                        onTapMapfarm(context, farmerName);
                      },
                    ),
                    vSpace(16),
                    Consumer(
                      builder: (_, WidgetRef ref, __) {
                        final state = ref.watch(addFarmControllerProvider);

                        return state.when(
                          data: (data) {
                            if (data != null) {
                              showCustomSnackBarAfterFrame(context, data.toString());
                            }

                            return _saveFarmButton(ref, farmerId);
                          },
                          error: (error, stackTrace) {
                            showCustomSnackBarAfterFrame(context, error.toString(), isError: true);

                            return _saveFarmButton(ref, farmerId);
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
      ),
    );
  }

  Widget _saveFarmButton(WidgetRef ref, String farmerId) {
    return CustomButton(
      height: getVerticalSize(44),
      text: 'Save Farm',
      margin: getMargin(top: 16),
      onTap: () {
        onTapSavefarm(context, farmerId);
      },
    );
  }

  void onTapMapfarm(BuildContext context, String farmerName) async {
    farmMapElement = await Navigator.of(context).pushNamed(
      AppRoutes.viewFarmsMapScreen,
      arguments: {
        'farmer_name': farmerName,
      },
    ) as List<AddMapElement>;
  }

  void onTapSavefarm(BuildContext context, String farmerId) {
    if (_formKey.currentState!.validate()) {
      final title = titleController.text;
      final address = addressController.text;
      final areaSize = double.parse(areaSizeController.text);
      final areaMeasurementType = areaTypeController.text;
      final farmSize = double.parse(farmSizeController.text);
      final farmMeasurementType = farmTypeController.text;
      final plantation = plantationController.text;

      ref.read(addFarmControllerProvider.notifier).addFarm(
            farmerId,
            AddFarmModel(
              title: title,
              address: address,
              cultivatedArea: CultivatedArea(
                size: areaSize,
                measurementType: areaMeasurementType,
              ),
              farm: FarmArea(
                size: farmSize,
                measurementType: farmMeasurementType,
              ),
              map: farmMapElement,
              ownershipType: propertyOwnershipType,
              plantation: plantation,
            ),
          );
    }
  }
}
