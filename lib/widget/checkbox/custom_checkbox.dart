import 'package:library_core/widget/custom_ink_well.dart';
import 'package:flutter/material.dart';
import 'package:library_core/styles/my_color.dart';

class CustomCheckBox extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final Color? checkedIconColor;
  final Color? checkedFillColor;
  final IconData checkedIcon;
  final Color uncheckedIconColor;
  final Color uncheckedFillColor;
  final IconData uncheckedIcon;
  final double? borderWidth;
  final double? checkBoxSize;
  final bool shouldShowBorder;
  final Color? borderColor;
  final double? borderRadius;
  final double? splashRadius;
  final Color? splashColor;
  final String? tooltip;
  final MouseCursor? mouseCursors;
  final EdgeInsetsGeometry? margin;

  const CustomCheckBox({
    Key? key,
    required this.value,
    required this.onChanged,
    this.checkedIconColor,
    this.checkedFillColor,
    this.checkedIcon = Icons.check,
    this.uncheckedIconColor = Colors.white,
    this.uncheckedFillColor = Colors.white,
    this.uncheckedIcon = Icons.close,
    this.borderWidth,
    this.checkBoxSize,
    this.shouldShowBorder = false,
    this.borderColor,
    this.borderRadius,
    this.splashRadius,
    this.splashColor,
    this.tooltip,
    this.mouseCursors,
    this.margin
  }) : super(key: key);

  @override
  _CustomCheckBoxState createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  late bool _checked;
  late CheckStatus _status;

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  void didUpdateWidget(CustomCheckBox oldWidget) {
    super.didUpdateWidget(oldWidget);
    _init();
  }

  void _init() {
    _checked = widget.value;
    if (_checked) {
      _status = CheckStatus.checked;
    } else {
      _status = CheckStatus.unchecked;
    }
  }

  Widget _buildIcon() {
    late Color fillColor;
    late Color iconColor;
    late IconData iconData;

    switch (_status) {
      case CheckStatus.checked:
        fillColor = widget.checkedFillColor ?? MyColor.primary;
        iconColor = widget.checkedIconColor ?? MyColor.white;
        iconData = widget.checkedIcon;
        break;
      case CheckStatus.unchecked:
        fillColor = widget.uncheckedFillColor;
        iconColor = widget.uncheckedIconColor;
        iconData = widget.uncheckedIcon;
        break;
    }

    return Container(
      padding: EdgeInsets.zero,
      margin: widget.margin,
      decoration: BoxDecoration(
        color: fillColor,
        borderRadius: BorderRadius.all(Radius.circular(widget.borderRadius ?? 4)),
        border: Border.all(
          color: widget.shouldShowBorder ? (widget.borderColor ?? MyColor.grey5) : (!widget.value ? (widget.borderColor ?? MyColor.grey5) : Colors.transparent),
          width: widget.shouldShowBorder ? widget.borderWidth ?? 2.0 : 1.0,
        ),
      ),
      child: Icon(
        iconData,
        color: iconColor,
        size: widget.checkBoxSize ?? 16,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomInkWell(
      onTap: () => widget.onChanged(!_checked),
      mouseCursor: widget.mouseCursors ?? SystemMouseCursors.click,
      child: _buildIcon(),
    );
  }
}

enum CheckStatus {
  checked,
  unchecked,
}