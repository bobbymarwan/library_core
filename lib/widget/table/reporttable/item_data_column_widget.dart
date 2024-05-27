import 'package:library_core/widget/custom_expansion_tile.dart';
import 'package:library_core/widget/custom_text.dart';
import 'package:library_core/widget/shimmer_widget.dart';
import 'package:library_core/widget/table/item_action_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:library_core/styles/my_color.dart';
import 'package:library_core/styles/my_style.dart';
import 'package:library_core/misc/constant.dart';

class ItemDataColumnWidget {
  static Widget text(
      {String? value,
      int? flex,
      EdgeInsetsGeometry? margin,
      Color? textColor,
        AlignmentGeometry? alignment,
        int? maxLines,
        TextStyle? style,
        EdgeInsetsGeometry? padding,
        TextAlign? textAlign
      }) {
    return Expanded(
        flex: flex ?? 1,
        child: Container(
            padding: padding ?? EdgeInsets.symmetric(vertical: kPadding10, horizontal: kPadding16),
            margin: margin,
            alignment: alignment,
            child: CustomText(value ?? '',
                maxLines: maxLines ?? 2,
                textAlign: textAlign,
                style: style ?? MyStyle.smallBody1Regular.copyWith(color: textColor ?? MyColor.dark))));
  }

  static Widget iconText(
      {String? value,
      int? flex,
      EdgeInsetsGeometry? margin,
      Color? textColor}) {
    return Expanded(
        flex: flex ?? 1,
        child: Container(
            padding: EdgeInsets.symmetric(vertical: kPadding10, horizontal: kPadding16),
            margin: margin,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.keyboard_arrow_down),
                Expanded(child: CustomText(value ?? '',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    margin: EdgeInsets.only(left: kPadding4),
                    style: MyStyle.smallBody1Regular.copyWith(color: textColor ?? MyColor.dark)))
              ],
            )));
  }

  static Widget custom(
      {required Widget child, int? flex, EdgeInsetsGeometry? margin}) {
    return Expanded(
        flex: flex ?? 1,
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: kPadding16),
            margin: margin,
            child: child));
  }

  static action({AlignmentGeometry? alignment,
    GestureTapCallback? onTapSend,
    GestureTapCallback? onTapView,
    GestureTapCallback? onTapEdit,
    GestureTapCallback? onTapDelete,
    int? flex,
  }) {
    return Expanded(
        flex: flex ?? 1,
        child: Align(
        alignment: alignment ?? Alignment.centerLeft,
        child: ItemActionWidget(
          onTapView: onTapView,
          onTapEdit: onTapEdit,
          onTapDelete: onTapDelete,
        )
    ));
  }

  static Widget expansionTile(
      {required List<Widget> parentItems,
        List<Widget>? childrenItems,
        int? flex,
        EdgeInsetsGeometry? margin}) {
    return CustomExpansionTile(
      padding: EdgeInsets.zero,
      tilePadding: EdgeInsets.zero,
      iconMargin: EdgeInsets.zero,
      iconPadding: EdgeInsets.zero,
      trailing: SizedBox.shrink(),
      title: Row(children: parentItems),
      children: childrenItems ?? [],
    );
  }

  static shimmer() {
    return Expanded(
        flex: 1,
        child: Container(
            padding: EdgeInsets.symmetric(vertical: kPadding10, horizontal: kPadding16),
            child: ShimmerWidget.rectangular(
                width: double.infinity,
                height: 12)));
  }
}
