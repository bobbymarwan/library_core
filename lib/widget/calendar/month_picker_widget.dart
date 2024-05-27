import 'package:library_core/widget/buttons/button_primary.dart';
import 'package:library_core/widget/custom_ink_well.dart';
import 'package:library_core/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:library_core/misc/constant.dart';
import 'package:library_core/styles/my_color.dart';
import 'package:library_core/styles/my_style.dart';

class MonthPickerWidget extends StatefulWidget {
  final DateTime initialDate;
  final DateTime minDate;
  final DateTime maxDate;
  final int? columnCount;
  final String? btnText;
  final Function(List<DateTime>)? onChange;
  final Function(List<DateTime>)? onPressed;

  const MonthPickerWidget({super.key, required this.initialDate,
  required this.minDate,
  required this.maxDate,
  this.columnCount,
  this.btnText,
  this.onChange,
  this.onPressed
  });

  @override
  _MonthPickerWidgetState createState() => _MonthPickerWidgetState();
}

class _MonthPickerWidgetState extends State<MonthPickerWidget> with SingleTickerProviderStateMixin {
  bool pickerIsExpanded = false;
  int _pickerYear = 0;
  late DateTime _selectedMonth;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pickerYear = widget.initialDate.year;
    _selectedMonth = DateTime(widget.initialDate.year, widget.initialDate.month,);
  }

  List<DateTime> getDates(DateTime dateTime){
    var startDate = DateTime(dateTime.year, dateTime.month, dateTime.day);
    var endDate = DateTime(dateTime.year, dateTime.month+1, 0);

    return [startDate, endDate];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            IconButton(
              onPressed: _pickerYear > widget.minDate.year ? () {
                setState(() {
                  _pickerYear = _pickerYear - 1;
                });
              } : null,
              icon: Icon(Icons.navigate_before_rounded),
            ),
            Expanded(
              child: Center(
                child: Text(
                  _pickerYear.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            IconButton(
              onPressed: _pickerYear < widget.maxDate.year ? () {
                setState(() {
                  _pickerYear = _pickerYear + 1;
                });
              } : null,
              icon: Icon(Icons.navigate_next_rounded),
            ),
          ],
        ),
        SizedBox(height: kPadding32),
        GridView.count(
          shrinkWrap: true,
          crossAxisCount: widget.columnCount ?? 3,
          crossAxisSpacing: 4.0,
          mainAxisSpacing: 8.0,
          childAspectRatio: 3/2,
          children: List.generate(12, (index) => _monthItem(index+1)),
          padding: const EdgeInsets.symmetric(horizontal: kPadding16),
        ),
        SizedBox(height: kPadding32),
        ButtonPrimary.medium(
            isExpand: true,
            text: widget.btnText ?? 'OK', onPressed: widget.onPressed != null ? (){
              widget.onPressed?.call([getDates(_selectedMonth)[0], getDates(_selectedMonth)[1]]);
              Navigator.pop(context);
        } : null)
      ],
    );
  }

    Widget _monthItem(int index) {
      DateTime dateTime = DateTime(_pickerYear, index);
      final backgroundColor = dateTime.isAtSameMomentAs(_selectedMonth)
              ? MyColor.primary
              : Colors.transparent;
      const double decorationHeight = 36.0;
      const double decorationWidth = 72.0;
      final bool isSelected = dateTime.isAtSameMomentAs(_selectedMonth);

      return CustomInkWell(
        onTap: () {
          if(isDateInRange(dateTime, widget.minDate, widget.maxDate)) {
            setState(() {
              _selectedMonth = dateTime;
            });
            if(widget.onPressed == null) {
              widget.onChange?.call([getDates(_selectedMonth)[0], getDates(_selectedMonth)[1]]);
            }
          }
        },
        child: Center(
          child: Container(
            decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(decorationHeight / 2)
            ),
            height: decorationHeight,
            width: decorationWidth,
            child: Center(
              child: Semantics(
                selected: isSelected,
                button: true,
                child: CustomText(
                  DateFormat('MMM').format(dateTime),
                  style: MyStyle.body1Regular.copyWith(color: isDateInRange(dateTime, widget.minDate, widget.maxDate) ? (isSelected ? MyColor.white : null): MyColor.grey5),
                ),
              ),
            ),
          ),
        )
      );
    }

  bool isDateInRange(DateTime date, DateTime startRange, DateTime endRange) {
    // Extract the month and year components from the input date
    int inputYear = date.year;
    int inputMonth = date.month;

    // Extract the start and end month and year components from the range
    int startYear = startRange.year;
    int startMonth = startRange.month;
    int endYear = endRange.year;
    int endMonth = endRange.month;

    // Check if the input date is within the range
    if (inputYear > startYear && inputYear < endYear) {
      // If the input date's year is greater than the start year and less than the end year,
      // then it's definitely within the range
      return true;
    } else if (inputYear == startYear && inputYear < endYear && inputMonth >= startMonth) {
      // If the input date's year is the same as the start year and the input month is greater
      // than or equal to the start month, then it's within the range
      return true;
    } else if (inputYear == endYear && inputMonth <= endMonth) {
      // If the input date's year is the same as the end year and the input month is less than
      // or equal to the end month, then it's within the range
      return true;
    } else {
      // Otherwise, the input date is outside the specified range
      return false;
    }
  }
}