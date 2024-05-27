import 'package:flutter/material.dart';

class MyColor {
  static Color primary = const Color(0xFF0074BD);
  static Color secondary = const Color(0xFF70C0F2);
  static Color accent = const Color(0xFFF5FBFF);

  static Color white = const Color(0xFFFFFFFF);
  static Color grey1 = const Color(0xFFF4F8FA);
  static Color grey2 = const Color(0xFFEFF8FD);
  static Color grey3 = const Color(0xFFC7E0F0);
  static Color grey4 = const Color(0xFFD6DFE3);
  static Color grey5 = const Color(0xFFA5ADB1);
  static Color grey6 = const Color(0xFF8398A5);
  static Color dark = const Color(0xFF0C232E);

  //COLOR DOUGHNUT CHART
  static Color chart1 = const Color(0xFFFFA9A9);
  static Color chart2 = const Color(0xFFDA6F35);
  static Color chart3 = const Color(0xFFF8961E);
  static Color chart4 = const Color(0xFFF9C74F);
  static Color chart5 = const Color(0xFF90BE6D);
  static Color chart6 = const Color(0xFF43AA8B);
  static Color chart7 = const Color(0xFF577590);
  static Color chart8 = const Color(0xFF2D9CDB);

  //COLOR STATUS PAYMENT TEXT
  static Color draft = Colors.grey.shade200;
  static Color inProgress =  Colors.amber.shade100;
  static Color readyToRelease = Colors.indigo.shade100;
  static Color release = Colors.blue.shade100;
  static Color rejected = Colors.red.shade100;
  static Color paid = Colors.lightGreen.shade100;
  static Color canceled = Colors.red.shade100;

  //COLOR STATUS PAYMENT BACKGROUND
  static Color bgDraft = Colors.grey ;
  static Color bgInProgress = Colors.amber;
  static Color bgReadyToRelease = Colors.indigo;
  static Color bgRelease = Colors.blue;
  static Color bgRejected = Colors.red;
  static Color bgPaid = Colors.lightGreen;
  static Color bgCanceled = Colors.red;

  static MaterialColor green = const MaterialColor(0xFFC4DD38, <int, Color>{
    0: Color(0xFFFDFFF5),
    100: Color(0xFFF4FDC5),
    200: Color(0xFFEAF998),
    300: Color(0xFFDFF270),
    400: Color(0xFFD2E950),
    500: Color(0xFFC4DD38),
    600: Color(0xFFB4CD27),
    700: Color(0xFFA0B81B),
    800: Color(0xFF8BA013),
    900: Color(0xFF75870E),
  });

  static MaterialColor blue = const MaterialColor(0xFF389EDD, <int, Color>{
    0: Color(0xFFF5FBFF),
    100: Color(0xFFC5E8FD),
    200: Color(0xFF98D3F9),
    300: Color(0xFF70C0F2),
    400: Color(0xFF50AFE9),
    500: Color(0xFF389EDD),
    600: Color(0xFF278DCD),
    700: Color(0xFF1B7CB8),
    800: Color(0xFF136AA0),
    900: Color(0xFF0E5987),
  });

  static const MaterialColor red = MaterialColor(0xFFDD3841, <int, Color>{
    0: Color(0xFFFFF5F5),
    100: Color(0xFFFDC5C8),
    200: Color(0xFFF9989C),
    300: Color(0xFFF27077),
    400: Color(0xFFE95058),
    500: Color(0xFFDD3841),
    600: Color(0xFFCD272F),
    700: Color(0xFFB81B23),
    800: Color(0xFFA0131A),
    900: Color(0xFF870E14),
  });
}