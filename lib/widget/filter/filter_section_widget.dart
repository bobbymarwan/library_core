import 'package:library_core/widget/container/container_outline.dart';
import 'package:library_core/widget/custom_expansion_tile.dart';
import 'package:library_core/widget/custom_text.dart';
import 'package:library_core/widget/custom_text_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:library_core/styles/my_color.dart';
import 'package:library_core/styles/my_style.dart';
import 'package:library_core/misc/constant.dart';

class FilterSectionWidget extends StatelessWidget {
  final String title;
  final Widget child;
  final EdgeInsetsGeometry? margin;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final bool initiallyExpanded;
  FilterSectionWidget({super.key, this.initiallyExpanded = false, required this.title, required this.child, this.margin, this.onChanged, this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: CustomExpansionTile(
        initiallyExpanded: initiallyExpanded,
        isDividerBottom: true,
        padding: EdgeInsets.symmetric(vertical: kPadding16),
        childrenPadding: EdgeInsets.only(bottom: kPadding16),
        title: CustomText(title, style: MyStyle.body2Bold,),
        children: [
          ContainerOutlineWidget(
              padding: EdgeInsets.symmetric(vertical: kPadding10, horizontal: kPadding10),
              constraints: BoxConstraints(
                  minHeight: 100,
                  maxHeight: 320
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomTextField.search(
                    margin: EdgeInsets.only(bottom: kPadding14),
                    controller: controller,
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: MyColor.grey5),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: MyColor.grey5),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: MyColor.grey5),
                    ),
                    onChanged: onChanged
                  ),
                  Flexible(child: child)
                ],
              ))
        ],
      )
    );
  }

}