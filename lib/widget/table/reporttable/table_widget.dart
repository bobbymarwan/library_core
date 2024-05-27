import 'dart:math';

import 'package:library_core/widget/custom_text.dart';
import 'package:library_core/widget/empty_widget.dart';
import 'package:library_core/widget/table/reporttable/item_data_column_widget.dart';
import 'package:library_core/widget/table/web_pagination.dart';
import 'package:flutter/material.dart';
import 'package:library_core/styles/my_color.dart';
import 'package:library_core/styles/my_style.dart';
import 'package:library_core/misc/constant.dart';

class TableWidget extends StatefulWidget {
  final List<Widget> headers;
  final List<Widget> dataRows;
  final EdgeInsetsGeometry? margin;
  final String? error;
  final String? emptyText;
  final Widget? emptyWidget;
  final int currentPage;
  final int pageTotal;
  final int perPage;
  final Function(int)? onPageChange;
  final ValueChanged<int?>? onChangedPerpage;
  final bool isLoading;
  final bool isScrollable;
  final double? widthScroll;

  const TableWidget(
      {super.key,
      required this.headers,
      required this.dataRows,
      this.error,
      this.emptyWidget,
      this.emptyText,
      this.margin,
      this.perPage = 10,
      this.currentPage = 1,
      this.pageTotal = -1,
      this.onPageChange,
      this.onChangedPerpage,
      this.isLoading = false,
      this.isScrollable = false,
      this.widthScroll
      });

  @override
  State<TableWidget> createState() => _TableWidgetState();
}

class _TableWidgetState extends State<TableWidget> {
  final _perPage = [
    10, 50, 100
  ];

  late int _perPageSelected = 10;

  @override
  Widget build(BuildContext context) {
    return bodyWidget;
  }

  Widget get bodyWidget {
    if(widget.isScrollable){
      return Container(
          margin: widget.margin,
          child: Column(
            children: [
              SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    width: widget.widthScroll ?? 1200,
                    child: Column(
                      children: [
                        _headerWidget,
                        widget.isLoading
                            ? Column(children: _rowsShimmer)
                            : widget.error?.isNotEmpty == true
                            ? _errorWidget
                            : widget.dataRows.isEmpty
                            ? _emptyWidget
                            : Column(
                            children: widget.dataRows),
                      ],
                    ),
                  )
              ),
              if(widget.onPageChange != null )_footerWidget
            ],
          ));
    } else {
      return Container(
          margin: widget.margin,
          child: Column(
            children: [
              _headerWidget,
              widget.isLoading
                  ? Column(children: _rowsShimmer)
                  : widget.error?.isNotEmpty == true
                  ? _errorWidget
                  : widget.dataRows.isEmpty
                  ? _emptyWidget
                  : Column(
                  children: widget.dataRows),
              if(widget.onPageChange != null )_footerWidget
            ],
          ));
    }
  }

  Widget get _headerWidget => Container(
        height: 46,
        decoration: BoxDecoration(
          color: MyColor.secondary,
          // borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: Row(children: widget.headers),
      );

  Widget get _emptyWidget =>
      widget.emptyWidget ??
      Container(
        height: 100,
        child: Center(
          child: EmptyWidget(),
        ),
      );

  Widget get _errorWidget => Padding(
        padding: const EdgeInsets.all(kPadding16),
        child: Center(
          child: Text(widget.error ?? ''),
        ),
      );

  Widget get _footerWidget => Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      _perPageWidget,
      SizedBox(width: kPadding20),
      _pageOfTotalWidget,
      SizedBox(width: kPadding20),
      _paginationWidget,
    ],
  );

  Widget get _perPageWidget => Container(
      height: 40,
      // width: 160,
      padding: const EdgeInsets.symmetric(horizontal: kPadding8),
      child: Row(
        children: [
          CustomText('Rows per page:',
              style: MyStyle.smallBody1Regular.copyWith(color: MyColor.dark)),
          const SizedBox(width: kPadding10),
          DropdownButtonHideUnderline(
              child: DropdownButton(
                isDense: true,
                icon: const Icon(Icons.arrow_drop_down),
                items: _perPage
                    .map((value) => DropdownMenuItem(
                    value: value,
                    child: CustomText(value.toString(),
                        style: MyStyle.smallBody1Regular.copyWith(color: MyColor.dark))))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _perPageSelected = value!;
                    if (widget.onChangedPerpage != null)
                      widget.onChangedPerpage!(_perPageSelected);
                  });
                },
                value: _perPageSelected,
              ))
        ],
      ));

  Widget get _pageOfTotalWidget => CustomText(
      '${(widget.perPage * widget.currentPage - (widget.perPage - 1))}-${min(widget.perPage * widget.currentPage, widget.pageTotal).toString()} of ${widget.pageTotal}',
      style: MyStyle.smallBody1Regular.copyWith(color: MyColor.dark)
  );

  Widget get _paginationWidget {
    return WebPagination(
      pageInit: widget.currentPage,
      pageTotal: widget.pageTotal,
      perPage: _perPageSelected,
      onPageChanged: widget.onPageChange ?? (value) {},
    );
  }

  List<Widget> get _rowsShimmer => List.generate(10, (index) => Row(children: List.generate(widget.headers.length, (index) => ItemDataColumnWidget.shimmer())));
}
