import 'package:library_core/widget/custom_ink_well.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:library_core/styles/my_color.dart';
import 'package:library_core/styles/my_style.dart';
import 'package:library_core/misc/constant.dart';

class ItemActionWidget extends StatelessWidget {
  final bool loading;
  final GestureTapCallback? onTapView;
  final GestureTapCallback? onTapEdit;
  final GestureTapCallback? onTapDelete;

  const ItemActionWidget(
      {super.key,
      this.loading = false,
      this.onTapView,
      this.onTapEdit,
      this.onTapDelete});

  @override
  Widget build(BuildContext context) {
    return !loading ? Wrap(
      spacing: kPadding20,
      runSpacing: kPadding8,
      children: [
        if (onTapView != null)
          CustomInkWell(
            key: ValueKey('view'),
            onTap: onTapView,
            child: Icon(
              Icons.remove_red_eye_outlined,
              color: MyColor.primary,
              size: 18,
            ),
          ),
        if (onTapEdit != null)
          CustomInkWell(
            key: ValueKey('edit'),
            onTap: onTapEdit,
            child: Icon(
              Icons.edit_outlined,
              color: MyColor.primary,
              size: 18,
            ),
          ),
      ],
    ) : Container();
  }
}
