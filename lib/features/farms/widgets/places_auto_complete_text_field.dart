import 'package:flutter/material.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/prediction.dart';

import '../../../core/utils/color_constant.dart';
import '../../../core/utils/size_utils.dart';
import '../../../theme/app_style.dart';

class PlacesAutoCompleteTextField extends StatefulWidget {
  final void Function(Prediction prediction) onPlacesItemClick;

  const PlacesAutoCompleteTextField({Key? key, required this.onPlacesItemClick}) : super(key: key);

  @override
  State<PlacesAutoCompleteTextField> createState() => _PlacesAutoCompleteTextFieldState();
}

class _PlacesAutoCompleteTextFieldState extends State<PlacesAutoCompleteTextField> {
  final _placesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Farm Address',
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.left,
          style: AppStyle.txtInterRegular14,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0, bottom: 20),
          child: GooglePlaceAutoCompleteTextField(
            textEditingController: _placesController,
            googleAPIKey: 'AIzaSyCbFHg-H5_LoXTYsA4dcLgizCvpSC1DRqc',
            inputDecoration: InputDecoration(
              hintText: '12 Ezekiel Street, Ikeja',
              hintStyle: _setFontStyle(),
              border: _setBorderStyle(),
              enabledBorder: _setBorderStyle(),
              focusedBorder: _setBorderStyle(),
              disabledBorder: _setBorderStyle(),
              filled: false,
              isDense: true,
              contentPadding: EdgeInsets.all(12),
            ),
            debounceTime: 600,
            countries: ['ng'],
            isLatLngRequired: true,
            getPlaceDetailWithLatLng: widget.onPlacesItemClick,
            itmClick: (Prediction? prediction) {
                _placesController.text = prediction?.description ?? '';

            },
          ),
        ),
      ],
    );
  }

  OutlineInputBorder _setBorderStyle() {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: ColorConstant.gray300,
        width: 1,
      ),
    );
  }

  TextStyle _setFontStyle() {
    return TextStyle(
      color: ColorConstant.gray400,
      fontSize: getFontSize(
        14,
      ),
      fontFamily: 'Inter',
      fontWeight: FontWeight.w400,
    );
  }
}
