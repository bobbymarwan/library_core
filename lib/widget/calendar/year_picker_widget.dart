import 'dart:ui';

import 'package:library_core/widget/buttons/button_primary.dart';
import 'package:library_core/widget/custom_ink_well.dart';
import 'package:library_core/widget/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:library_core/misc/constant.dart';
import 'package:library_core/styles/my_color.dart';
import 'package:library_core/styles/my_style.dart';

class YearPickerWidget extends StatefulWidget {
  final DateTime minDate;
  final DateTime maxDate;
  final DateTime initialDate;
  final int? columnCount;
  final String? btnText;
  final Function(List<DateTime>)? onChange;
  final Function(List<DateTime>)? onPressed;

  YearPickerWidget({super.key,
  required this.initialDate,
  required this.minDate,
  required this.maxDate,
  this.columnCount,
  this.btnText,
  this.onChange,
  this.onPressed
  }): assert(!minDate.isAfter(maxDate));

  @override
  _YearPickerWidgetState createState() => _YearPickerWidgetState();
}

class _YearPickerWidgetState extends State<YearPickerWidget> with SingleTickerProviderStateMixin {
  DateTime? _selectedYear;
  DateTimeRange? _displayedRange;

  final GlobalKey _pageViewKey = GlobalKey();
  late final PageController _pageController;

  int get pageCount =>
      ((widget.maxDate.year - widget.minDate.year + 1) / 12).ceil();

  int get initialPageNumber {
    final page =
        ((widget.initialDate.year - widget.minDate.year + 1) / 12).ceil() - 1;
    if (page < 0) return 0;
    return page;
  }

  DateTimeRange calculateDateRange(int pageIndex) {
    return DateTimeRange(
      start: DateTime(widget.minDate.year + pageIndex * 12),
      end: DateTime(widget.minDate.year + pageIndex * 12 + 12 - 1),
    );
  }

  @override
  void initState() {
    _pageController = PageController(initialPage: initialPageNumber);

    _displayedRange = DateTimeRange(
      start: DateTime(widget.minDate.year + initialPageNumber * 12),
      end: DateTime(widget.minDate.year + initialPageNumber * 12 - 1 + 12),
    );
    _selectedYear = widget.initialDate;
    // _selectedYear = widget.selectedDate;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant YearPickerWidget oldWidget) {
    if (oldWidget.initialDate.year != widget.initialDate.year) {
      _pageController.jumpToPage(initialPageNumber);

      _displayedRange = DateTimeRange(
        start: DateTime(widget.minDate.year + initialPageNumber * 12),
        end: DateTime(widget.minDate.year + initialPageNumber * 12 - 1 + 12),
      );
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Widget _buildItems(BuildContext context, int index) {
    final yearRange = calculateDateRange(index);

    return YearView(
      key: ValueKey<DateTimeRange>(yearRange),
      currentDate: DateTime.now(),
      minDate: widget.minDate,
      maxDate: widget.maxDate,
      displayedYearRange: yearRange,
      selectedYear: _selectedYear,
      onChanged: (value) {
        setState(() {
          _selectedYear = value;
        });
        // var startDate = DateTime(value.year, 1);
        // var endDate = DateTime(value.year + 1, value.month, 0);
        if(widget.onPressed == null) {
          widget.onChange?.call([getDates(value)[0], getDates(value)[1]]);
        }
      },
    );
  }

  List<DateTime> getDates(DateTime dateTime){
    var startDate = DateTime(dateTime.year, 1, 1);
    var endDate = DateTime(dateTime.year + 1, 1, 0);

    return [startDate, endDate];
  }

  void _handleYearPageChanged(int yearPage) {
    setState(() {
      _displayedRange = calculateDateRange(yearPage);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            IconButton(
              onPressed: () {
                _pageController.previousPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.ease,
                );
              },
              icon: Icon(Icons.navigate_before_rounded),
            ),
            Expanded(
              child: Center(
                child: Text(
                  '${_displayedRange?.start.year} - ${_displayedRange?.end.year}',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                _pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.ease,
                );
              },
              icon: Icon(Icons.navigate_next_rounded),
            ),
          ],
        ),
        SizedBox(height: kPadding32),
        AnimatedContainer(
          height: 78 * 4,
          duration: const Duration(milliseconds: 200),
          child: PageView.builder(
            scrollDirection: Axis.horizontal,
            key: _pageViewKey,
            controller: _pageController,
            itemCount: pageCount,
            itemBuilder: _buildItems,
            onPageChanged: _handleYearPageChanged,
          ),
        ),
        SizedBox(height: kPadding32),
        ButtonPrimary.medium(
            isExpand: true,
            text: widget.btnText ?? 'OK', onPressed: widget.onPressed != null ? (){

          widget.onPressed?.call([getDates(_selectedYear ?? widget.initialDate)[0], getDates(_selectedYear ?? widget.initialDate)[1]]);
          Navigator.pop(context);
        } : null)
      ],
    );
  }
}

