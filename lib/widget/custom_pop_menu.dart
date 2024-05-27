import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:library_core/styles/my_color.dart';

class CustomPopMenu<T> extends StatelessWidget {
  final Widget? icon;
  final EdgeInsetsGeometry? padding;
  final BoxConstraints? constraints;
  final Offset? offset;
  final PopupMenuItemBuilder<T> itemBuilder;
  final PopupMenuItemSelected<T>? onSelected;
  final PopupMenuCanceled? onCanceled;
  final double? radius;
  final bool enabled;
  final MainAxisAlignment? mainAxisAlignment;

  const CustomPopMenu({super.key, this.enabled = true, this.icon, this.padding, this.constraints, this.offset, required this.itemBuilder, this.onSelected, this.onCanceled, this.radius, this.mainAxisAlignment});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        hoverColor: Colors.transparent,
        focusColor: Colors.transparent,
        cardColor: MyColor.white,
      ),
      child: Row(
        mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
        children: [
          PopupMenuButton<T>(
            // icon: icon,
              enabled: enabled,
              tooltip: '',
              onSelected: onSelected,
              onCanceled: onCanceled,
              offset: offset ?? Offset(0, 35),
              padding: padding ?? EdgeInsets.all(8.0),
              constraints: constraints,
              surfaceTintColor: Colors.transparent,
              color: MyColor.white,
              child: icon,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular( radius ?? 6.0))
              ),
              itemBuilder: itemBuilder)
        ],
      )
    );
  }
}