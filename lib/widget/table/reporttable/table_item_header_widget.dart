import 'package:library_core/widget/custom_ink_well.dart';
import 'package:library_core/widget/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:library_core/styles/my_color.dart';
import 'package:library_core/styles/my_style.dart';
import 'package:library_core/misc/constant.dart';

class TableItemHeaderWidget extends StatelessWidget {
  final String value;
  final int? flex;
  AlignmentGeometry? alignment;
  MainAxisAlignment? mainAxisAlignment;
  TextAlign? textAlign;
  TextStyle? style;
  GestureTapCallback? onSort;
  int ascending;
  EdgeInsetsGeometry? padding;
  final IconData iconArrowUp;
  final IconData iconArrowDown;
  TableItemHeaderWidget({super.key, required this.iconArrowDown, required this.iconArrowUp, required this.value, this.flex, this.alignment,
  this.mainAxisAlignment,
  this.textAlign, this.style,
  this.onSort, this.ascending = -1, this.padding});

  static const Duration _sortArrowAnimationDuration = Duration(milliseconds: 150);
  static const double _sortArrowPadding = 2.0;


  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: flex ?? 1,
        child: Container(
            alignment: alignment,
            padding: padding ?? EdgeInsets.symmetric(horizontal: kPadding16),
            child: onSort != null ? CustomInkWell(
              onTap: onSort,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                      child: CustomText(value ?? '',
                          margin: EdgeInsets.only(right: kPadding10),
                      textAlign: textAlign, style: style ?? MyStyle.smallBody1Bold.copyWith(color: MyColor.white))),
                  ascending == -1 || ascending != 1 ? Icon(iconArrowDown, color: MyColor.white, size: 16,)
                      : Icon(iconArrowUp, color: MyColor.white, size: 16,)
                ],
              )
            ) : CustomText(value ?? '', textAlign: textAlign, style: style ?? MyStyle.smallBody1Bold.copyWith(color: MyColor.white)
        )));
  }
}
