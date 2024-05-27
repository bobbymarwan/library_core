import 'package:library_core/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootstrap5/flutter_bootstrap5.dart';
import 'package:library_core/misc/constant.dart';
import 'package:library_core/styles/my_color.dart';
import 'package:library_core/styles/my_style.dart';

class ButtonPrimary {
  static _base({required String text,
    double? width,
    double? height,
    EdgeInsetsGeometry? padding,
    bool isExpand = false,
    bool isLoading = false,
    bool enabled = true,
    TextStyle? style,
    Color? textColor,
    Color? backgroundColor,
    IconData? iconLeft,
    IconData? iconRight,
    double? iconSize,
    BorderRadiusGeometry? borderRadius,
    GestureTapCallback? onPressed}) {
    return ElevatedButton(
      onPressed: !isLoading && enabled ? onPressed : null,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? MyColor.primary,
        elevation: 0.0,
        padding: padding ?? EdgeInsets.symmetric(horizontal: kPadding10),
        shadowColor: Colors.transparent,
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
          child: CircularProgressIndicator(strokeWidth: 3, color: textColor ?? MyColor.white)
      ) : Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (iconLeft != null)
            Padding(padding: EdgeInsets.symmetric(horizontal: 5), child: Icon(
              iconLeft,
              color: textColor ?? MyColor.white,
              size: iconSize ?? 20,
            )),
          CustomText(text, textAlign: TextAlign.center, style: style ??
              MyStyle.smallBody1Regular.copyWith(
                  color: textColor ?? MyColor.white)),
          if (iconRight != null)
            Padding(padding: EdgeInsets.symmetric(horizontal: 5), child: Icon(
              iconRight,
              color: textColor ?? MyColor.white,
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
    Color? textColor,
    Color? backgroundColor,
    IconData? iconLeft,
    IconData? iconRight,
    double? iconSize,
    BorderRadiusGeometry? borderRadius,
    GestureTapCallback? onPressed}) {
    return Column(
      children: [
        FB5Col(
          child: large(text: text,
              width: width,
              height: height,
              padding: padding,
              isExpand: isExpand,
              isLoading: isLoading,
              enabled: enabled,
              style: style,
              textColor: textColor,
              backgroundColor: backgroundColor,
              iconLeft: iconLeft,
              iconRight: iconRight,
              iconSize: iconSize,
              borderRadius: borderRadius,
              onPressed: onPressed),
        ),
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
    Color? textColor,
    Color? backgroundColor,
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
      textColor: textColor,
      backgroundColor: backgroundColor,
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
    Color? textColor,
    Color? backgroundColor,
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
        style: style ?? MyStyle.smallBody1Regular.copyWith(color: textColor ?? MyColor.white),
        textColor: textColor,
        backgroundColor: backgroundColor,
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
    Color? textColor,
    Color? backgroundColor,
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
        style: style ?? MyStyle.smallBody1Regular.copyWith(color: textColor ?? MyColor.white),
        textColor: textColor,
        backgroundColor: backgroundColor,
        iconLeft: iconLeft,
        iconRight: iconRight,
        iconSize: iconSize ?? 14,
        borderRadius: borderRadius,
        onPressed: onPressed
    );
  }

  static text(
      {required String text,
        AlignmentGeometry? alignment,
        EdgeInsetsGeometry? padding,
        EdgeInsetsGeometry? margin,
        double? width,
        double? height,
        TextStyle? textStyle,
        GestureTapCallback? onPressed}) {
    return Container(
        alignment: alignment,
        padding: padding,
        margin: margin,
        child: TextButton(
            onPressed: onPressed,
            style: ButtonStyle(
              overlayColor: MaterialStateColor.resolveWith(
                      (states) => Colors.transparent),
            ),
            child: CustomText(text,
                style: textStyle ??
                    MyStyle.smallBody1Regular.copyWith(color: MyColor.primary))));
  }

  static icon({
    double? width,
    double? height,
    bool isLoading = false,
    bool enabled = true,
    Color? color,
    Color? backgroundColor,
    IconData? iconData,
    BorderRadiusGeometry? borderRadius,
    GestureTapCallback? onPressed}) {
    return ElevatedButton(
      onPressed: !isLoading && enabled ? onPressed : null,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? MyColor.primary,
        elevation: 0.0,
        shadowColor: Colors.transparent,
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(6.0),
        ),
          fixedSize: Size(36, 36),
          minimumSize: Size(36, 36),
        maximumSize: Size(36, 36)
      ),
      child: isLoading ? Container(
          width: 25,
          height: 25,
          // margin: EdgeInsets.all(kPadding8),
          child: CircularProgressIndicator(strokeWidth: 3, color: color ?? MyColor.white)
      ) : Icon(
        iconData,
        color: color ?? MyColor.white,
        size: 14,
      ),
    );
  }

}
