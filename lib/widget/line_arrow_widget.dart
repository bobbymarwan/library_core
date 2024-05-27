import 'package:library_core/misc/helper.dart';
import 'package:library_core/widget/custom_text.dart';
import 'package:library_core/widget/divider_widget.dart';
import 'package:flutter/material.dart';
import 'package:library_core/styles/my_color.dart';
import 'package:library_core/styles/my_style.dart';
import 'package:library_core/misc/constant.dart';

class LineArrowWidget extends StatelessWidget {
  final String? label;
  Color? color;
  final double? height;
  final double? width;
  final double? valueYNow;
  int arrow;

  LineArrowWidget({super.key, this.label, this.color, this.height, this.width, this.arrow = -1, this.valueYNow}){
    if(label != null){
      if(label!.contains('+')){
        color = MyColor.green;
        arrow = 0;
      } else if(label!.contains('-')){
        color = MyColor.red;
        arrow = 1;
      } else {
        color = MyColor.grey5;
        arrow = -1;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: height ??  10,
        minWidth: width ?? 0.0
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          if(label != null) CustomText(label ?? '',
              // margin: EdgeInsets.only(bottom: kPadding4),
              style: MyStyle.smallBody2Bold.copyWith(color: color)),
          if(height != null && height! >= 8)Container(
            constraints: BoxConstraints(
                minHeight: height ?? 0.0,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                arrow == 0 ? ClipPath(
                  clipper: TriangleClipper(isArrowUp: true),
                  child: Container(
                    color: color ?? MyColor.grey5,
                    height: 8,
                    width: 10,
                  ),
                ) : DividerWidget.horizontal(width: 7, color: color ?? MyColor.grey5),
                Flexible(child: Container(
                  width: 1,
                  height: height ?? 0.0,
                  color: color ?? MyColor.grey5,
                )),
                arrow == 1 ? ClipPath(
                  clipper: TriangleClipper(),
                  child: Container(
                    color: color ?? MyColor.grey5,
                    height: 8,
                    width: 10,
                  ),
                ) : DividerWidget.horizontal(width: 7, color: color ?? MyColor.grey5)
              ],
            ),
          ),
          if(valueYNow != null)
            CustomText(
              "${Helper.formatShortCurrency(valueYNow!)}",
              margin: const EdgeInsets.only(bottom: kPadding8),
            )
        ],
      )
    );
  }
}

class TriangleClipper extends CustomClipper<Path> {
  final bool isArrowUp;

  TriangleClipper({this.isArrowUp = false});

  @override
  Path getClip(Size size) {
    final path = Path();
    if(isArrowUp) {
      path.moveTo(size.width / 2, 0);
      path.lineTo(size.width, size.height);
      path.lineTo(0.0, size.height);
    } else {
      path.lineTo(size.width, 0.0);
      path.lineTo(size.width / 2, size.height);
    }
    path.close();
    return path;
  }

  @override
  bool shouldReclip(TriangleClipper oldClipper) => false;
}