import 'package:flutter/cupertino.dart';
import 'package:flutter_bootstrap5/flutter_bootstrap5.dart';

class Responsive {
  static bool isSmall(BuildContext context) {
    final screenData = BootstrapTheme.of(context);
    bool small = screenData.currentBreakPoint
        .isBreakPointOrSmaller(screenData.breakPoints.sm);
    return small;
  }

  static bool isLarge(BuildContext context) {
    final screenData = BootstrapTheme.of(context);
    bool large = screenData.currentBreakPoint
        .isBreakPointOrSmaller(screenData.breakPoints.lg);
    return large;
  }
}
