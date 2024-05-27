import 'package:library_core/misc/constant.dart';
import 'package:library_core/styles/my_color.dart';
import 'package:library_core/styles/my_style.dart';
import 'package:library_core/widget/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';

class CustomAlertSolid {

  static _snackBar({
    double? maxWidth,
    String? title,
    String? message,
    Color? titleColor,
    Color? messageColor,
    Color? borderColor,
    Color? backgroundColor,
    Color? iconColor,
    IconData? iconData,
  }) {
    if(!Get.isSnackbarOpen){
      Get.snackbar(
        '',
        '',
        snackPosition: SnackPosition.TOP,
        snackStyle: SnackStyle.FLOATING,
        maxWidth: maxWidth ?? 760,
        margin: EdgeInsets.all(kPadding20),
        padding: const EdgeInsets.all(kPadding16),
        borderRadius: 8,
        borderWidth: 1,
        borderColor: borderColor ?? MyColor.accent,
        backgroundColor: backgroundColor ?? MyColor.accent,
        duration: Duration(seconds: 2),
        boxShadows: [
          BoxShadow(
            color: Color(0xFF000000).withOpacity(0.12),
            offset: Offset(0, 16),
            blurRadius: 32.0,
            spreadRadius: -8
          ),

        ],
        icon: Icon(iconData, color: iconColor ?? MyColor.primary, size: 20,),
        titleText: CustomText('$title', style: MyStyle.body2Bold
            .copyWith(color: titleColor ?? MyColor.blue[800])),
        messageText: CustomText('$message', style: MyStyle.smallBody1Regular
            .copyWith(color: messageColor ?? MyColor.blue[900])),
      );
    }
  }

  static success({String? title, String? message, double? maxWidth}) {
    _snackBar(
        maxWidth: maxWidth,
        title: title ?? 'Berhasil',
        message: message,
        borderColor: MyColor.green[0],
        backgroundColor: MyColor.green[0],
        titleColor: MyColor.green[800],
        messageColor: MyColor.green[900],
      iconColor: MyColor.green[800],
      iconData: Icons.check_circle,
    );
  }

  static error({String? title, String? message, double? maxWidth}) {
    _snackBar(
        maxWidth: maxWidth,
        title: title ?? 'Gagal',
        message: message,
        borderColor: MyColor.red[0],
        backgroundColor: MyColor.red[0],
        titleColor: MyColor.red[700],
        messageColor: MyColor.red[900],
      iconColor: MyColor.red[700],
        iconData: Icons.error_outline,
        );
  }

  // static warning({required String title, String? message, double? maxWidth}) {
  //   _snackBar(
  //       maxWidth: maxWidth,
  //       title: title,
  //       message: message,
  //       borderColor: MyColor.pgnYellow,
  //       backgroundColor: MyColor.pgnYellowLight,
  //       iconData: Icons.error_outline,
  //       iconColor: MyColor.pgnYellow);
  // }

  static info({required String title, String? message, double? maxWidth}) {
    _snackBar(
        maxWidth: maxWidth,
        title: title,
        message: message,
      borderColor: MyColor.blue[0],
      backgroundColor: MyColor.blue[0],
      titleColor: MyColor.blue[800],
      messageColor: MyColor.blue[900],
      iconColor: MyColor.blue[800],
    iconData: Icons.error);
  }
}
