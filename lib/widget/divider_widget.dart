import 'package:flutter/material.dart';

class DividerWidget {
  static vertical({double? width, double? height, EdgeInsetsGeometry? margin, Color? color}){
    return Container(
      width: width ?? 1,
      height: height,
      margin: margin,
      color: color ?? Color(0xFFE3EBEF),
    );
  }

  static horizontal({double? width, double? height, EdgeInsetsGeometry? margin, Color? color}) {
    return Container(
      width: width,
      height: height ?? 1,
      margin: margin,
      color: color ?? Color(0xFFE3EBEF),
    );
  }
  static get none {
    return const SizedBox.shrink();
  }
}
