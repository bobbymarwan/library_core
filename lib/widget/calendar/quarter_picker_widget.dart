import 'package:library_core/widget/buttons/button_primary.dart';
import 'package:library_core/widget/custom_ink_well.dart';
import 'package:library_core/widget/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:library_core/misc/constant.dart';
import 'package:library_core/styles/my_color.dart';
import 'package:library_core/styles/my_style.dart';

class QuarterPickerWidget extends StatefulWidget {
  final DateTime initialDate;
  final DateTime minDate;
  final DateTime maxDate;
  final int? columnCount;
  final String? btnText;
  final Function(List<DateTime>)? onChange;
  final Function(List<DateTime>)? onPressed;

  const QuarterPickerWidget({super.key,
  required this.initialDate,
  required this.minDate,
  required this.maxDate,
  this.columnCount,
  this.btnText,
  this.onChange,
  this.onPressed});

  @override
  _QuarterPickerWidgetState createState() => _QuarterPickerWidgetState();
}

class _QuarterPickerWidgetState extends State<QuarterPickerWidget> with SingleTickerProviderStateMixin {

  int _pickerYear = DateTime.now().year;

  String _selected = '1Q';

  final List<String> _quarterList =[
    '1Q', '2Q', '3Q', '4Q'
  ];

  // List<DateTime> getDates(DateTime dateTime){
  //   var startDate = DateTime(dateTime.year, dateTime.month, dateTime.day);
  //   var endDate = DateTime(dateTime.year, dateTime.month+1, 0);
  //
  //   return [startDate, endDate];
  // }
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
          crossAxisCount: widget.columnCount ?? 2,
          crossAxisSpacing: 4.0,
          mainAxisSpacing: 8.0,
          childAspectRatio: (1 / .2),
          children: List.generate(_quarterList.length, (index) => _item(_quarterList[index])),
          padding: const EdgeInsets.symmetric(horizontal: kPadding16),
        ),
        SizedBox(height: kPadding32),
        ButtonPrimary.medium(
            isExpand: true,
            text: widget.btnText ?? 'OK', onPressed: widget.onPressed != null ? (){
          widget.onPressed?.call(
              [_getDates(_selected)[0], _getDates(_selected)[1]]
          );
          Navigator.pop(context);
        } : null)
      ],
    );
  }

  Widget _item(String quarter) {
    // DateTime dateTime = DateTime(_pickerYear, index+1, 1);
    final backgroundColor = quarter == _selected
        ? MyColor.primary
        : Colors.transparent;
    const double decorationHeight = 36.0;
    const double decorationWidth = 72.0;
    final bool isSelected = quarter == _selected;
    return CustomInkWell(
        onTap: () {
          if(isDateInRange(_getDates(quarter)[1], widget.minDate, widget.maxDate)) {
            setState(() {
              _selected = quarter;
            });
            if(widget.onPressed == null) {
              widget.onChange?.call(
                  [_getDates(quarter)[0], _getDates(quarter)[1]]
              );
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
                  quarter,
                  style: MyStyle.body1Regular.copyWith(color: isDateInRange(_getDates(quarter)[1], widget.minDate, widget.maxDate) ? isSelected ? MyColor.white : null: MyColor.grey5),
                ),
              ),
            ),
          ),
        )
    );
  }

  List<DateTime> _getDates(String selected){
    DateTime startDate;
    DateTime endDate;
    switch(selected) {
      case '1Q':
        startDate = DateTime(_pickerYear, 1, 1);
        endDate = DateTime(_pickerYear, 3, 31);
        return [startDate, endDate];
      case '2Q':
        startDate = DateTime(_pickerYear, 4, 1);
        endDate = DateTime(_pickerYear, 6, 30);
        return [startDate, endDate];
      case '3Q':
        startDate = DateTime(_pickerYear, 7, 1);
        endDate = DateTime(_pickerYear, 9, 30);
        return [startDate, endDate];
      case '4Q':
        startDate = DateTime(_pickerYear, 10, 1);
        endDate = DateTime(_pickerYear, 12, 31);
        return [startDate, endDate];
      default:
        startDate = DateTime(_pickerYear, 1, 1);
        endDate = DateTime(_pickerYear, 3, 31);
        return [startDate, endDate];
    }
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
    } else if (inputYear == startYear && inputMonth >= startMonth) {
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