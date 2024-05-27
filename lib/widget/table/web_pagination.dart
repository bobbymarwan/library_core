import 'package:library_core/widget/custom_ink_well.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:library_core/styles/my_color.dart';
import 'package:library_core/styles/my_style.dart';
import 'package:library_core/misc/constant.dart';

class WebPagination extends StatefulWidget {
  /// Creates a NumberPagination widget.
  WebPagination(
      {super.key,
      required this.onPageChanged,
      required this.pageTotal,
      this.threshold = 5,
      this.pageInit = 1,
      this.perPage = 10,
      this.padding,
      this.loading = false,
      this.margin});

  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  ///Trigger when page changed
  final Function(int) onPageChanged;

  ///End of numbers.
  final int pageTotal;

  final int perPage;

  ///Page number to be displayed first
  int pageInit;

  ///Numbers to show at once.
  final int threshold;

  ///show loading
  final bool loading;

  @override
  WebPaginationState createState() => WebPaginationState();
}

class WebPaginationState extends State<WebPagination> {
  late int rangeStart;
  late int rangeEnd;
  // late int currentPage;

  bool get isLastPage => widget.pageInit * widget.perPage >= widget.pageTotal;

  bool get isFirstPage => widget.pageInit == 1;

  bool get isNextPageDisabled => isLastPage;

  bool get isPreviousPageDisabled => isFirstPage;

  @override
  void initState() {
    super.initState();
    // Helper.log("CEK PAGE INIT STATE ${widget.pageInit}");
    // currentPage = widget.pageInit;
    // Helper.log("CEK CURRENT PAGE INI  ${currentPage}");
    _rangeSet();
  }

  // Widget _pageItem(
  //     {required bool checked, required String page, VoidCallback? onTap}) {
  //   return CustomInkWell(
  //       onTap: !checked ? onTap : null,
  //       child: Container(
  //           alignment: Alignment.center,
  //           width: 40,
  //           height: 40,
  //           margin: const EdgeInsets.symmetric(horizontal: 4),
  //           // padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
  //           constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
  //           decoration: BoxDecoration(
  //             color: checked ? MyColor.dark : Colors.transparent,
  //             borderRadius: BorderRadius.circular(6),
  //           ),
  //           child: CustomText(page, style: MyStyle.body1Bold)));
  // }

  Widget _defaultControlButton(
      {required bool enable,
      required IconData iconData,
      required VoidCallback onTap}) {
    return CustomInkWell(
        onTap: enable ? onTap : null,
        child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 4),
            constraints: const BoxConstraints(minWidth: 20, minHeight: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
            ),
            child: Icon(iconData,
                size: 14,
                color:
                enable ? MyColor.dark : MyColor.grey4)));
  }

  void _changePage(int page) {
    if (page <= 0) page = 1;

    if (page > widget.pageTotal) page = widget.pageTotal;

    setState(() {
      widget.pageInit = page;
      _rangeSet();
      widget.onPageChanged(widget.pageInit);
    });
  }

  void _rangeSet() {
    rangeStart = widget.pageInit % widget.threshold == 0
        ? widget.pageInit - widget.threshold
        : (widget.pageInit ~/ widget.threshold) * widget.threshold;

    if (widget.pageInit > (rangeStart + (widget.threshold ~/ 2)) &&
        ((widget.threshold ~/ 2) + widget.threshold) < widget.pageTotal) {
      rangeStart += widget.threshold ~/ 2;
    } else if (widget.pageTotal >= (widget.threshold ~/ 2) &&
        widget.pageInit >= widget.pageTotal - (widget.threshold ~/ 2)) {
      rangeStart = widget.pageTotal - widget.threshold;
      if (rangeStart < 0) {
        rangeStart = 0;
      }
    }

    rangeEnd = rangeStart + widget.threshold;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: widget.padding,
      margin: widget.margin,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _defaultControlButton(
              enable: widget.pageInit > 1,
              iconData: CupertinoIcons.chevron_left,
              onTap: () => _changePage(--widget.pageInit)),
          _defaultControlButton(
              enable: !isNextPageDisabled,
              iconData: CupertinoIcons.chevron_right,
              onTap: () => _changePage(++widget.pageInit)),
        ],
      ),
    );
  }
}
