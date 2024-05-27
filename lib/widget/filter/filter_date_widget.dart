import 'package:library_core/misc/helper.dart';
import 'package:library_core/widget/calendar/custom_date_picker.dart';
import 'package:library_core/widget/container/container_outline.dart';
import 'package:library_core/widget/custom_expansion_tile.dart';
import 'package:library_core/widget/custom_ink_well.dart';
import 'package:library_core/widget/custom_text.dart';
import 'package:library_core/widget/dialog/dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:library_core/styles/my_color.dart';
import 'package:library_core/styles/my_style.dart';
import 'package:library_core/misc/constant.dart';

class FilterDateWidget extends StatelessWidget {
  final DateTime? startDate;
  final DateTime? endDate;
  final EdgeInsetsGeometry? margin;
  final CalendarDatePickerMode mode;
  final bool isDateRange;
  final Function(List<DateTime?>)? onValueChanged;
  final IconData calendarIcon;
  late String startDateText;
  late String endDateText;
  FilterDateWidget(
      {super.key,
        required this.calendarIcon,
      this.startDate,
      this.endDate,
      this.margin,
      this.onValueChanged,
      this.mode = CalendarDatePickerMode.month,
      this.isDateRange = false}) {
    startDateText = Helper.formatDate(startDate, pattern: mode == CalendarDatePickerMode.year ? 'yyyy': 'MMMM yyyy');
    endDateText = Helper.formatDate(endDate, pattern: mode == CalendarDatePickerMode.year ? 'yyyy': 'MMMM yyyy');
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
          isDateRange && mode != CalendarDatePickerMode.day
              ? Row(
                  children: [
                    Expanded(
                        child: CustomInkWell(
                          onTap: () async {
                            DialogWidget.custom(
                                body: CustomDatePicker(
                                  initialDate: startDate ?? DateTime.now(),
                                  mode: mode,
                                  maxDate: DateTime.now(),
                                  onPressed: (dates) {
                                    if (dates.length == 2) {
                                      onValueChanged?.call([dates.first, endDate]);
                                    }
                                  },
                                ));
                          },
                          child: ContainerOutlineWidget(
                            padding: EdgeInsets.symmetric(
                                vertical: kPadding10, horizontal: kPadding16),
                            child: Row(
                              children: [
                                Expanded(child: CustomText(startDateText)),
                                Icon(calendarIcon)
                              ],
                            ),
                          ),
                        )),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: kPadding16),
                      child: Text('-'),
                    ),
                    Expanded(
                        child: CustomInkWell(
                          onTap: () async {
                            DialogWidget.custom(
                                body: CustomDatePicker(
                                  initialDate: endDate ?? DateTime.now(),
                                  mode: mode,
                                  maxDate: DateTime.now(),
                                  onPressed: (dates) {
                                    if (dates.length == 2) {
                                      onValueChanged?.call([startDate, dates.last]);
                                    }
                                  },
                                ));
                          },
                          child: ContainerOutlineWidget(
                            padding: EdgeInsets.symmetric(
                                vertical: kPadding10, horizontal: kPadding16),
                            child: Row(
                              children: [
                                Expanded(child: CustomText(endDateText)),
                                Icon(calendarIcon)
                              ],
                            ),
                          ),
                        ))
                  ],
                )
              : CustomInkWell(
                  onTap: () async {
                    DialogWidget.custom(
                        body: CustomDatePicker(
                      initialDate: startDate ?? DateTime.now(),
                      mode: mode,
                      maxDate: DateTime.now(),
                      onPressed: (dates) {
                        if (dates.length == 2) {
                          onValueChanged?.call(dates);
                        }
                      },
                    ));
                  },
                  child: ContainerOutlineWidget(
                    padding: EdgeInsets.symmetric(
                        vertical: kPadding10, horizontal: kPadding16),
                    child: Row(
                      children: [
                        Expanded(child: CustomText(startDateText)),
                        Icon(calendarIcon)
                      ],
                    ),
                  )),
        ],
      ),
    );
  }
}
