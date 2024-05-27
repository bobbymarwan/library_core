import 'package:library_core/widget/custom_expansion_tile.dart';
import 'package:library_core/widget/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:library_core/styles/my_color.dart';
import 'package:library_core/styles/my_style.dart';
import 'package:library_core/misc/constant.dart';
import 'package:flutter_bootstrap5/flutter_bootstrap5.dart';

class SectionMenuWidget extends StatelessWidget {
  final String title;
  final List<Widget>? items;
  final String? className;

  SectionMenuWidget({super.key, required this.title, this.items, this.className});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin(context, className ?? ''),
      child: CustomExpansionTile(
        isDividerTitle: true,
        dividerColor: MyColor.secondary,
        iconColor: MyColor.secondary,
        title: CustomText(title, style: MyStyle.title2Bold),
        children: [
          FB5Grid(
              classNames: 'row-cols-2 row-cols-md-4 g-3 my-3',
              children: items ?? []

          )
        ],
      )
    );
  }

}