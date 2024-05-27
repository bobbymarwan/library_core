import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:library_core/misc/constant.dart';
import 'package:library_core/misc/helper.dart';
import 'package:library_core/widget/container/container_outline.dart';
import 'package:library_core/widget/custom_expansion_tile.dart';
import 'package:library_core/widget/custom_ink_well.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:library_core/styles/my_color.dart';
import 'package:library_core/styles/my_style.dart';
import 'package:library_core/widget/custom_text.dart';

class FilterDateRangeWidget extends StatelessWidget {
  final DateTime? startDate;
  final DateTime? endDate;
  final EdgeInsetsGeometry? margin;
  final IconData calendarIcon;
  final Function(List<DateTime?>)? onValueChanged;

  late String rangeDate;

  FilterDateRangeWidget({super.key, this.startDate, this.endDate, this.margin, this.onValueChanged, required this.calendarIcon}){
    rangeDate = '${Helper.formatDate(startDate, pattern: 'dd MMMM yyyy')} - ${Helper.formatDate(endDate, pattern: 'dd MMMM yyyy')}';
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
        title: CustomText('Range Date', style: MyStyle.body2Bold),
        children: [
          CustomInkWell(
            onTap: () async {
              var results = await showCalendarDatePicker2Dialog(
                context: context,
                config: CalendarDatePicker2WithActionButtonsConfig(
                  calendarType: CalendarDatePicker2Type.range,
                  lastDate: DateTime.now()
                ),
                dialogSize: const Size(325, 400),
                initialValue: [startDate, endDate],
                borderRadius: BorderRadius.circular(8),
              );
              if(results != null){
                onValueChanged?.call(results);
              }
            },
            child: ContainerOutlineWidget(
              padding: EdgeInsets.symmetric(vertical: kPadding10, horizontal: kPadding16),
              child: Row(
                children: [
                  Expanded(child: CustomText(rangeDate)),
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