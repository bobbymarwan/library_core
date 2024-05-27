import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:library_core/styles/my_color.dart';
import 'package:library_core/styles/my_style.dart';
import 'package:library_core/widget/custom_text.dart';

class ItemDropdown extends StatelessWidget {
  final String? value;
  final bool selected;
  final Widget? child;

  const ItemDropdown({super.key, this.value, this.selected = false})
  : child = null;

  const ItemDropdown.custom({super.key,this.child, required this.selected})
      : value = null;

  @override
  Widget build(BuildContext context) {
    if(value != null) {
      return ListTile(
        title: CustomText(value ?? "", style: MyStyle.body2Regular.copyWith(
            color: selected ? MyColor.primary : MyColor.primary),),
        trailing: selected ? Icon(Icons.check, color: MyColor.primary) : null,
      );
    } else {
      return ListTile(
        title: child,
        trailing: selected ? Icon(Icons.check, color: MyColor.primary) : null,
      );
    }
  }

}