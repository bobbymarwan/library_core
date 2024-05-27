import 'package:library_core/widget/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:library_core/styles/my_style.dart';
import 'package:library_core/misc/constant.dart';

class EmptyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomText('Data tidak tersedia',
        padding: EdgeInsets.symmetric(vertical: kPadding20),
        style: MyStyle.body2Regular);
  }

}