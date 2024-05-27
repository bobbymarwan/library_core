import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bootstrap5/flutter_bootstrap5.dart';
import 'package:library_core/styles/my_color.dart';
import 'package:library_core/styles/my_style.dart';
import 'package:library_core/misc/constant.dart';

import 'custom_ink_well.dart';
import 'custom_text.dart';

class CustomTextField {
  static Widget outline({
    TextEditingController? controller,
    bool loading = false,
    String? hintText,
    String? errorText,
    String? initialValue,
    FocusNode? focusNode,
    TextInputType? keyboardType,
    TextCapitalization textCapitalization = TextCapitalization.none,
    TextInputAction? textInputAction,
    bool autoFocus = false,
    bool readOnly = false,
    bool? showCursor,
    bool obscureText = false,
    bool enabled = true,
    int? maxLines,
    int? maxLength,
    TextStyle? style,
    TextStyle? hintStyle,
    TextAlign? textAlign,
    VoidCallback? onEditingComplete,
    ValueChanged<String>? onFieldSubmitted,
    List<TextInputFormatter>? inputFormatters,
    Function(String value)? onChanged,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    IconData? prefixIcon,
    Color? colorPrefixIcon,
    double? sizePrefixIcon,
    IconData? suffixIcon,
    Color? colorSuffixIcon,
    double? sizeSuffixIcon,
    Color? fillColor,
    String? counterText,
    FormFieldSetter<String>? onSaved,
    FormFieldValidator<String>? validator,
    GestureTapCallback? onTapPrefix,
    GestureTapCallback? onTapSuffix,
    GestureTapCallback? onTap,
  }) {
    return Container(
      margin: margin,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            controller: controller,
            initialValue: initialValue,
            maxLines: maxLines,
            maxLength: maxLength,
            inputFormatters: inputFormatters,
            obscureText: obscureText,
            keyboardType: keyboardType,
            enabled: !loading ? enabled : false, // ketika loading jadi false
            autofocus: autoFocus,
            readOnly: readOnly,
            showCursor: showCursor,
            focusNode: focusNode,
            textAlign: textAlign ?? TextAlign.start,
            textInputAction: textInputAction,
            textCapitalization: textCapitalization,
            onChanged: onChanged,
            onEditingComplete: onEditingComplete,
            onFieldSubmitted: onFieldSubmitted,
            style: style ?? MyStyle.body2Regular.copyWith(color: MyColor.dark),
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              counterText: counterText,
                isDense: true,
                contentPadding: padding ??
                    const EdgeInsets.symmetric(vertical: kPadding12, horizontal: kPadding10),
                hintText: hintText,
                hintStyle: hintStyle ?? MyStyle.body2Regular.copyWith(
                    color: MyColor.grey5
                ),
                prefixIcon: prefixIcon != null ? CustomInkWell(
                    onTap: onTapPrefix,
                    child: Icon(prefixIcon, size: sizePrefixIcon ?? 20, color: colorPrefixIcon ?? MyColor.dark,)
                ) : null,
                suffixIcon: !loading ? (suffixIcon != null ? CustomInkWell(
                    onTap: onTapSuffix,
                    child: Icon(suffixIcon, size: sizeSuffixIcon ?? 20, color: colorSuffixIcon ?? MyColor.dark,)
                ) : null) : SizedBox(width: 20, child: CircularProgressIndicator(strokeWidth: 2,)),
                border: OutlineInputBorder(borderSide: BorderSide(color: MyColor.grey4), borderRadius: BorderRadius.circular(5)),
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: MyColor.grey4), borderRadius: BorderRadius.circular(5)),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: MyColor.grey4), borderRadius: BorderRadius.circular(5)),
                errorText: null,
                hoverColor: Colors.transparent,
                fillColor: fillColor ?? Colors.white,
                filled: true),
            validator: validator,
            onSaved: onSaved,
          ),
          if(errorText != null && errorText.isNotEmpty) Container(
              padding: const EdgeInsets.only(top: 8.0),
              // height: errorContainerHeight,
              child: CustomText(errorText, style: MyStyle.smallBody1Regular.copyWith(
                  color: MyColor.red
              ))),
        ],
      ),
    );
  }

  static Widget search({
    TextEditingController? controller,
    String? hintText,
    String? errorText,
    String? initialValue,
    FocusNode? focusNode,
    TextInputType? keyboardType,
    TextCapitalization textCapitalization = TextCapitalization.none,
    TextInputAction? textInputAction,
    bool autoFocus = false,
    bool readOnly = false,
    bool? showCursor,
    bool obscureText = false,
    bool enabled = true,
    int? maxLines,
    int? maxLength,
    TextStyle? style,
    TextStyle? hintStyle,
    TextAlign? textAlign,
    VoidCallback? onEditingComplete,
    ValueChanged<String>? onFieldSubmitted,
    List<TextInputFormatter>? inputFormatters,
    Function(String value)? onChanged,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    Color? colorPrefixIcon,
    double? sizePrefixIcon,
    IconData? suffixIcon,
    Color? colorSuffixIcon,
    double? sizeSuffixIcon,
    Color? fillColor,
    String? counterText,
    FormFieldSetter<String>? onSaved,
    FormFieldValidator<String>? validator,
    InputBorder? border,
    InputBorder? enabledBorder,
    InputBorder? focusedBorder,
    GestureTapCallback? onTapPrefix,
    GestureTapCallback? onTapSuffix,
    GestureTapCallback? onTap,
  }) {
    return Container(
      margin: margin,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            controller: controller,
            initialValue: initialValue,
            maxLines: maxLines ?? 1,
            maxLength: maxLength,
            inputFormatters: inputFormatters,
            obscureText: obscureText,
            keyboardType: keyboardType,
            enabled: enabled,
            autofocus: autoFocus,
            readOnly: readOnly,
            showCursor: showCursor,
            focusNode: focusNode,
            textAlign: textAlign ?? TextAlign.start,
            textInputAction: textInputAction,
            textCapitalization: textCapitalization,
            onChanged: onChanged,
            onEditingComplete: onEditingComplete,
            onFieldSubmitted: onFieldSubmitted,
            style: style ?? MyStyle.body2Regular.copyWith(color: MyColor.dark),
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
                counterText: counterText,
                isDense: true,
                contentPadding: padding ??
                    const EdgeInsets.symmetric(vertical: kPadding12, horizontal: kPadding10),
                hintText: hintText ?? 'Search',
                hintStyle: hintStyle ?? MyStyle.body2Regular.copyWith(
                    color: MyColor.grey5
                ),
                prefixIcon:CustomInkWell(
                    onTap: onTapPrefix,
                    child: Icon(Icons.search, size: sizePrefixIcon ?? 20, color: colorPrefixIcon ?? MyColor.grey4,)
                ),
                suffixIcon: suffixIcon != null ? CustomInkWell(
                    onTap: onTapSuffix,
                    child: Icon(suffixIcon, size: sizeSuffixIcon ?? 20, color: colorSuffixIcon ?? MyColor.dark,)
                ) : null ,
                border: border ?? OutlineInputBorder(borderSide: BorderSide(color: MyColor.grey4), borderRadius: BorderRadius.circular(5)),
                enabledBorder: enabledBorder ?? OutlineInputBorder(borderSide: BorderSide(color: MyColor.grey4), borderRadius: BorderRadius.circular(5)),
                focusedBorder: focusedBorder ?? OutlineInputBorder(borderSide: BorderSide(color: MyColor.grey4), borderRadius: BorderRadius.circular(5)),
                errorText: null,
                hoverColor: Colors.transparent,
                fillColor: fillColor ?? Colors.white,
                filled: true),
            validator: validator,
            onSaved: onSaved,
          ),
        ],
      ),
    );
  }

  static Widget outlineLabelVertical({
    required String label,
    bool isMandatory = false,
    TextEditingController? controller,
    bool loading = false,
    String? hintText,
    String? errorText,
    String? initialValue,
    FocusNode? focusNode,
    TextInputType? keyboardType,
    TextCapitalization textCapitalization = TextCapitalization.none,
    TextInputAction? textInputAction,
    bool autoFocus = false,
    bool readOnly = false,
    bool? showCursor,
    bool obscureText = false,
    bool enabled = true,
    int? maxLines,
    int? maxLength,
    TextStyle? style,
    TextStyle? hintStyle,
    TextAlign? textAlign,
    VoidCallback? onEditingComplete,
    ValueChanged<String>? onFieldSubmitted,
    List<TextInputFormatter>? inputFormatters,
    Function(String value)? onChanged,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    IconData? prefixIcon,
    Color? colorPrefixIcon,
    double? sizePrefixIcon,
    IconData? suffixIcon,
    Widget? suffixWidget,
    Color? colorSuffixIcon,
    double? sizeSuffixIcon,
    Color? fillColor,
    String? counterText,
    FormFieldSetter<String>? onSaved,
    FormFieldValidator<String>? validator,
    GestureTapCallback? onTapPrefix,
    GestureTapCallback? onTapSuffix,
    GestureTapCallback? onTap,
  }) {
    return Container(
      margin: margin,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: kPadding8),
            child: RichText(
              text: TextSpan(
                text: label,
                style: MyStyle.body2Regular.copyWith(color: MyColor.dark),
                children: [
                  if(isMandatory)TextSpan(text: '*', style: MyStyle.body2Regular.copyWith(color: MyColor.dark),),
                ]
              ),
            )
          ),
          CustomInkWell(
            onTap: onTap,
            child: TextFormField(
              controller: controller,
              initialValue: initialValue,
              maxLines: maxLines,
              maxLength: maxLength,
              inputFormatters: inputFormatters,
              obscureText: obscureText,
              keyboardType: keyboardType,
              enabled: !loading ? enabled : false, //ketika loading jadi false
              autofocus: autoFocus,
              readOnly: readOnly,
              showCursor: showCursor,
              focusNode: focusNode,
              textAlign: textAlign ?? TextAlign.start,
              textInputAction: textInputAction,
              textCapitalization: textCapitalization,
              onChanged: onChanged,
              onEditingComplete: onEditingComplete,
              onFieldSubmitted: onFieldSubmitted,
              style: style ?? MyStyle.body2Regular.copyWith(color: MyColor.dark),
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                  counterText: counterText ?? '',
                  isDense: true,
                  contentPadding: padding ??
                      const EdgeInsets.symmetric(vertical: kPadding12, horizontal: kPadding10),
                  hintText: hintText,
                  hintStyle: hintStyle ?? MyStyle.body2Regular.copyWith(
                      color: MyColor.grey5
                  ),
                  prefixIcon: prefixIcon != null ? CustomInkWell(
                      onTap: onTapPrefix,
                      child: Icon(prefixIcon, size: sizePrefixIcon ?? 20, color: colorPrefixIcon ?? MyColor.dark,)
                  ) : null,
                  suffixIcon: suffixWidget != null ? IntrinsicWidth(
                    child: Container(
                        padding: EdgeInsets.only(right: kPadding10),
                        alignment: Alignment.centerRight,
                        child: suffixWidget)
                  ) : !loading? (suffixIcon != null ? CustomInkWell(
                      onTap: onTapSuffix,
                      child: Icon(suffixIcon, size: sizeSuffixIcon ?? 20, color: colorSuffixIcon ?? MyColor.dark,)
                  ) : null) : SizedBox(width: 20, child: CircularProgressIndicator(strokeWidth: 2,)),
                  border: OutlineInputBorder(borderSide: BorderSide(color: MyColor.grey4), borderRadius: BorderRadius.circular(5)),
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: MyColor.grey4), borderRadius: BorderRadius.circular(5)),
                  disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: MyColor.grey6), borderRadius: BorderRadius.circular(5)),
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: MyColor.grey4), borderRadius: BorderRadius.circular(5)),
                  errorText: null,
                  hoverColor: Colors.transparent,
                  fillColor: fillColor ?? (enabled ? Colors.white : MyColor.grey4),
                  filled: true),
              validator: validator,
              onSaved: onSaved,
            )
          ),
          if(errorText != null && errorText.isNotEmpty) Container(
              padding: const EdgeInsets.only(top: 8.0),
              // height: errorContainerHeight,
              child: CustomText(errorText, style: MyStyle.smallBody1Regular.copyWith(
                  color: MyColor.red
              ))),
        ],
      ),
    );
  }

  static Widget calendar({
    required String label,
    String? value,
    String? hintText,
    String? errorText,
    bool isMandatory = false,
    Color? fillColor,
    TextStyle? style,
    EdgeInsetsGeometry? margin,
    IconData? suffixIcon,
    Color? colorSuffixIcon,
    double? sizeSuffixIcon,
    GestureTapCallback? onTapSuffix,
    GestureTapCallback? onTap,
  }){
    return Container(
      margin: margin,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: kPadding8),
            child: RichText(
              text: TextSpan(
                  text: label,
                  style: MyStyle.body2Regular.copyWith(color: MyColor.dark),
                  children: [
                    if(isMandatory)TextSpan(text: '*', style: MyStyle.body2Regular.copyWith(color: MyColor.dark),),
                  ]
              ),
            ),
          ),
          CustomInkWell(
            onTap: onTap,
            child: Container(
              decoration: BoxDecoration(
                color: MyColor.white,
                border: Border.all(color: MyColor.grey4),
                borderRadius: BorderRadius.circular(5)
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(padding: EdgeInsets.symmetric(vertical: kPadding8, horizontal: kPadding10),
                    child: CustomText(value ?? (hintText ?? ''), style: style ?? MyStyle.body2Regular.copyWith(color: value != null ? MyColor.dark : MyColor.grey5)))
                  ),
                  CustomInkWell(
                    onTap: onTapSuffix,
                    child: Padding(
                        padding: EdgeInsets.symmetric(vertical: kPadding8, horizontal: kPadding10),
                      child: Icon(suffixIcon, size: sizeSuffixIcon ?? 20, color: colorSuffixIcon ?? MyColor.dark,)
                    ),
                  )
                ],
              ),
            ),
          ),
          if(errorText != null && errorText.isNotEmpty) Container(
              padding: const EdgeInsets.only(top: 8.0),
              // height: errorContainerHeight,
              child: CustomText(errorText, style: MyStyle.smallBody1Regular.copyWith(
                  color: MyColor.red
              ))),
        ],
      ),
    );
  }

  static Widget outlineLabelHorizontal({
    required String label,
    String? colLeft,
    String? colRight,
    TextEditingController? controller,
    bool loading = false,
    String? hintText,
    String? errorText,
    String? initialValue,
    FocusNode? focusNode,
    TextInputType? keyboardType,
    TextCapitalization textCapitalization = TextCapitalization.none,
    TextInputAction? textInputAction,
    bool autoFocus = false,
    bool readOnly = false,
    bool? showCursor,
    bool obscureText = false,
    bool enabled = true,
    int? maxLines,
    int? maxLength,
    String? labelAlign,
    TextStyle? style,
    TextStyle? hintStyle,
    TextAlign? textAlign,
    VoidCallback? onEditingComplete,
    ValueChanged<String>? onFieldSubmitted,
    List<TextInputFormatter>? inputFormatters,
    Function(String value)? onChanged,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    IconData? prefixIcon,
    Color? colorPrefixIcon,
    double? sizePrefixIcon,
    IconData? suffixIcon,
    Color? colorSuffixIcon,
    double? sizeSuffixIcon,
    Color? fillColor,
    String? counterText,
    FormFieldSetter<String>? onSaved,
    FormFieldValidator<String>? validator,
    GestureTapCallback? onTapPrefix,
    GestureTapCallback? onTapSuffix,
    GestureTapCallback? onTap,
  }) {
    String align = labelAlign ?? 'align-items-center';
    return Container(
      margin: margin,
      child: FB5Row(
        classNames: 'align-items-center mb-3',
        children: [
          FB5Col(
            child: FB5Row(
              classNames: '$align gx-3',
              children: [
                FB5Col(
                  classNames: colLeft ?? 'col-sm-2 mb-2 mb-sm-0',
                  child: CustomText(label, style: MyStyle.body2Regular.copyWith(color: MyColor.dark)),
                ),
                FB5Col(
                  classNames: colRight ?? 'col-sm-10',
                  child: TextFormField(
                    controller: controller,
                    initialValue: initialValue,
                    maxLines: maxLines,
                    maxLength: maxLength,
                    inputFormatters: inputFormatters,
                    obscureText: obscureText,
                    keyboardType: keyboardType,
                    enabled: !loading ? enabled : false, //ketika loading jadi false
                    autofocus: autoFocus,
                    readOnly: readOnly,
                    showCursor: showCursor,
                    focusNode: focusNode,
                    textAlign: textAlign ?? TextAlign.start,
                    textInputAction: textInputAction,
                    textCapitalization: textCapitalization,
                    onChanged: onChanged,
                    onEditingComplete: onEditingComplete,
                    onFieldSubmitted: onFieldSubmitted,
                    style: style ?? MyStyle.body2Regular.copyWith(color: MyColor.dark),
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                        counterText: counterText,
                        isDense: true,
                        contentPadding: padding ??
                            const EdgeInsets.symmetric(vertical: kPadding12, horizontal: kPadding10),
                        hintText: hintText,
                        hintStyle: hintStyle ?? MyStyle.body2Regular.copyWith(
                            color: MyColor.grey5
                        ),
                        prefixIcon: prefixIcon != null ? CustomInkWell(
                            onTap: onTapPrefix,
                            child: Icon(prefixIcon, size: sizePrefixIcon ?? 20, color: colorPrefixIcon ?? MyColor.dark,)
                        ) : null,
                        suffixIcon: !loading ? (suffixIcon != null ? CustomInkWell(
                            onTap: onTapSuffix,
                            child: Icon(suffixIcon, size: sizeSuffixIcon ?? 20, color: colorSuffixIcon ?? MyColor.dark,)
                        ) : null) : SizedBox(width: 20, child: CircularProgressIndicator(strokeWidth: 2,)),
                        border: OutlineInputBorder(borderSide: BorderSide(color: MyColor.grey4), borderRadius: BorderRadius.circular(5)),
                        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: MyColor.grey4), borderRadius: BorderRadius.circular(5)),
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: MyColor.grey4), borderRadius: BorderRadius.circular(5)),
                        errorText: null,
                        hoverColor: Colors.transparent,
                        fillColor: fillColor ?? Colors.transparent,
                        filled: false),
                    validator: validator,
                    onSaved: onSaved,
                  ),
                )
              ],
            )
          ),
          if(errorText != null && errorText.isNotEmpty) FB5Col(child: FB5Row(
            classNames: 'align-items-center',
            children: [
              FB5Col(
                classNames: 'col-sm-2',
              ),
              FB5Col(
                classNames: 'col-sm-10',
                child: Container(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: CustomText(errorText, style: MyStyle.smallBody1Regular.copyWith(
                        color: MyColor.red
                    ))),
              )
            ],
          ))
        ],
      ),
    );
  }
}