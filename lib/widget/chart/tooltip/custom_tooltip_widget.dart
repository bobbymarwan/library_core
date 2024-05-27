import 'package:library_core/misc/constant.dart';
import 'package:library_core/styles/my_color.dart';
import 'package:library_core/styles/my_style.dart';
import 'package:library_core/widget/custom_text.dart';
import 'package:flutter/material.dart';

class CustomTooltipWidget extends StatelessWidget {
  final String? title;
  final List<Widget> children;
  final double? height;

  const CustomTooltipWidget({super.key, this.height, this.title, required this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 120,
      padding: EdgeInsets.symmetric(vertical: kPadding4, horizontal: kPadding8),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: FractionalOffset.topCenter,
              end: FractionalOffset.bottomCenter,
              tileMode: TileMode.decal,
              colors: [
                Color(0xFFFDFEFF).withOpacity(0.6),
                Color(0xFFF4F7FC).withOpacity(0.6),
                Color(0xFFFFFFFF).withOpacity(1.0),
                Color(0xFFFFFFFF).withOpacity(0.0),
              ]),
          borderRadius: BorderRadius.circular(7.0),
          border: Border.all(width: 0.57, color: MyColor.white)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _titleTooltip,
          Column(
            children: children,
          )
        ],
      ),
    );
  }

  get _titleTooltip{
    return title != null ? CustomText(title!.replaceAll("\n", " "), margin: EdgeInsets.only(bottom: 6), style: MyStyle.body2Bold) : Container();
  }
}
