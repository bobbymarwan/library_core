import 'package:library_core/widget/custom_text.dart';
import 'package:library_core/widget/shimmer_widget.dart';
import 'package:flutter/material.dart';
import 'package:library_core/styles/my_color.dart';
import 'package:library_core/styles/my_style.dart';
import 'package:library_core/misc/constant.dart';

import 'item_action_widget.dart';

class ItemDataCell {
  static text({
    required String value,
    AlignmentGeometry? alignment,
    TextAlign? textAlign,
    int? maxLines,
    Color? color,
    TextStyle? style,
    GestureTapCallback? onTap
  }) {
    return DataCell(
        Align(
            alignment: alignment ?? Alignment.centerLeft,
            child: SizedBox(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(child: CustomText(value,
                      maxLines: 2,
                        textAlign: textAlign ?? TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                      style: style ?? MyStyle.smallBody1Regular.copyWith(color: color ?? MyColor.dark)
                    ))
                  ],
                )
            )
        ),
        onTap: onTap
    );
  }

  static custom({
    required Widget child,
    AlignmentGeometry? alignment,
    GestureTapCallback? onTap
  }) {
    return DataCell(Align(
        alignment: alignment ?? Alignment.centerLeft,
        child: child
    ),
        onTap: onTap
    );
  }

  static action({AlignmentGeometry? alignment,
    GestureTapCallback? onTapSend,
    GestureTapCallback? onTapView,
    GestureTapCallback? onTapEdit,
    GestureTapCallback? onTapDelete}) {
    return DataCell(Align(
        alignment: alignment ?? Alignment.centerLeft,
        child: ItemActionWidget(
          onTapView: onTapView,
          onTapEdit: onTapEdit,
          onTapDelete: onTapDelete,
        )
    ));
  }

  static shimmer() {
    return DataCell(
      ShimmerWidget.rectangular(
          width: double.infinity,
          height: 12),
    );
  }
}