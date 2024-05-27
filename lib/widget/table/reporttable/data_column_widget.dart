import 'package:library_core/widget/divider_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:library_core/styles/my_color.dart';
import 'package:library_core/styles/my_style.dart';
import 'package:library_core/misc/constant.dart';

class DataColumnWidget extends StatelessWidget {
  final List<Widget> columns;
  final EdgeInsetsGeometry? padding;
  final CrossAxisAlignment? crossAxisAlignment;
  final CrossAxisAlignment? itemCrossAxisAlignment;

  DataColumnWidget({super.key, required this.columns, this.padding, this.crossAxisAlignment, this.itemCrossAxisAlignment});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
      children: [
        Container(
            padding: padding ?? EdgeInsets.symmetric(vertical: kPadding12),
            child: Row(
                crossAxisAlignment:itemCrossAxisAlignment ?? CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min, children: columns)),
        DividerWidget.horizontal()
      ],
    );
  }
}
