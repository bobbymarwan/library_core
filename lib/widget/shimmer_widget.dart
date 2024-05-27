import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  final double width;
  final double height;
  final ShapeBorder shapeBorder;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final double? radius;
  final BorderRadiusGeometry? borderRadius;

  ShimmerWidget.rectangular({
    this.width = 200,
    required this.height,
    this.margin,
    this.padding,
    this.radius,
    this.borderRadius
  }) : this.shapeBorder = RoundedRectangleBorder(
    borderRadius: borderRadius ?? BorderRadius.circular(radius ?? 100)
  );

  ShimmerWidget.circular({
    required this.width ,
    required this.height,
    this.margin,
    this.padding,
    this.radius,
    this.shapeBorder = const CircleBorder(), this.borderRadius
  });

  @override
  Widget build(BuildContext context) => Shimmer.fromColors(
      baseColor: Colors.grey[200]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
          width: width,
          height: height,
          margin: margin,
          padding: padding,
          decoration: ShapeDecoration(
              color: Colors.grey[200]!,
              shape: shapeBorder
          )
      )
  );
}