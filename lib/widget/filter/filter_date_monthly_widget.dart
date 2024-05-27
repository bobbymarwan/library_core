import 'package:library_core/misc/constant.dart';
import 'package:library_core/misc/helper.dart';
import 'package:library_core/widget/calendar/custom_date_picker.dart';
import 'package:library_core/widget/container/container_outline.dart';
import 'package:library_core/widget/custom_expansion_tile.dart';
import 'package:library_core/widget/custom_ink_well.dart';
import 'package:library_core/widget/dialog/dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:library_core/styles/my_color.dart';
import 'package:library_core/styles/my_style.dart';
import 'package:library_core/widget/custom_text.dart';

class FilterDateMonthlyWidget extends StatelessWidget {
  final DateTime? startDate;
  final DateTime? endDate;
  final EdgeInsetsGeometry? margin;
  final IconData calendarIcon;
  final Function(List<DateTime?>)? onValueChanged;

  late String date;

  FilterDateMonthlyWidget({super.key, this.startDate, this.endDate, this.margin, this.onValueChanged, required this.calendarIcon}){
    date = Helper.formatDate(startDate, pattern: 'MMMM yyyy');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: CustomExpansionTile(
        initiallyExpanded: true,
        isDividerBottom: true,
        padding: EdgeInsets.symmetric(vertical: kPadding16),
        childrenPadding: EdgeInsets.only(bottom: kPadding16),
        title: CustomText('Period Date', style: MyStyle.body2Bold),
        children: [
          CustomInkWell(
              onTap: () async {
                DialogWidget.custom(body: CustomDatePicker(
                  initialDate: startDate ?? DateTime.now(),
                  mode: CalendarDatePickerMode.month,
                  maxDate: DateTime.now(),
                  onPressed: (dates) {
                    if(dates.length == 2) {
                      onValueChanged?.call(dates);
                    }
                  },
                ));
              },
              child: ContainerOutlineWidget(
                padding: EdgeInsets.symmetric(vertical: kPadding10, horizontal: kPadding16),
                child: Row(
                  children: [
                    Expanded(child: CustomText(date)),
                    Icon(calendarIcon)
                  ],
                ),
              )
          ),
        ],
      ),
    );
  }
}