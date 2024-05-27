import 'package:library_core/widget/buttons/button_primary.dart';
import 'package:library_core/widget/container/container_shadow.dart';
import 'package:library_core/widget/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:library_core/styles/my_color.dart';
import 'package:library_core/styles/my_style.dart';
import 'package:library_core/misc/constant.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ItemManagementWidget extends StatelessWidget {
  final String title;
  final String? description;
  final IconData? iconData;
  final String? iconAsset;
  final Color? iconColor;
  final Color? backgroundColor;
  final String? btnText;
  final GestureTapCallback? onPressed;

  const ItemManagementWidget({super.key,
  required this.title,
  this.description,
  this.iconData,
  this.iconAsset,
  this.iconColor,
  this.backgroundColor,
  this.btnText,
  this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ContainerShadow(
      padding: EdgeInsets.all(kPadding16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _iconWidget,
                _titleWidget,
                _descriptionWidget
              ],
            )),
            _btnWidget
          ],
        )
    );
  }
  
  Widget get _iconWidget => Container(
    padding: EdgeInsets.all(kPadding14),
    margin: EdgeInsets.only(bottom: kPadding14),
    decoration: BoxDecoration(
      color: backgroundColor ?? MyColor.secondary.withOpacity(0.25),
      borderRadius: BorderRadius.circular(8)
    ),
    child: iconData != null ? Icon(iconData, color: iconColor ?? MyColor.primary, size: 40)
    : SvgPicture.asset(iconAsset ?? '', width: 40, height: 40,),
  );

  Widget get _titleWidget => CustomText(title,
    margin: EdgeInsets.only(bottom: kPadding4),
    style: MyStyle.subTitleBold,
  );

  Widget get _descriptionWidget => CustomText(description ?? '',
      margin: EdgeInsets.only(bottom: kPadding14),
      style: MyStyle.body2Regular);

  Widget get _btnWidget => ButtonPrimary.medium(
      width: 100,
      text: btnText ?? 'Lihat Data',
      onPressed: onPressed);
  
}