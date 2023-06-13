import 'package:flutter/material.dart';
import 'package:nirsalfo/core/app_export.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {this.padding,
      this.variant,
      this.fontStyle,
      this.alignment,
      this.margin,
      this.onTap,
      this.width,
      this.height,
      this.text,
      this.prefixWidget,
      this.suffixWidget});

  final ButtonPadding? padding;

  final ButtonVariant? variant;

  final ButtonFontStyle? fontStyle;

  final Alignment? alignment;

  final EdgeInsetsGeometry? margin;

  final VoidCallback? onTap;

  final double? width;

  final double? height;

  final String? text;

  final Widget? prefixWidget;

  final Widget? suffixWidget;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment!,
            child: _buildButtonWidget(),
          )
        : _buildButtonWidget();
  }

  _buildButtonWidget() {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: TextButton(
        onPressed: onTap,
        style: _buildTextButtonStyle(),
        child: _buildButtonWithOrWithoutIcon(),
      ),
    );
  }

  _buildButtonWithOrWithoutIcon() {
    if (prefixWidget != null || suffixWidget != null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          prefixWidget ?? SizedBox(),
          Text(
            text ?? "",
            textAlign: TextAlign.center,
            style: _setFontStyle(),
          ),
          suffixWidget ?? SizedBox(),
        ],
      );
    } else {
      return Text(
        text ?? "",
        textAlign: TextAlign.center,
        style: _setFontStyle(),
      );
    }
  }

  _buildTextButtonStyle() {
    return TextButton.styleFrom(
      fixedSize: Size(
        width ?? double.maxFinite,
        height ?? getVerticalSize(40),
      ),
      padding: _setPadding(),
      backgroundColor: _setColor(),
      shape: RoundedRectangleBorder(),
    );
  }

  _setPadding() {
    switch (padding) {
      case ButtonPadding.paddingT13:
        return getPadding(
          left: 6,
          top: 13,
          right: 6,
          bottom: 13,
        );
      default:
        return getPadding(
          all: 13,
        );
    }
  }

  _setColor() {
    switch (variant) {
      case ButtonVariant.tertiary:
        return ColorConstant.lime300;
      case ButtonVariant.fillRed900:
        return ColorConstant.red900;
      case ButtonVariant.fillLime800:
        return ColorConstant.lime800;
      default:
        return ColorConstant.greenA700;
    }
  }

  _setFontStyle() {
    switch (fontStyle) {
      case ButtonFontStyle.interRegular14:
        return TextStyle(
          color: ColorConstant.black90001,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
        );
      case ButtonFontStyle.interBold14:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'Inter',
          fontWeight: FontWeight.w700,
        );
      default:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
        );
    }
  }
}

enum ButtonPadding {
  paddingAll13,
  paddingT13,
}

enum ButtonVariant {
  primary,
  tertiary,
  fillRed900,
  fillLime800,
}

enum ButtonFontStyle {
  interRegular14WhiteA700,
  interRegular14,
  interBold14,
}
