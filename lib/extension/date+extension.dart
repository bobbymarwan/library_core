import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;

extension DateExt on DateTime {

   int getDaysInMonth(int year, int month) {
    DateTime firstDayOfNextMonth = DateTime(year, month + 1, 1);
    DateTime lastDayOfCurrentMonth = firstDayOfNextMonth.subtract(Duration(days: 1));
    return lastDayOfCurrentMonth.day;
  }

  static String getMonthName(int month) {
    List<String> months = [
      'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December'
    ];
    return months[month];
  }

  static int getDaysInYear(int year) {
    // Check if the year is a leap year
    bool isLeapYear = isLeap(year);

    // Return the number of days based on whether it's a leap year or not
    return isLeapYear ? 366 : 365;
  }

  static bool isLeap(int year) {
    return (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0);
  }

  String get timeUntil {
    var locale = 'en';
    return timeago.format(this, locale: locale, allowFromNow: true);
  }

  String toFormattedDate({String pattern = 'yyyy-MM-dd HH:mm:ss'}) {
    DateFormat dateFormat = DateFormat(pattern, "id_ID");
    return dateFormat.format(this);
  }

  bool isSameDayAs(DateTime otherDate) {
    return year == otherDate.year &&
        month == otherDate.month &&
        day == otherDate.day;
  }

  static List<DateTime> getDaysInBetween(
      {required DateTime startDate, required DateTime endDate}) {
    List<DateTime> days = [];
    for (int i = 0; i <= endDate.difference(startDate).inDays; i++) {
      days.add(startDate.add(Duration(days: i)));
    }
    return days;
  }

  static DateTime toDate(String inputDate, {String pattern = 'yyyy-MM-dd'}) {
    DateFormat dateFormat = DateFormat(pattern);
    return dateFormat.parse(inputDate);
  }
}