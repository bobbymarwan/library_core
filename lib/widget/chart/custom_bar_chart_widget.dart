import 'package:library_core/misc/constant.dart';
import 'package:library_core/widget/empty_widget.dart';
import 'package:flutter/material.dart';
import 'package:library_core/styles/my_color.dart';
import 'package:library_core/styles/my_style.dart';
import 'package:library_core/widget/custom_text.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';


class CustomBarChartWidget<T, D> extends StatelessWidget {
  final List<CartesianChartAnnotation>? annotations;
  final dynamic series;
  final double? maximumLabelWidth;
  final NumberFormat? numberFormatYAxis;
  final TooltipBehavior? tooltipBehavior;
  final bool loading;
  final Function(LegendTapArgs)? onLegendTapped;
  CustomBarChartWidget({super.key, this.tooltipBehavior, this.loading = false, this.maximumLabelWidth, this.series, this.annotations, this.numberFormatYAxis, this.onLegendTapped});

  @override
  Widget build(BuildContext context) {
    return !loading ? (series != null && series.isNotEmpty ? SfCartesianChart(
        plotAreaBorderWidth: 0.0,
        margin: EdgeInsets.only(top: kPadding16),
        annotations: annotations,
        onLegendTapped: onLegendTapped,
        legend: const Legend(isVisible: true,
          position: LegendPosition.bottom,
          alignment: ChartAlignment.near,
          overflowMode: LegendItemOverflowMode.wrap,
        ),
        primaryYAxis: NumericAxis(
          rangePadding: ChartRangePadding.additional,
          minimum: 0,
            numberFormat: numberFormatYAxis ?? NumberFormat.compactCurrency(symbol: ''),
            axisLine: const AxisLine(width: 0.0),
          majorGridLines: const MajorGridLines(width: 0.0),
          minorGridLines: const MinorGridLines(width: 0.0),
          majorTickLines: const MajorTickLines(width: 0.0),
          minorTickLines: const MinorTickLines(width: 0.0),
        ),
        primaryXAxis: CategoryAxis(
          labelAlignment: LabelAlignment.center,
          axisLine: const AxisLine(width: 0.5),
          maximumLabelWidth: maximumLabelWidth,
          axisLabelFormatter: (axisLabelRenderArgs) {
            return ChartAxisLabel(
                axisLabelRenderArgs.text, axisLabelRenderArgs.textStyle);
          },
          majorGridLines: const MajorGridLines(width: 0.0),
          minorGridLines: const MinorGridLines(width: 0.0),
          majorTickLines: const MajorTickLines(width: 0.0),
          minorTickLines: const MinorTickLines(width: 0.0),
        ),
        tooltipBehavior: tooltipBehavior,
        series: series
    ) : SizedBox(
      height: 400,
      child: Center(child: EmptyWidget())
    )) : const SizedBox(height: 400, child: Center(child: CircularProgressIndicator()));
  }
}
