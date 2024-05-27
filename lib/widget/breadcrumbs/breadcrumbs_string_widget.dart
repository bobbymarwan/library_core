import 'package:library_core/widget/custom_ink_well.dart';
import 'package:library_core/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_core/misc/constant.dart';
import 'package:library_core/styles/my_color.dart';
import 'package:library_core/styles/my_style.dart';

class BreadcrumbsStringWidget extends StatelessWidget {
  final List<String> values;
  final double spacing;
  final double? runSpacing;
  final EdgeInsetsGeometry? margin;
  final Widget? separator;
  final Color? textColor;
  final Color? textLastColor;
  final TextStyle? style;
  final TextStyle? lastStyle;
  final Function(int)? onTapCallback;

  BreadcrumbsStringWidget({Key? key, required this.values, this.spacing = 2, this.runSpacing, this.margin, this.separator, this.textColor, this.textLastColor, this.style, this.lastStyle, this.onTapCallback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Wrap(
        spacing: spacing,
        runSpacing: runSpacing ?? 0.0,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: generateChildren(),
      )
    );
  }

  List<Widget> generateChildren(){
    var style = this.style ?? MyStyle.smallBody1Regular.copyWith(color: textColor ?? MyColor.blue[500]);
    var styleInactive = lastStyle ?? MyStyle.smallBody1Bold.copyWith(color: textColor ?? MyColor.blue[500]);

    List<Widget> widgets = [];
    if(values.isNotEmpty){
      for(var i = 0; i < values.length; i++){
        var child = values[i];
        if(i == 0 && child.isNotEmpty){
          widgets.add(CustomInkWell(
            onTap: onTapCallback != null ? (){
              onTapCallback!(0);
            } : null,
            child: CustomText(values[0], style: style)
          ));
        } else {
          if(i == values.length-1 && values[i].isNotEmpty){
            widgets.add(Wrap(
              spacing: spacing,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                _separatorWidget(),
                CustomText(values[i], style: styleInactive)
              ],
            ));
          } else {
            if(values[i].isNotEmpty){
              widgets.add(Wrap(
                spacing: spacing,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  _separatorWidget(),
                  CustomInkWell(
                      onTap: onTapCallback != null ? () {
                        onTapCallback!(i);
                      } : null,
                      child: CustomText(values[i], style: style)
                  )
                ],
              ));
            }
          }
        }
      }
    }
    return widgets;
  }

  Widget _separatorWidget(){
    return separator ?? Icon(Icons.keyboard_arrow_right,
        size: 16,
        color: textColor ?? MyColor.blue[300]);
  }
}