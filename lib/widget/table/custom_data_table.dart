import 'dart:math';

import 'package:library_core/widget/custom_text.dart';
import 'package:library_core/widget/empty_widget.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:library_core/styles/my_color.dart';
import 'package:library_core/styles/my_style.dart';
import 'package:library_core/misc/constant.dart';
import 'package:get/get.dart';

import 'item_data_cell.dart';
import 'web_pagination.dart';

enum TableMode {
  DataTable,
  DataTable2,
}

class CustomDataTable extends StatefulWidget {
  final bool isLoading;
  final List<DataColumn> columns;
  final List<DataRow> rows;
  final int? sortColumnIndex;
  final bool sortAscending;
  final int currentPage;
  final int pageTotal;
  final int perPage;
  final Function(int)? onPageChange;
  final ValueChanged<int?>? onChangedPerpage;
  final bool isPagination;
  final double? tableHeight;
  final bool showCheckboxColumn;
  final Function(bool?)? onSelectAll;
  final TableMode? tableMode;
  final double? table2MinWidth;

  const CustomDataTable(
      {super.key,
      this.isLoading = false,
      required this.columns,
      required this.rows,
      this.sortColumnIndex,
      this.sortAscending = false,
      this.currentPage = 1,
      this.pageTotal = -1,
      this.perPage = 10,
      this.onPageChange,
      this.onChangedPerpage,
      this.isPagination = true,
      this.tableHeight,
      this.showCheckboxColumn = true,
      this.onSelectAll,
      this.tableMode,
      this.table2MinWidth
      });

  @override
  State<CustomDataTable> createState() => _CustomDataTableState();
}

class _CustomDataTableState extends State<CustomDataTable> {
  final _verticalScrollController = ScrollController();
  final _horizontalScrollController = ScrollController();

  final _perPage = [10, 50, 100];
  late int _perPageSelected = 10;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _tableView,
        widget.onPageChange != null ? _footerWidget : SizedBox.shrink()],
    );
  }

  Widget get _tableView {
    switch(widget.tableMode) {
      case TableMode.DataTable2:
          return widget.rows.isNotEmpty ? _dataTable2: _dataTable;
      default:
        return _dataTable;
    }
  }

  Widget get _dataTable => Container(
      constraints: const BoxConstraints(
          minWidth: double.infinity,
          maxWidth: double.infinity,
          minHeight: 100,
      ),
      child: Scrollbar(
          controller: _verticalScrollController,
          thumbVisibility: true,
          child: SingleChildScrollView(
        controller: _verticalScrollController,
        child: Scrollbar(
            controller: _horizontalScrollController,
            thumbVisibility: true,
            child: SingleChildScrollView(
                controller: _horizontalScrollController,
                scrollDirection: Axis.horizontal,
                child: Column(
                  children: [
                    Theme(
                        data: ThemeData(
                            useMaterial3: true,
                            dividerTheme: const DividerThemeData(color: Colors.transparent)),
                        child: DataTable(
                          showCheckboxColumn: widget.showCheckboxColumn,
                          headingRowColor: MaterialStateColor.resolveWith((states) => MyColor.secondary),
                          headingRowHeight: 46,
                          dataRowMinHeight: 40,
                          columnSpacing: 16,
                          columns: widget.columns,
                          rows: !widget.isLoading ? widget.rows : _rowsShimmer,
                        )),
                    if (!widget.isLoading && widget.rows.isEmpty) _emptyWidget
                  ],
                )
            )
        ),
      ))
  );

  Widget get _dataTable2 => Column(
    children: [
      SizedBox(
        height: widget.tableHeight ?? Get.height,
        child: widget.rows.isNotEmpty ? DataTable2(
          showCheckboxColumn: widget.showCheckboxColumn,
          columnSpacing: 12,
          headingRowHeight: 46.0,
          dataRowHeight: 40,
          minWidth: widget.table2MinWidth ?? 200,
          dividerThickness: 0.0,
          headingRowColor: MaterialStateProperty.resolveWith(
                  (states) =>  MyColor.white),
          headingRowDecoration: BoxDecoration(
              // borderRadius: BorderRadius.circular(8.0),
              color: MyColor.secondary
          ),
          onSelectAll: widget.onSelectAll,
          columns: widget.columns,
          rows: !widget.isLoading ? widget.rows : _rowsShimmer,
        ) : _emptyWidget
      ),
    ],
  );

  Widget get _footerWidget => widget.isPagination
      ? Container(
    margin: EdgeInsets.only(top: kPadding20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        _perPageWidget,
        const SizedBox(width: kPadding20),
        _pageOfTotalWidget,
        const SizedBox(width: kPadding20),
        _paginationWidget,
      ],
    )
  )
      : Container();

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

  Widget get _emptyWidget => Container(
        height: 100,
        child: Center(
          child: EmptyWidget(),
        ),
      );

  List<DataRow> get _rowsShimmer => List.generate(
      10,
      (index) => DataRow(
          cells: List.generate(
              widget.columns.length, (index) => ItemDataCell.shimmer())));
}
