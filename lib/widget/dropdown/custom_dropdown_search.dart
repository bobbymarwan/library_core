import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:library_core/styles/my_color.dart';
import 'package:library_core/styles/my_style.dart';
import 'package:library_core/misc/constant.dart';
import 'package:library_core/widget/custom_text.dart';

class CustomDropdownSearch<T> extends StatelessWidget {
  final List<T> items;
  final DropdownSearchItemAsString<T>? itemAsString;
  final T? selectedItem;
  final List<T> selectedItems;
  final Function(T, T)? compareFn;
  final Function(T, String)? filterFn;
  final Function(BuildContext, T, bool)? itemBuilder;
  final bool showSearchBox;
  final bool isMultiSelectionMode;
  final String? errorText;
  final ValueChanged<T?>? onChanged;
  final ValueChanged<List<T>>? onChangedMultiSelection;
  final DropdownSearchBuilder<T>? dropdownBuilder;
  final DropdownSearchBuilderMultiSelection<T>? dropdownBuilderMultiSelection;
  final bool enabled;

  const CustomDropdownSearch(
      {super.key,
      required this.items,
      this.errorText,
      this.itemAsString,
      this.onChanged,
      required this.selectedItem,
      this.compareFn,
      this.filterFn,
      this.itemBuilder,
      this.dropdownBuilder,
      this.showSearchBox = false,
      this.enabled = true})
      : isMultiSelectionMode = false,
        selectedItems = const [],
        dropdownBuilderMultiSelection = null,
        onChangedMultiSelection = null;

  const CustomDropdownSearch.multiSelection({
    super.key,
    required this.items,
    this.itemAsString,
    this.errorText,
    this.selectedItems = const [],
    this.compareFn,
    this.filterFn,
    this.itemBuilder,
    this.showSearchBox = false,
    this.enabled = true,
    Function(List<T>)? onChanged,
    DropdownSearchBuilderMultiSelection<T>? dropdownBuilder,
  })  : isMultiSelectionMode = true,
        selectedItem = null,
        onChangedMultiSelection = onChanged,
        onChanged = null,
        dropdownBuilderMultiSelection = dropdownBuilder,
        dropdownBuilder = null;

  @override
  Widget build(BuildContext context) {
    return isMultiSelectionMode
        ? _dropdownMultiSelection
        : _dropdownSingleSelection;
  }

