import 'package:library_core/widget/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:library_core/misc/constant.dart';
import 'package:library_core/styles/my_color.dart';
import 'package:library_core/styles/my_style.dart';

class ButtonSecondary {
  static _base({required String text,
    double? width,
    double? height,
    EdgeInsetsGeometry? padding,
    bool isExpand = false,
    bool isLoading = false,
    bool enabled = true,
    TextStyle? style,
    Color? borderColor,
    Color? textColor,
    IconData? iconLeft,
    IconData? iconRight,
    double? iconSize,
    BorderRadiusGeometry? borderRadius,
    GestureTapCallback? onPressed}) {
    return OutlinedButton(
      onPressed: !isLoading && enabled ? onPressed : null,
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        padding: padding ?? EdgeInsets.symmetric(horizontal: kPadding10),
        shadowColor: Colors.transparent,
        side: BorderSide(color: borderColor ?? MyColor.primary, width: 1.0),
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(6.0),
        ),
        minimumSize: isExpand
            ? Size.fromHeight(height ?? 48)
            : Size(width ?? 50, height ?? 48),
      ),
      child: isLoading ? Container(
          width: 25,
          height: 25,
          margin: EdgeInsets.all(kPadding8),
          child: CircularProgressIndicator(strokeWidth: 3, color: textColor ?? MyColor.primary)
      ) : Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (iconLeft != null)
            Padding(padding: EdgeInsets.symmetric(horizontal: 5), child: Icon(
              iconLeft,
              color: textColor ?? MyColor.primary,
              size: iconSize ?? 20,
            )),
          CustomText(text, textAlign: TextAlign.center,
              style: style ??
                  MyStyle.smallBody1Regular.copyWith(
                      color: textColor ?? MyColor.primary)),
          if (iconRight != null)
            Padding(padding: EdgeInsets.symmetric(horizontal: 5), child: Icon(
              iconRight,
              color: textColor ?? MyColor.primary,
              size: iconSize ?? 20,
            )),
        ],
      ),
    );
  }

  static standard({required String text,
    double? width,
    double? height,
    EdgeInsetsGeometry? padding,
    bool isExpand = false,
    bool isLoading = false,
    bool enabled = true,
    TextStyle? style,
    Color? backgroundColor,
    IconData? iconLeft,
    IconData? iconRight,
    double? iconSize,
    BorderRadiusGeometry? borderRadius,
    GestureTapCallback? onPressed}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        large(text: text,
            width: width,
            height: height,
            padding: padding,
            isExpand: isExpand,
            isLoading: isLoading,
            enabled: enabled,
            style: style,
            iconLeft: iconLeft,
            iconRight: iconRight,
            iconSize: iconSize,
            borderRadius: borderRadius,
            onPressed: onPressed),
      ],
    );
  }

  static large({required String text,
    double? width,
    double? height,
    EdgeInsetsGeometry? padding,
    bool isExpand = false,
    bool isLoading = false,
    bool enabled = true,
    TextStyle? style,
    Color? borderColor,
    Color? textColor,
    IconData? iconLeft,
    IconData? iconRight,
    double? iconSize,
    BorderRadiusGeometry? borderRadius,
    GestureTapCallback? onPressed}) {
    return _base(
        text: text,
        width: width,
        height: height,
      padding: padding,
      isExpand: isExpand,
      isLoading: isLoading,
      enabled: enabled,
      style: style,
      borderColor: borderColor,
      textColor: textColor,
      iconLeft: iconLeft,
      iconRight: iconRight,
      iconSize: iconSize,
      borderRadius: borderRadius,
      onPressed: onPressed
    );
  }

  static medium({required String text,
    double? width,
    double? height,
    EdgeInsetsGeometry? padding,
    bool isExpand = false,
    bool isLoading = false,
    bool enabled = true,
    TextStyle? style,
    Color? borderColor,
    Color? textColor,
    IconData? iconLeft,
    IconData? iconRight,
    double? iconSize,
    BorderRadiusGeometry? borderRadius,
    GestureTapCallback? onPressed}) {
    return _base(
        text: text,
        width: width,
        height: height ?? 44,
        padding: padding,
        isExpand: isExpand,
        isLoading: isLoading,
        enabled: enabled,
        style: style ?? MyStyle.smallBody1Regular.copyWith(color: textColor ?? MyColor.primary),
        borderColor: borderColor,
        textColor: textColor,
        iconLeft: iconLeft,
        iconRight: iconRight,
        iconSize: iconSize ?? 16,
        borderRadius: borderRadius,
        onPressed: onPressed
    );
  }

  static small({required String text,
    double? width,
    double? height,
    EdgeInsetsGeometry? padding,
    bool isExpand = false,
    bool isLoading = false,
    bool enabled = true,
    TextStyle? style,
    Color? borderColor,
    Color? textColor,
    IconData? iconLeft,
    IconData? iconRight,
    double? iconSize,
    BorderRadiusGeometry? borderRadius,
    GestureTapCallback? onPressed}) {
    return _base(
        text: text,
        width: width,
        height: height ?? 36,
        padding: padding,
        isExpand: isExpand,
        isLoading: isLoading,
        enabled: enabled,
        style: style ?? MyStyle.smallBody1Regular.copyWith(color: textColor ?? MyColor.primary),
        borderColor: borderColor,
        textColor: textColor,
        iconLeft: iconLeft,
        iconRight: iconRight,
        iconSize: iconSize ?? 14,
        borderRadius: borderRadius,
        onPressed: onPressed
    );
  }
}
