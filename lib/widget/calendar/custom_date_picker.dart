import 'package:library_core/widget/calendar/month_picker_widget.dart';
import 'package:library_core/widget/calendar/weekly_picker_widget.dart';
import 'package:library_core/widget/calendar/year_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:library_core/misc/constant.dart';
import 'package:library_core/styles/my_color.dart';
import 'package:library_core/styles/my_style.dart';

class CustomDatePicker extends StatelessWidget {
  final DateTime initialDate;
  final DateTime? minDate;
  final DateTime? maxDate;
  final int? columnCount;
  final String? btnText;
  final CalendarDatePickerMode mode;
  final Function(List<DateTime>)? onChange;
  final Function(List<DateTime>)? onPressed;
  final bool isDateRange;
  const CustomDatePicker({super.key,
  required this.initialDate,
  this.minDate,
  this.maxDate,
  required this.mode,
  this.columnCount,
  this.btnText,
  this.onChange,
  this.onPressed,
    this.isDateRange = false,
  });

  @override
  Widget build(BuildContext context) {
    return _calenderView;
  }

  Widget get _calenderView {
    switch(mode) {
      case CalendarDatePickerMode.year:
        return YearPickerWidget(
            columnCount: columnCount,
            btnText: btnText,
            initialDate: initialDate,
            minDate: minDate ?? DateTime(1900),
            maxDate: maxDate ?? DateTime.now(),
          onChange: onChange,
          onPressed: onPressed,
        );
      case CalendarDatePickerMode.week:
        return WeekPickerWidget(
          columnCount: columnCount,
          btnText: btnText,
            initialDate: initialDate,
          minDate: minDate ?? DateTime(1900),
          maxDate: maxDate ?? DateTime.now(),
          onChange: onChange,
          onPressed: onPressed,
        );
      default:
        return MonthPickerWidget(
          columnCount: columnCount,
          btnText: btnText,
          initialDate: initialDate,
          minDate: minDate ?? DateTime(1900),
          maxDate: maxDate ?? DateTime.now(),
          onChange: onChange,
          onPressed: onPressed,
        );
    }

  }

}

enum CalendarDatePickerMode { day, week, month, year }


