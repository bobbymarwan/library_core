import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CustomColumnSeries<T, D> extends ColumnSeries<T, D> {
    CustomColumnSeries(
      {required List<T> dataSource,
      required ChartValueMapper<T, D> xValueMapper,
      required ChartValueMapper<T, num> yValueMapper,
      ChartValueMapper<T, Color>? pointColorMapper,
      ChartValueMapper<T, String>? dataLabelMapper,
      DataLabelSettings? dataLabelSettings,
      ChartValueMapper<T, String>? sortFieldValueMapper,
      bool isVisibleLegend = true,
      String? xAxisName,
      String? yAxisName,
      String? name,
      Color? color,
          double? width,
          double? spacing,
      })
      : super(
            width: width ?? 0.5,
            spacing: spacing ?? 0.05,
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
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(4), topRight: Radius.circular(4)));
}
