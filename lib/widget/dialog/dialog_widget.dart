import 'package:library_core/misc/constant.dart';
import 'package:library_core/widget/buttons/button_primary.dart';
import 'package:library_core/widget/buttons/button_secondary.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootstrap5/flutter_bootstrap5.dart';
import 'package:get/get.dart';
import 'package:library_core/styles/my_color.dart';
import 'package:library_core/styles/my_style.dart';
import 'package:library_core/widget/custom_text.dart';

class DialogWidget {
  static Future<dynamic> custom({
    String? title,
    double? width,
    double? height,
    double? borderRadius,
    bool showClose = true,
    required Widget body,
  }) {
    return showDialog(context: Get.context!,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            insetPadding:  EdgeInsets.all(kPadding16),
            content: SingleChildScrollView(
                child: Container(
                    padding:  const EdgeInsets.all(kPadding25),
                    decoration: BoxDecoration(
                        color: MyColor.white,
                        borderRadius: BorderRadius.circular(
                            borderRadius ?? 10.0)
                    ),
                    width: width ?? 400,
                    child: body
                )
            ),
          );
        }
    );
  }

  static Future<dynamic> confirmation({
    String? title,
    String? message,
    double? width,
    double? height,
    double? borderRadius,
    String? textBtnNo,
    String? textBtnYes,
    GestureTapCallback? onTapNo,
    GestureTapCallback? onTapYes
  }) {
    return showDialog(context: Get.context!,
        builder: (BuildContext context) {
          return AlertDialog(
            insetPadding: const EdgeInsets.all(kPadding16),
            contentPadding: const EdgeInsets.all(kPadding25),
            backgroundColor: Color(0xFFFAFAFA),
            elevation: 0.4,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0.0)),
            content: SizedBox(
              width: width ?? 390,
              height: 175,
              child: Column(
                children: [
                  FB5Row(
                    classNames: 'mb-4 gy-2',
                    children: [
                      if(title != null) FB5Col(
                          classNames: 'col-12',
                          child: CustomText(title,
                              style: MyStyle.body1Bold.copyWith(
                                  fontWeight: FontWeight.w800))
                      ),
                      if(message != null) FB5Col(
                          classNames: 'col-12',
                          child: CustomText(message,
                              margin: EdgeInsets.only(bottom: kPadding30),
                              style: MyStyle.body2Regular)
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: FB5Row(
                      classNames: 'justify-content-end gx-3',
                      children: [
                        if(onTapNo != null) FB5Col(
                          classNames: 'col-3',
                          child: ButtonSecondary.medium(text: textBtnNo ?? 'No',
                              isExpand: true,
                              onPressed: onTapNo
                          ),
                        ),
                        if(onTapYes != null) FB5Col(
                          classNames: 'col-3',
                          child: ButtonPrimary.medium(text: textBtnYes ?? 'Yes',
                              isExpand: true,
                              onPressed: onTapYes
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        }
    );
  }

  static Future<dynamic> confirmRemove({
    double? width,
    double? height,
    double? borderRadius,
    String? textBtnNo,
    String? textBtnYes,
    GestureTapCallback? onTapNo,
    GestureTapCallback? onTapYes
  }) {
    return confirmation(
        title: 'Hapus Data?',
        message: 'Data yang dihapus tidak dapat dipulihkan',
        onTapNo: onTapNo,
        onTapYes: onTapYes
    );
  }

  static Future<dynamic> infoRemove({
    double? width,
    double? height,
    double? borderRadius,
    String? textBtnYes,
    GestureTapCallback? onTapYes
  }) {
    return confirmation(
        title: 'Data Diubah',
        message: 'Data berhasil Diubah',
        textBtnYes: 'OK',
        onTapYes: onTapYes ?? () {
          Get.back();
        }
    );
  }
  static Future<dynamic> info({
    double? width,
    double? height,
    double? borderRadius,
    String? textBtnYes,
    String? title,
    String? message,
    GestureTapCallback? onTapYes
  }){
    return confirmation(
        title: title,
        message: message,
        textBtnYes: 'OK',
        onTapYes: onTapYes ?? (){
          Get.back();
        }
    );
  }
}