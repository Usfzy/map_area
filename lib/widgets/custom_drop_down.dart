import 'package:flutter/material.dart';
import 'package:nirsalfo/core/app_export.dart';

class CustomDropDown extends StatelessWidget {
  CustomDropDown(
      {this.padding,
      this.variant,
      this.fontStyle,
      this.alignment,
      this.width,
      this.margin,
      this.focusNode,
      this.autofocus = false,
      this.icon,
      this.hintText,
      this.prefix,
      this.prefixConstraints,
      this.items,
      this.onChanged,
      this.validator});

  final DropDownPadding? padding;

  final DropDownVariant? variant;

  final DropDownFontStyle? fontStyle;

  final Alignment? alignment;

  final double? width;

  final EdgeInsetsGeometry? margin;

  final FocusNode? focusNode;

  final bool? autofocus;

  final Widget? icon;

  final String? hintText;

  final Widget? prefix;

  final BoxConstraints? prefixConstraints;

  final List<String>? items;

  final Function(String)? onChanged;

  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: _buildDropDownWidget(),
          )
        : _buildDropDownWidget();
  }

  _buildDropDownWidget() {
    return Container(
      width: width ?? double.maxFinite,
      margin: margin,
      child: DropdownButtonFormField(
        focusNode: focusNode,
        autofocus: autofocus!,
        icon: icon,
        style: _setFontStyle(),
        decoration: _buildDecoration(),
        items: items?.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              overflow: TextOverflow.ellipsis,
            ),
          );
        }).toList(),
        onChanged: (value) {
          onChanged!(value.toString());
        },
        validator: validator,
      ),
    );
  }

  _buildDecoration() {
    return InputDecoration(
      hintText: hintText ?? "",
      hintStyle: _setFontStyle(),
      border: _setBorderStyle(),
      enabledBorder: _setBorderStyle(),
      focusedBorder: _setBorderStyle(),
      prefixIcon: prefix,
      prefixIconConstraints: prefixConstraints,
      filled: _setFilled(),
      isDense: true,
      contentPadding: _setPadding(),
    );
  }

  _setFontStyle() {
    switch (fontStyle) {
      default:
        return TextStyle(
          color: ColorConstant.gray800,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
        );
    }
  }

  _setBorderStyle() {
    switch (variant) {
      case DropDownVariant.none:
        return InputBorder.none;
      default:
        return OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorConstant.gray300,
            width: 1,
          ),
        );
    }
  }

  _setFilled() {
    switch (variant) {
      case DropDownVariant.outlineGray300:
        return false;
      case DropDownVariant.none:
        return false;
      default:
        return false;
    }
  }

  _setPadding() {
    switch (padding) {
      default:
        return getPadding(
          left: 12,
          top: 15,
          bottom: 15,
        );
    }
  }
}

enum DropDownPadding {
  paddingT15,
}

enum DropDownVariant {
  none,
  outlineGray300,
}

enum DropDownFontStyle {
  interRegular14,
}
