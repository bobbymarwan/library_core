import 'dart:math';
import 'dart:ui' as ui;
import 'package:library_core/widget/custom_text_form_field.dart';
import 'package:library_core/widget/item_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:library_core/misc/constant.dart';
import 'package:library_core/styles/my_color.dart';
import 'package:library_core/styles/my_style.dart';

class NumberCaptcha extends StatefulWidget {
  TextEditingController? controller;
  bool loading = false;
  String? hintText;
  String? errorText;
  String? initialValue;
  FocusNode? focusNode;
  TextInputType? keyboardType;
  TextCapitalization textCapitalization = TextCapitalization.none;
  TextInputAction? textInputAction;
  bool autoFocus = false;
  bool readOnly = false;
  bool? showCursor;
  bool obscureText = false;
  bool enabled = true;
  int? maxLines;
  int? maxLength;
  TextStyle? style;
  TextStyle? hintStyle;
  TextAlign? textAlign;
  VoidCallback? onEditingComplete;
  ValueChanged<String>? onFieldSubmitted;
  List<TextInputFormatter>? inputFormatters;
  Function(String value)? onChanged;
  EdgeInsetsGeometry? padding;
  EdgeInsetsGeometry? margin;
  IconData? prefixIcon;
  Color? colorPrefixIcon;
  double? sizePrefixIcon;
  IconData? suffixIcon;
  Color? colorSuffixIcon;
  double? sizeSuffixIcon;
  Color? fillColor;
  String? counterText;
  FormFieldSetter<String>? onSaved;
  FormFieldValidator<String>? validator;
  GestureTapCallback? onTapPrefix;
  GestureTapCallback? onTapSuffix;
  GestureTapCallback? onTap;
  GestureTapCallback? onRefresh;
  IconData refreshIcon;

  NumberCaptcha(
    this.code, {
    Key? key,
        required this.refreshIcon,
    this.controller,
    this.maxLines,
    this.loading = false,
    this.errorText,
    this.textCapitalization = TextCapitalization.none,
    this.enabled = true,
    this.onFieldSubmitted,
        this.onRefresh,
  }) : super(key: key);

  final String code;

  @override
  State<NumberCaptcha> createState() => _NumberCaptchaState();
}

class _NumberCaptchaState extends State<NumberCaptcha> {
  final double width = 180;
  final double height = 40;
  final int dotCount = 100;
  final Color backgroundColor = Colors.white;

  Map getRandomData() {
    List list = widget.code.split("");
    double x = 0.0;
    double maxFontSize = 40.0;

    List mList = [];
    for (String item in list) {
      Color color = Color.fromARGB(
        255,
        Random().nextInt(255),
        Random().nextInt(255),
        Random().nextInt(255),
      );

      int fontWeight = Random().nextInt(9);

      TextSpan span = TextSpan(
        text: item,
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.values[fontWeight],
          fontSize: maxFontSize - Random().nextInt(10),
        ),
      );

      TextPainter painter = TextPainter(
        text: span,
        textDirection: ui.TextDirection.ltr,
      );

      painter.layout();

      double y = Random().nextInt(height.toInt()).toDouble() - painter.height;

      if (y < 0) {
        y = 0;
      }

      Map strMap = {"painter": painter, "x": x, "y": y};

      mList.add(strMap);

      x += painter.width + 3;
    }

    double offsetX = (width - x) / 2;
    List dotData = [];

    for (var i = 0; i < dotCount; i++) {
      int r = Random().nextInt(255);
      int g = Random().nextInt(255);
      int b = Random().nextInt(255);
      double x = Random().nextInt(width.toInt() - 5).toDouble();
      double y = Random().nextInt(height.toInt() - 5).toDouble();
      double dotWidth = Random().nextInt(6).toDouble();
      Color color = Color.fromARGB(255, r, g, b);
      Map dot = {"x": x, "y": y, "dotWidth": dotWidth, "color": color};
      dotData.add(dot);
    }

    Map checkCodeDrawData = {
      "painterData": mList,
      "offsetX": offsetX,
      "dotData": dotData,
    };
    return checkCodeDrawData;
  }

  @override
  Widget build(BuildContext context) {
    double maxWidth = 0.0;
    Map drawData = getRandomData();

    maxWidth = getTextSize(
      "8" * widget.code.length,
      TextStyle(fontWeight: FontWeight.values[8], fontSize: 25),
    ).width;

    return Container(
      margin: EdgeInsets.only(bottom: kPadding16),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.loading)
              Center(
                child: CircularProgressIndicator(),
              ),
            if (!widget.loading)
              ItemView.verticalCustomWidget(label: "Kode Captcha",
                  margin: EdgeInsets.only(bottom: kPadding10),
                  labelStyle: MyStyle.body2Regular.copyWith(color: MyColor.dark),
                  child: Row(
                    children: [
                      Container(
                        color: Colors.black,
                        width: maxWidth > width ? maxWidth : width,
                        height: height,
                        child: CustomPaint(
                          painter: HBCheckCodePainter(drawData: drawData),
                        ),
                      ),
                      IconButton(icon: Icon(widget.refreshIcon), onPressed: widget.onRefresh)
                    ],
                  )),
            if (!widget.loading)
              CustomTextField.outline(
                controller: widget.controller,
                hintText: "Masukkan Kode Captcha",
                maxLines: 1,
                onFieldSubmitted: widget.onFieldSubmitted,
                errorText: widget.errorText!
              ),
          ],
        ),
      ),
    );
  }

  Size getTextSize(String text, TextStyle style) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      maxLines: 1,
      textDirection: ui.TextDirection.ltr,
    )..layout(minWidth: 0, maxWidth: double.infinity);

    return textPainter.size;
  }
}

class HBCheckCodePainter extends CustomPainter {
  final Map drawData;

  HBCheckCodePainter({
    required this.drawData,
  });

  final Paint _paint = new Paint()
    ..color = Colors.grey
    ..strokeCap = StrokeCap.square
    ..isAntiAlias = true
    ..strokeWidth = 1.0
    ..style = PaintingStyle.fill;

  @override
  void paint(Canvas canvas, Size size) {
    List mList = drawData["painterData"];

    double offsetX = drawData["offsetX"];

    canvas.translate(offsetX, 0);

    for (var item in mList) {
      TextPainter painter = item["painter"];
      double x = item["x"];
      double y = item["y"];
      painter.paint(
        canvas,
        Offset(x, y),
      );
    }

    canvas.translate(-offsetX, 0);
    List dotData = drawData["dotData"];
    for (var item in dotData) {
      double x = item["x"];
      double y = item["y"];
      double dotWidth = item["dotWidth"];
      Color color = item["color"];
      _paint.color = color;
      canvas.drawOval(Rect.fromLTWH(x, y, dotWidth, dotWidth), _paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return this != oldDelegate;
  }
}
