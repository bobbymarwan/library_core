import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:library_core/misc/helper.dart';
import 'package:library_core/widget/container/container_outline.dart';
import 'package:library_core/widget/custom_expansion_tile.dart';
import 'package:library_core/widget/custom_ink_well.dart';
import 'package:library_core/widget/custom_text.dart';
import 'package:library_core/widget/dialog/dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:library_core/styles/my_color.dart';
import 'package:library_core/styles/my_style.dart';
import 'package:library_core/misc/constant.dart';
import 'package:get/get.dart';

class FilterDateRevasWidget extends StatefulWidget {
  final DateTime? startDate;
  final DateTime? endDate;
  final bool isUseLastDate;
  final EdgeInsetsGeometry? margin;
  final bool isDateRange;
  final Function(List<DateTime?>)? onValueChanged;
  final String title;
  final IconData calendarIcon;
  late String startDateText;
  late String endDateText;
  FilterDateRevasWidget(
      {super.key,
        required this.calendarIcon,
      this.startDate,
      this.endDate,
      this.margin,
      this.onValueChanged,
        this.title = "Updated Date",
        this.isUseLastDate = true,
      this.isDateRange = false}) {
    DateTime date = DateTime.now();
    // DateTime startDateDefault = DateTime(date.year, date.month-1, date.day);
    // DateTime endDateDefault = DateTime(date.year, date.month-1, date.day);
    startDateText = Helper.formatDate(startDate ?? date, pattern: 'dd MMMM yyyy');
    endDateText = Helper.formatDate(endDate ?? date, pattern: 'dd MMMM yyyy');
  }

  @override
  State<FilterDateRevasWidget> createState() => _FilterDateRevasWidgetState();
}

class _FilterDateRevasWidgetState extends State<FilterDateRevasWidget> {

  List<DateTime?> _rangeDatePickerValue = [];

  @override
  void initState() {
    // TODO: implement initState
    _rangeDatePickerValue = [widget.startDate, widget.endDate];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      child: CustomExpansionTile(
        initiallyExpanded: true,
        isDividerBottom: true,
        padding: EdgeInsets.symmetric(vertical: kPadding16),
        childrenPadding: EdgeInsets.only(bottom: kPadding16),
        title: CustomText(widget.title, style: MyStyle.body2Bold),
        children: [
         CustomInkWell(
                  onTap: () async {
                    DialogWidget.custom(
                        body: CalendarDatePicker2WithActionButtons(
                          initialValue: _rangeDatePickerValue,
                          config: CalendarDatePicker2WithActionButtonsConfig(
                            calendarType: CalendarDatePicker2Type.range,
                            lastDate: widget.isUseLastDate ? DateTime.now() : null
                          ),
                          onValueChanged: widget.onValueChanged,
                          onOkTapped: (){
                            Get.back();
                          },
                          onCancelTapped: (){
                            Get.back();
                          },
                        ));
                  },
                  child: ContainerOutlineWidget(
                    padding: EdgeInsets.symmetric(
                        vertical: kPadding10, horizontal: kPadding16),
                    child: Row(
                      children: [
                        Expanded(child: CustomText('${widget.startDateText} - ${widget.endDateText}')),
                        Icon(widget.calendarIcon)
                      ],
                    ),
                  )),
        ],
      ),
    );
  }
}
