import 'package:library_core/widget/custom_ink_well.dart';
import 'package:library_core/widget/custom_text.dart';
import 'package:library_core/widget/shimmer_widget.dart';
import 'package:library_core/widget/table/custom_data_table.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:library_core/styles/my_color.dart';
import 'package:library_core/styles/my_style.dart';
import 'package:library_core/misc/constant.dart';

class ItemDataColumn {
  static text({
    required String value,
    required IconData iconArrowUp,
    required IconData iconArrowDown,
    AlignmentGeometry? alignment,
    TextAlign? textAlign,
    int? maxLines,
    ColumnSize? size,
    double? fixedWidth,
    TextStyle? style,
    int ascending = -1,
    GestureTapCallback? onSort,
    Function(int columnIndex, bool ascending)? sort,
    TableMode? tableMode
  }) {
    if(tableMode != null && tableMode == TableMode.DataTable2){
      return DataColumn2(
        onSort: sort,
        fixedWidth: fixedWidth,
        // size: ColumnSize.L,
        label: Align(
            alignment: alignment ?? Alignment.centerLeft,
            child: onSort != null
                ? CustomInkWell(
                onTap: onSort,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                        child: CustomText(
                          value,
                          maxLines: maxLines,
                          textAlign: textAlign ?? TextAlign.left,
                          margin: EdgeInsets.only(right: kPadding10),
                          overflow:
                          maxLines != null ? TextOverflow.ellipsis : null,
                          style: MyStyle.smallBody1Bold
                              .copyWith(color: MyColor.white),
                        )),
                    ascending == -1 || ascending != 1
                        ? Icon(
                      iconArrowDown,
                      color: MyColor.white,
                      size: 16,
                    )
                        : Icon(
                      iconArrowUp,
                      color: MyColor.white,
                      size: 16,
                    )
                  ],
                ))
                : CustomText(
              value,
              maxLines: maxLines,
              textAlign: textAlign ?? TextAlign.left,
              overflow: maxLines != null ? TextOverflow.ellipsis : null,
              style:
              MyStyle.smallBody1Bold.copyWith(color: MyColor.white),
            )),
      );
    } else {
      return DataColumn(
        onSort: sort,
        label: Container(
          // width: fixedWidth ?? 100,
            constraints: BoxConstraints(minWidth: fixedWidth ?? 100),
            child: Align(
                alignment: alignment ?? Alignment.centerLeft,
                child: onSort != null
                    ? CustomInkWell(
                    onTap: onSort,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                            child: CustomText(
                              value,
                              maxLines: maxLines,
                              textAlign: textAlign ?? TextAlign.left,
                              margin: EdgeInsets.only(right: kPadding10),
                              overflow:
                              maxLines != null ? TextOverflow.ellipsis : null,
                              style: MyStyle.smallBody1Bold
                                  .copyWith(color: MyColor.white),
                            )),
                        ascending == -1 || ascending != 1
                            ? Icon(
                          iconArrowDown,
                          color: MyColor.white,
                          size: 16,
                        )
                            : Icon(
                          iconArrowUp,
                          color: MyColor.white,
                          size: 16,
                        )
                      ],
                    ))
                    : CustomText(
                  value,
                  maxLines: maxLines,
                  textAlign: textAlign ?? TextAlign.left,
                  overflow: maxLines != null ? TextOverflow.ellipsis : null,
                  style:
                  MyStyle.smallBody1Bold.copyWith(color: MyColor.white),
                ))),
      );
    }
  }

  static custom(
      {required Widget child,
        required IconData iconArrowUp,
        required IconData iconArrowDown,
      AlignmentGeometry? alignment,
      ColumnSize? size,
      double? fixedWidth,
      int ascending = -1,
      GestureTapCallback? onSort}) {
    return DataColumn(
      // size: size ?? ColumnSize.M,
      // fixedWidth: fixedWidth,
      label: Align(
          alignment: alignment ?? Alignment.centerLeft,
          child: Container(
              width: fixedWidth ?? 100,
              child: onSort != null
                  ? CustomInkWell(
                      onTap: onSort,
                      child: Row(
                        children: [
                          Flexible(child: child),
                          ascending == -1 || ascending != 1
                              ? Icon(
                                  iconArrowDown,
                                  color: MyColor.white,
                                  size: 16,
                                )
                              : Icon(
                                  iconArrowUp,
                                  color: MyColor.white,
                                  size: 16,
                                )
                        ],
                      ))
                  : child)),
    );
  }

  static shimmer() {
    return DataColumn2(
      label: ShimmerWidget.rectangular(height: 12),
    );
  }
}
