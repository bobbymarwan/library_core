import 'package:library_core/widget/custom_ink_well.dart';
import 'package:library_core/widget/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:library_core/styles/my_color.dart';
import 'package:library_core/styles/my_style.dart';
import 'package:library_core/misc/constant.dart';

class ChipWidget extends StatelessWidget {
  final String label;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? backgroundColor;
  final Color? labelColor;
  final TextStyle? labelStyle;
  final BoxBorder? border;
  final double? radius;
  final bool isBullet;
  final GestureTapCallback? onTap;
  final GestureTapCallback? onTapDelete;

  ChipWidget({super.key, 
  required this.label,
  this.width,
  this.height,
  this.padding,
  this.margin,
  this.backgroundColor,
  this.labelColor,
  this.labelStyle,
  this.border,
  this.radius,
  this.isBullet = false,
  this.onTap,
  this.onTapDelete,
  });
  
  @override
  Widget build(BuildContext context) {
    return CustomInkWell(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        padding: padding ?? EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
        margin: margin,
        decoration: BoxDecoration(
            color: backgroundColor ?? MyColor.white,
            borderRadius: BorderRadius.circular(radius ?? 100),
            border: border
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
           if(isBullet) Container(
              margin: EdgeInsets.only(right: kPadding8),
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: labelColor,
                shape: BoxShape.circle,
              ),
            ),
            CustomText(label,
                textAlign: TextAlign.center,
                style: labelStyle ?? MyStyle.smallBody1Regular.copyWith(
                    color: labelColor ?? MyColor.dark
                )),
             SizedBox(width: 4,),
             if(onTapDelete != null) InkWell(
                onTap: onTapDelete,
                child:  Icon(Icons.clear, color: MyColor.grey4,))
          ],
        ),
      )
    );
  }
  
}