import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CustomStackColumnSeries<T, D> extends StackedColumnSeries<T, D> {
  CustomStackColumnSeries(
      {required List<T> dataSource,
      required ChartValueMapper<T, D> xValueMapper,
      required ChartValueMapper<T, num> yValueMapper,
      ChartValueMapper<T, Color>? pointColorMapper,
      ChartValueMapper<T, String>? dataLabelMapper,
      DataLabelSettings? dataLabelSettings,
      ChartValueMapper<T, String>? sortFieldValueMapper,
      bool isVisibleLegend = false,
      String? xAxisName,
      String? yAxisName,
      String? name,
      String? groupName,
      Color? color,
          double? width,
          double? spacing,
      })
      : super(
            width: width ?? 1.0,
            spacing: spacing ?? 0.1,
            color: color,
            legendIconType: LegendIconType.circle,
            dataSource: dataSource,
            xValueMapper: xValueMapper,
            yValueMapper: yValueMapper,
            pointColorMapper: pointColorMapper,
            dataLabelMapper: dataLabelMapper,
            dataLabelSettings: dataLabelSettings,
            sortFieldValueMapper: sortFieldValueMapper,
            isVisibleInLegend: isVisibleLegend,
            xAxisName: xAxisName,
            yAxisName: yAxisName,
            name: name,
            groupName: groupName,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(4), topRight: Radius.circular(4)));
}
