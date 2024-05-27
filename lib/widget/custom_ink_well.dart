import 'package:flutter/material.dart';

class CustomInkWell extends InkWell {
  CustomInkWell({Key? key,
    Widget? child,
    GestureTapCallback? onTap,
    GestureTapDownCallback? onTapDown,
    ValueChanged<bool>? onHover,
    Color? splashColor,
    MouseCursor? mouseCursor
  }) : super(
      key: key,
      hoverColor: Colors.transparent,
      splashColor: splashColor ?? Colors.transparent,
      onTap: onTap,
      onTapDown: onTapDown,
      borderRadius: BorderRadius.circular(100),
      child: child,
      onHover: onHover,
      mouseCursor: mouseCursor,
  );
}