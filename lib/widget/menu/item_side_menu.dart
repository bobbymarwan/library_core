import 'package:library_core/widget/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:library_core/styles/my_color.dart';
import 'package:library_core/styles/my_style.dart';
import 'package:library_core/misc/constant.dart';

class ItemSideMenu extends StatelessWidget {
  final IconData? iconData;
  final String label;
  final Color? iconColor;
  final Color? labelColor;
  final Color? backgroundColor;
  final bool selected;
  final bool isExpand;
  final GestureTapCallback? onTap;

  const ItemSideMenu({super.key,
  this.iconData,
  required this.label,
  this.iconColor,
  this.labelColor,
  this.backgroundColor,
  this.selected = false,
  this.isExpand = true,
  this.onTap});

  @override
  Widget build(BuildContext context) {
    final Color iColor = selected ? MyColor.primary : MyColor.grey5;
    final Color lColor = selected ? MyColor.primary : MyColor.grey5;

    return Container(
      decoration: BoxDecoration(
          color: backgroundColor ?? (selected ? MyColor.white : Colors.transparent),
          borderRadius: BorderRadius.circular(8)
      ),
      child: isExpand ? ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: kPadding10),
        leading: Icon(iconData, color: iconColor ?? iColor, size: 24,),
        horizontalTitleGap: 8.0,
        title: CustomText(label,
            margin: EdgeInsets.only(left: 10),
            style: MyStyle.smallBody1Regular.copyWith(color: labelColor ?? lColor,)),
        onTap: onTap,
      ) : ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: kPadding10),
        title: Icon(iconData, color: iconColor ?? iColor, size: 24,),
        onTap: onTap,
      )
    );
  }

}