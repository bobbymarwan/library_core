import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

class CustomLineChartWidget extends StatefulWidget {
  final List<CartesianChartAnnotation>? annotations;
  final dynamic series;
  final double? maximumLabelWidth;
  final NumberFormat? numberFormatYAxis;
  final bool loading;
  final bool isLegend;
  final Function(BuildContext, TrackballDetails)? customTooltipBuilder;

  CustomLineChartWidget({super.key, this.loading = false, this.maximumLabelWidth, this.series, this.annotations, this.numberFormatYAxis, this.isLegend = true, this.customTooltipBuilder});

  @override
  State<CustomLineChartWidget> createState() => _CustomLineChartWidgetState();
}

class _CustomLineChartWidgetState extends State<CustomLineChartWidget> {
  late TrackballBehavior _trackballBehavior;

  @override
  void initState(){
    _trackballBehavior = TrackballBehavior(
        enable: true,
        lineWidth: 1,
        activationMode: ActivationMode.singleTap,
        tooltipDisplayMode: TrackballDisplayMode.groupAllPoints,
        // shouldAlwaysShow: true,
        markerSettings: const TrackballMarkerSettings(
            height: 10,
            width: 10,
            markerVisibility: TrackballVisibilityMode.visible,
            borderWidth: 4),
      builder: (context, details){
        return widget.customTooltipBuilder?.call(context, details);
      }
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
        legend: Legend(
          isVisible: widget.isLegend,
          position: LegendPosition.bottom,
          alignment: ChartAlignment.near,
          overflowMode: LegendItemOverflowMode.wrap,
        ),
        primaryXAxis: CategoryAxis(
          axisLine: const AxisLine(width: 0.5),
          minimum: 0,
          axisLabelFormatter: (axisLabelRenderArgs) {
            return ChartAxisLabel(
                axisLabelRenderArgs.text, axisLabelRenderArgs.textStyle);
          },
          majorGridLines: const MajorGridLines(width: 0.0),
          minorGridLines: const MinorGridLines(width: 0.0),
        ),
        primaryYAxis: NumericAxis(
          minimum: 0,
          numberFormat: widget.numberFormatYAxis ?? NumberFormat.compactCurrency(symbol: ''),
          majorGridLines: const MajorGridLines(dashArray: [4]),
          minorGridLines: const MinorGridLines(dashArray: [4]),
        ),
        trackballBehavior: _trackballBehavior,
        series: widget.series
    );
  }
}