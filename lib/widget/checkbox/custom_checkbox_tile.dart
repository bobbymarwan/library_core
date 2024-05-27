import 'package:library_core/misc/constant.dart';
import 'package:library_core/widget/custom_ink_well.dart';
import 'package:flutter/material.dart';
import 'package:library_core/styles/my_style.dart';
import 'package:library_core/widget/custom_text.dart';
import 'custom_checkbox.dart';

class CustomCheckBoxTile extends StatefulWidget {
  final bool value;
  final bool enabled;
  final ValueChanged<bool> onChanged;
  final MouseCursor? mouseCursor;
  final Color? activeColor;
  final Color? checkColor;
  final String text;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? spacing;
  final MainAxisAlignment? mainAxisAlignment;

  const CustomCheckBoxTile({Key? key,
    required this.value,
    required this.onChanged,
    required this.text,
    this.enabled = true,
    this.mouseCursor,
    this.activeColor,
    this.checkColor,
    this.padding,
    this.margin,
    this.spacing,
    this.mainAxisAlignment
  }) : super(key: key);

  @override
  State<CustomCheckBoxTile> createState() => _CustomCheckBoxTileState();
}

class _CustomCheckBoxTileState extends State<CustomCheckBoxTile> {
  @override
  Widget build(BuildContext context) {
    return  CustomInkWell(
        onTap: () {
          if(widget.enabled) {
            _handleValueChange();
          }
        },
        child: Container(
          padding: widget.padding,
          margin: widget.margin,
          child: Row(
            mainAxisAlignment: widget.mainAxisAlignment ?? MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomCheckBox(value: widget.value, onChanged: widget.onChanged, ),
              SizedBox(width: widget.spacing ?? kPadding10),
              CustomText(widget.text, style: MyStyle.body2Regular, overflow: TextOverflow.ellipsis,)
            ],
          )
        )
    );
  }

  void _handleValueChange() {
    // assert(widget.onChanged);
    switch (widget.value) {
      case false:
        widget.onChanged(true);
        break;
      case true:
        widget.onChanged(false);
        break;
      default:
        widget.onChanged(false);
        break;
    }
  }
}