class YearView extends StatelessWidget {
  YearView({
  super.key,
  required this.currentDate,
  required this.onChanged,
  required this.minDate,
  required this.maxDate,
  required this.displayedYearRange,
  this.selectedYear,
  this.columnCount
  })  : assert(!minDate.isAfter(maxDate), "minDate can't be after maxDate"),
  assert(() {
  return (displayedYearRange.end.year -displayedYearRange.start.year) == 11;
  }(), "the display year range must always be 12 years.");


  final DateTime? selectedYear;
  final DateTime currentDate;
  final ValueChanged<DateTime> onChanged;
  final DateTime minDate;
  final DateTime maxDate;
  final DateTimeRange displayedYearRange;
  final int? columnCount;

  @override
  Widget build(BuildContext context) {
    final int currentYear = currentDate.year;
    final int startYear = displayedYearRange.start.year;
    final int endYear = displayedYearRange.end.year;
    final int numberOfYears = endYear - startYear + 1;

    final yearsName = List.generate(
      numberOfYears,
          (index) => startYear + index,
    );

    final yearWidgetsList = <Widget>[];

    int i = 0;
    while (i < numberOfYears) {
      final bool isDisabled =
          yearsName[i] > maxDate.year || yearsName[i] < minDate.year;

      final bool isCurrentYear = yearsName[i] == currentYear;

      // final bool isSelected = yearsName[i] == selectedYear?.year;
       bool isSelected = false;
      if(selectedYear != null){
        isSelected = yearsName[i] == selectedYear?.year;
      } else {
        isSelected = yearsName[i] == currentYear;
      }


      BoxDecoration decoration = BoxDecoration();
      TextStyle style = TextStyle();
      const double decorationHeight = 36.0;

      // if (isCurrentYear) {
      //   //
      //   //
      //   style = MyStyle.avenir14Regular.copyWith(color: MyColor.white);
      //   decoration = BoxDecoration(
      //     color: MyColor.pgnBlue,
      //       borderRadius: BorderRadius.circular(decorationHeight / 2)
      //   );
      // }
      if (isSelected) {
        style = MyStyle.body1Regular.copyWith(color: MyColor.white);
        decoration = BoxDecoration(
            color: MyColor.primary,
            borderRadius: BorderRadius.circular(decorationHeight / 2)
        );
      }

      if (isDisabled) {
        style = MyStyle.body1Regular.copyWith(color: MyColor.grey4);
        decoration = BoxDecoration(
            // color: MyColor.grey.withOpacity(0.5),
            borderRadius: BorderRadius.circular(decorationHeight / 2)
        );
      }

      Widget monthWidget = Container(
        decoration: decoration,
        child: Center(
          child: CustomText(
            yearsName[i].toString(),
            style: style,
          ),
        ),
      );

      if (isDisabled) {
        monthWidget = ExcludeSemantics(
          child: monthWidget,
        );
      } else {
        final date = DateTime(yearsName[i]);
        monthWidget = CustomInkWell(
          onTap: () {
            onChanged(date);
          },
          child: Semantics(
            label: yearsName[i].toString(),
            selected: isSelected,
            excludeSemantics: true,
            child: monthWidget,
          ),
        );
      }

      yearWidgetsList.add(monthWidget);
      i++;
    }
    return GridView.custom(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: PickerGridDelegate(
        columnCount: columnCount ?? 3,
        rowExtent: 40,
        rowStride: 80,
      ),
      childrenDelegate: SliverChildListDelegate(
        yearWidgetsList,
        addRepaintBoundaries: false,
      ),
    );
  }
}

class PickerGridDelegate extends SliverGridDelegate {

  const PickerGridDelegate({
    required this.columnCount,
    required this.rowExtent,
    required this.rowStride,
    this.columnPadding = 0,
  });

  /// The number of columns in the cross axis.
  final int columnCount;

  /// The amount of padding between columns in the cross axis.
  final double columnPadding;

  /// The number of pixels from the leading edge of one tile to the trailing edge of the same tile in the main axis.
  final double rowExtent;

  /// The number of pixels from the leading edge of one tile to the leading edge of the next tile in the main axis.
  final double rowStride;

  @override
  SliverGridLayout getLayout(SliverConstraints constraints) {
    final double tileWidth = constraints.crossAxisExtent / columnCount;

    return SliverGridRegularTileLayout(
      // to add padding between cells.
      childCrossAxisExtent: tileWidth - columnPadding,
      childMainAxisExtent: rowExtent - columnPadding,
      crossAxisCount: columnCount,
      crossAxisStride: tileWidth,
      mainAxisStride: rowStride,
      reverseCrossAxis: axisDirectionIsReversed(constraints.crossAxisDirection),
    );
  }

  @override
  bool shouldRelayout(PickerGridDelegate oldDelegate) => false;
}