  Widget get _dropdownSingleSelection {
    return ConstrainedBox(
        constraints: BoxConstraints(minHeight: 36),
        // height: 36,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownSearch<T>(
              key: const ValueKey('permission_single_access_dropdown'),
              items: items,
              itemAsString: itemAsString,
              onChanged: onChanged,
              selectedItem: selectedItem,
              enabled: enabled,
              dropdownButtonProps: DropdownButtonProps(
                  padding: EdgeInsets.zero,
                  icon: Icon(Icons.keyboard_arrow_down,
                      size: 20, color: MyColor.dark)),
              dropdownBuilder: dropdownBuilder,
              dropdownDecoratorProps: DropDownDecoratorProps(
                dropdownSearchDecoration: InputDecoration(
                    isDense: true,
                    // errorText: errorText != null && errorText!.isNotEmpty
                    // ? errorText
                    //     : null,
                    // errorStyle:
                    // MyStyle.smallBody1Regular.copyWith(color: Colors.red),
                    hintText: "Select Permission Access",
                    hintStyle:
                        MyStyle.body2Regular.copyWith(color: MyColor.grey5),
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: kPadding10),
                    errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: MyColor.grey4),
                        borderRadius: BorderRadius.circular(8)),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: MyColor.grey4),
                        borderRadius: BorderRadius.circular(8)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: MyColor.grey4),
                        borderRadius: BorderRadius.circular(8)),
                    disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: MyColor.grey6),
                        borderRadius: BorderRadius.circular(8)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: MyColor.grey4),
                        borderRadius: BorderRadius.circular(8)),
                    filled: true,
                    fillColor: enabled ? MyColor.white : MyColor.grey4),
              ),
              compareFn: (a, b) => compareFn?.call(a, b),
              filterFn: (a, b) => filterFn?.call(a, b),
              popupProps: PopupPropsMultiSelection.menu(
                showSelectedItems: true,
                showSearchBox: showSearchBox,
                selectionWidget: (context, item, selected) => Container(),
                itemBuilder: (context, item, selected) =>
                    itemBuilder?.call(context, item, selected),
                textStyle: MyStyle.body2Regular.copyWith(color: MyColor.dark),
                constraints:
                    const BoxConstraints(minHeight: 100, maxHeight: 250),
                searchFieldProps: TextFieldProps(
                  autofocus: true,
                  padding: EdgeInsets.zero,
                  style: MyStyle.body2Regular.copyWith(color: MyColor.dark),
                  decoration: InputDecoration(
                      isDense: true,
                      errorText: errorText,
                      contentPadding: EdgeInsets.symmetric(
                          vertical: kPadding12, horizontal: kPadding10),
                      prefixIcon: Icon(Icons.search),
                      hintText: 'Search Items',
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: MyColor.grey4)),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: MyColor.grey4)),
                      disabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: MyColor.grey4)),
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(color: MyColor.grey4)),
                      filled: true,
                      fillColor: enabled ? MyColor.white : MyColor.grey4
                      // prefix: Icon(Icons.search),
                      ),
                ),
              ),
            ),
            if (errorText != null && errorText?.isNotEmpty == true)
              Container(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: CustomText(errorText!,
                      style: MyStyle.smallBody1Regular
                          .copyWith(color: MyColor.red))),
          ],
        ));
  }

  Widget get _dropdownMultiSelection {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DropdownSearch<T>.multiSelection(
          key: this.key,
          items: items,
          itemAsString: itemAsString,
          onChanged: onChangedMultiSelection,
          selectedItems: selectedItems,
          enabled: enabled,
          dropdownButtonProps: DropdownButtonProps(
              padding: EdgeInsets.zero,
              icon: Icon(
                Icons.keyboard_arrow_down,
                size: 20,
                color: MyColor.dark,
              )),
          dropdownBuilder: dropdownBuilderMultiSelection,
          dropdownDecoratorProps: DropDownDecoratorProps(
            dropdownSearchDecoration: InputDecoration(
                isDense: true,
                // errorText: errorText != null && errorText!.isNotEmpty
                //     ? errorText
                //     : null,
                // errorStyle:
                //     MyStyle.smallBody1Regular.copyWith(color: Colors.red),
                hintText: "Select Permission Access",
                hintStyle: MyStyle.body2Regular.copyWith(color: MyColor.grey5),
                contentPadding: EdgeInsets.symmetric(
                    vertical: kPadding12, horizontal: kPadding10),
                errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: MyColor.grey4),
                    borderRadius: BorderRadius.circular(8)),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: MyColor.grey4),
                    borderRadius: BorderRadius.circular(8)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: MyColor.grey4),
                    borderRadius: BorderRadius.circular(8)),
                disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: MyColor.grey6),
                    borderRadius: BorderRadius.circular(8)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: MyColor.grey4),
                    borderRadius: BorderRadius.circular(8)),
                filled: true,
                fillColor: enabled ? MyColor.white : MyColor.grey4),
          ),
          compareFn: (a, b) => compareFn?.call(a, b),
          filterFn: (a, b) => filterFn?.call(a, b),
          popupProps: PopupPropsMultiSelection.menu(
            showSelectedItems: true,
            showSearchBox: showSearchBox,
            selectionWidget: (context, item, selected) => Container(),
            itemBuilder: (context, item, selected) =>
                itemBuilder?.call(context, item, selected),
            constraints: const BoxConstraints(minHeight: 100, maxHeight: 250),
            searchFieldProps: TextFieldProps(
              autofocus: true,
              padding: EdgeInsets.zero,
              decoration: InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(
                      vertical: kPadding12, horizontal: kPadding10),
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search Items',
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: MyColor.grey4)),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: MyColor.grey4)),
                  border: UnderlineInputBorder(
                      borderSide: BorderSide(color: MyColor.grey4)),
                  filled: true,
                  fillColor: enabled ? MyColor.white : MyColor.grey1),
            ),
          ),
        ),
        if (errorText != null && errorText?.isNotEmpty == true)
          Container(
              padding: const EdgeInsets.only(top: 8.0),
              child: CustomText(errorText!,
                  style:
                      MyStyle.smallBody1Regular.copyWith(color: MyColor.red))),
      ],
    );
  }
}
