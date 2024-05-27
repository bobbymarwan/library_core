import 'package:library_core/widget/custom_text.dart';
import 'package:library_core/widget/shimmer_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootstrap5/flutter_bootstrap5.dart';
import 'package:library_core/styles/my_color.dart';
import 'package:library_core/styles/my_style.dart';
import 'package:library_core/misc/constant.dart';

class ItemView {
  static Widget verticalWidget({
    required String label,
    required String value,
    EdgeInsetsGeometry? labelMargin,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    TextStyle? labelStyle,
    TextStyle? valueStyle,
    Color? backgrounColor,
    bool loading = false
  }) {
    return Container(
        color: backgrounColor,
        padding: padding,
        margin: margin,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(label, margin: labelMargin ?? EdgeInsets.only(bottom: kPadding8),
                style: labelStyle ?? MyStyle.body2Bold),
            !loading ? CustomText(
                value, style: valueStyle ?? MyStyle.body2Regular)
                : _shimmer(),
          ],
        )
    );
  }

  static Widget verticalCustomWidget({
    required String label,
    required Widget child,
    Color? labelColor,
    EdgeInsetsGeometry? labelMargin,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    TextStyle? labelStyle,
    Color? backgrounColor,
    bool loading = false,
    bool isMandatory = false
  }) {
    return Container(
        color: backgrounColor,
        padding: padding,
        margin: margin,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if(label.isNotEmpty)
              Container(
                  margin: labelMargin ?? EdgeInsets.only(bottom: kPadding8),
                child: RichText(
                  text: TextSpan(
                      text: label,
                      style: labelStyle ?? MyStyle.body2Bold.copyWith(color: MyColor.dark),
                      children: [
                        if(isMandatory)TextSpan(text: '*', style: labelStyle ?? MyStyle.body2Bold.copyWith(color: MyColor.dark),),
                      ]
                  ),
                )
              ),
            // CustomText(label, margin: labelMargin ?? EdgeInsets.only(bottom: kPadding8),
            //     style: labelStyle ?? MyStyle.body2Bold),
            !loading ? child : _shimmer()
          ],
        )
    );
  }
  //
  // static Widget horizontalWidget({
  //   required String label,
  //   required String value,
  //   EdgeInsetsGeometry? padding,
  //   EdgeInsetsGeometry? margin,
  //   TextStyle? labelStyle,
  //   TextStyle? valueStyle,
  //   Color? backgrounColor,
  //   TextOverflow? labelTextOverflow,
  //   int? labelFlex,
  //   int? valueFlex
  // }) {
  //   return Container(
  //       color: backgrounColor,
  //       padding: padding,
  //       margin: margin ?? EdgeInsets.only(bottom: kPadding16),
  //       child: Row(
  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //         children: [
  //           Expanded(flex: labelFlex ?? 1, child: CustomText(label, overflow: labelTextOverflow, style: labelStyle ?? MyStyle.body2Bold)),
  //           Expanded(flex: valueFlex ?? 1, child: CustomText(value, textAlign: TextAlign.end, style: valueStyle ?? MyStyle.body2Regular)),
  //         ],
  //       )
  //   );
  // }
  //
  static Widget horizontalCustomWidget({
    required String label,
    required Widget child,
    String? colLeft,
    String? colRight,
    Color? labelColor,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    TextStyle? labelStyle,
    Color? backgrounColor,
    bool loading = false,
    String? labelAlign,
  }) {
    String align = labelAlign ?? 'align-items-center';
    return Container(
        color: backgrounColor,
        padding: padding,
        child: FB5Row(
          classNames: '$align gx-3 mb-3',
          children: [
            FB5Col(
              classNames: colLeft ?? 'col-sm-2 mb-2 mb-sm-0',
              child: CustomText(label, style: labelStyle ??
                  MyStyle.body2Bold),
            ),
            FB5Col(
                classNames: colRight ?? 'col-sm-10',
                child: !loading ? child : Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: MyColor.grey2,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(8), // Radius border
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomText(
                        'Please Wait...',
                        style: MyStyle.body2Regular,
                      )
                    ],
                  ),
                )
            )
          ],
        )
    );
  }

  static _shimmer() {
    return Align(
      alignment: Alignment.centerLeft,
      child: ShimmerWidget.rectangular(
          width: 150,
          height: 12)
    );
  }
}