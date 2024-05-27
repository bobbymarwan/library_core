import 'package:library_core/misc/constant.dart';
import 'package:library_core/widget/checkbox/custom_checkbox_tile.dart';
import 'package:library_core/widget/custom_ink_well.dart';
import 'package:flutter/cupertino.dart';
import 'package:library_core/styles/my_color.dart';
import 'package:library_core/styles/my_style.dart';
import 'package:library_core/widget/custom_text.dart';

class CheckboxSelectAll extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final GestureTapCallback? onTapDelete;
  final bool isLoading;
  const CheckboxSelectAll({super.key, required this.value, required this.onChanged, required this.isLoading, this.onTapDelete});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomCheckBoxTile(
            margin: EdgeInsets.only(left: kPadding25),
            text: 'Select All', value: value, onChanged: onChanged),
        if(onTapDelete != null) CustomInkWell(
          onTap: onTapDelete,
          child: CustomText(isLoading ? 'Loading..': 'Delete', margin: EdgeInsets.only(left: kPadding10), style: MyStyle.body2Bold.copyWith(color: MyColor.red))
        )
      ],
    );
  }

}