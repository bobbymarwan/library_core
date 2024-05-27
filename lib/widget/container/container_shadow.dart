import 'package:library_core/misc/constant.dart';
import 'package:library_core/widget/custom_ink_well.dart';
import 'package:flutter/cupertino.dart';
import 'package:library_core/styles/my_color.dart';

class ContainerShadow extends StatelessWidget {
  final Widget child;
  final Color? color;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final BoxBorder? border;
  final double? borderRadius;
  final List<BoxShadow> boxShadow;
  final BoxConstraints? constraints;
  final GestureTapCallback? onTap;

  ContainerShadow(
      {super.key,
      required this.child,
      this.color,
      this.width,
      this.height,
      this.padding,
      this.margin,
      this.border,
      this.borderRadius,
      this.boxShadow = const [
        BoxShadow(
          color: Color.fromRGBO(0, 0, 0, 0.1), // shadow color
          blurRadius: 4, // shadow radius
          offset: Offset(0, 4), // shadow offset
        )
      ],
      this.constraints,
      this.onTap});

  ContainerShadow.top(
      {super.key,
      required this.child,
      this.color,
      this.width,
      this.height,
      this.padding,
      this.margin,
      this.border,
      this.borderRadius,
      this.boxShadow = const [
        BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.04), // shadow color
            blurRadius: 24, // shadow radius
            offset: Offset(0, -16), // shadow offset
            blurStyle: BlurStyle.normal // set blur style
            )
      ],
      this.constraints,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return CustomInkWell(
        onTap: onTap,
        child: Container(
          width: width ?? double.infinity,
          height: height,
          padding: padding ??
              EdgeInsets.symmetric(
                  vertical: kPadding16, horizontal: kPadding16),
          margin: margin,
          decoration: BoxDecoration(
              color: color ?? MyColor.white,
              border: border,
              borderRadius: BorderRadius.circular(borderRadius ?? 8),
              boxShadow: boxShadow),
          constraints: constraints,
          child: child,
        ));
  }
}
