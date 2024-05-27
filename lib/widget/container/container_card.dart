
import 'package:flutter/material.dart';
import 'package:library_core/styles/my_color.dart';

class ContainerCardWidget extends StatelessWidget {
  final Widget child;
  final Color? color;
  final Color? borderColor;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final BoxBorder? border;
  final double? borderRadius;
  final BoxConstraints? constraints;
  final Gradient? gradient;

  ContainerCardWidget({super.key,
  required this.child,
  this.color,
  this.borderColor,
  this.width,
  this.height,
  this.padding,
  this.margin,
  this.border,
  this.borderRadius,
  this.constraints,
  this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      height: height,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
          color: color ?? MyColor.white,
          borderRadius: BorderRadius.circular(borderRadius ?? 8),
        gradient: gradient
      ),
      constraints: constraints,
      child: child,
    );
  }

}