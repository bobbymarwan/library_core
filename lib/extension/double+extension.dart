import 'package:intl/intl.dart';

extension DoubleExt on double {

  String chartFormattedValueWithCustomDecimalDigit({int digit = 0}) {
    NumberFormat format = NumberFormat.decimalPatternDigits(
        locale: 'id_ID', decimalDigits: digit);
    return format.format(this ?? 0);
  }

  String formatValueChart({int digit = 0}){
    NumberFormat format = NumberFormat.compactCurrency(
        locale: 'id_ID', symbol: '', decimalDigits: digit);
    return format.format(this);
  }

  String get chartFormattedValue {
    NumberFormat format = NumberFormat.decimalPatternDigits(locale: 'id_ID', decimalDigits: 0);
    return format.format(this ?? 0);
  }

  String get formatCurrency {
    final formatter = NumberFormat.currency(locale: 'id_ID', symbol: "", decimalDigits: 2);
    return formatter.format(this);
  }

  String get formatCurrencyCompact {
    String symbol;
    double value = this;
    if (this >= 1000000000000) {
      value /= 1000000000000;
      symbol = 'T';
    } else if (this >= 1000000000) {
      value /= 1000000000;
      symbol = 'M';
    } else if (value >= 1000000) {
      value /= 1000000;
      symbol = 'Jt';
    } else if (value >= 1000) {
      value /= 1000;
      symbol = 'Rb';
    } else {
      symbol = '';
    }

    final format = NumberFormat.currency(
      decimalDigits: value % 1 == 0 ? 0 : 2,
      symbol: '',
    );

    return '${format.format(value)} $symbol';
  }
}