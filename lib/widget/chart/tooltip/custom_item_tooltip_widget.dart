import 'package:library_core/misc/constant.dart';
import 'package:library_core/styles/my_color.dart';
import 'package:library_core/styles/my_style.dart';
import 'package:library_core/widget/custom_text.dart';
import 'package:flutter/material.dart';

class CustomItemTooltipWidget extends StatelessWidget {
  final Color? colorIndicator;
  final String label;
  final String value;
  const CustomItemTooltipWidget({super.key, required this.label, required this.value, this.colorIndicator});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: kPadding8, horizontal: kPadding4),
      margin: EdgeInsets.only(bottom: kPadding4),
      decoration: BoxDecoration(
          color: MyColor.white,
          borderRadius: BorderRadius.circular(5.0)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
              width: 110,
              child: Row(
                children: [
                  if(colorIndicator != null) Container(
                    height: 11,
                    width: 11,
                    margin: EdgeInsets.only(right: kPadding8),
                    decoration: BoxDecoration(
                        color: colorIndicator,
                        shape: BoxShape.circle
                    ),
                  ),
                  CustomText(label, style: MyStyle.smallBody1Bold)
                ],)
          ),
          CustomText(value, textAlign: TextAlign.end, style: MyStyle.smallBody1Bold)
        ],
      ),
    );
  }

}