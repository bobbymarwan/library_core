import 'package:library_core/misc/constant.dart';
import 'package:library_core/widget/empty_widget.dart';
import 'package:flutter/material.dart';
import 'package:library_core/styles/my_color.dart';
import 'package:library_core/styles/my_style.dart';
import 'package:library_core/widget/custom_text.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CustomDoughnutChartWidget<T, D> extends StatelessWidget {
  final List<T>? dataSource;
  final ChartValueMapper<T, D> xValueMapper;
  final ChartValueMapper<T, num> yValueMapper;
  final ChartValueMapper<T, Color>? pointColorMapper;
  final ChartShaderMapper<T>? pointShaderMapper;
  final ChartValueMapper<T, String>? pointRadiusMapper;
  final ChartValueMapper<T, String>? dataLabelMapper;
  final ChartValueMapper<T, String>? sortFieldValueMapper;
  final List<Color>? palette;
  final bool isVisibleLegend;
  final String? annotationTotal;
  final bool isVisibleLabel;
  final CircularSeriesRendererCreatedCallback? onRendererCreated;
  final ChartSeriesRendererFactory<T, D>? onCreateRenderer;
  final Widget? customLegend;
  final bool loading;

  CustomDoughnutChartWidget(
      {super.key,
      this.dataSource,
      required this.xValueMapper,
      required this.yValueMapper,
      this.pointColorMapper,
      this.pointShaderMapper,
      this.pointRadiusMapper,
      this.dataLabelMapper,
      this.sortFieldValueMapper,
      this.palette,
      this.isVisibleLegend = false,
      this.isVisibleLabel = true,
      this.annotationTotal,
      this.onRendererCreated,
      this.onCreateRenderer,
      this.customLegend,
      this.loading = false});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: !loading ? dataSource != null ? Column(
        children: [
          SizedBox(
              height: 228,
              child: SfCircularChart(
                key: key,
                palette: palette ?? [MyColor.chart1, MyColor.chart2, MyColor.chart3, MyColor.chart4, MyColor.chart5, MyColor.chart6, MyColor.chart7, MyColor.chart8],
                legend: customLegend != null ? null : Legend(
                    isVisible: isVisibleLegend,
                    position: LegendPosition.bottom,
                    overflowMode: LegendItemOverflowMode.wrap,
                    legendItemBuilder:
                        (String name, dynamic series, dynamic point, int index) {
                      return Container(
                          width: 150,
                          height: 40,
                          margin: EdgeInsets.only(bottom: kPadding16),
                          child: Row(
                            children: [
                              Container(
                                width: 10,
                                height: 10,
                                margin: EdgeInsets.only(right: kPadding10),
                                decoration: BoxDecoration(
                                    color: point.color, shape: BoxShape.circle),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(point.x),
                                  CustomText(point.y.toString())
                                ],
                              )
                            ],
                          ));
                    }),
                annotations: [
                  if(annotationTotal?.isNotEmpty == true) CircularChartAnnotation(
                      radius: '0%',
                      height: '80%',
                      horizontalAlignment: ChartAlignment.center,
                      verticalAlignment: ChartAlignment.center,
                      widget: CustomText(annotationTotal ?? '', style: MyStyle.body2Regular.copyWith(color: MyColor.dark)))
                ],
                series: [
                  DoughnutSeries<T, D>(
                    animationDuration: 1000,
                    innerRadius: '55%',
                    dataLabelSettings: DataLabelSettings(
                        showZeroValue: false,
                        isVisible: isVisibleLabel,
                        textStyle: MyStyle.smallBody2Regular.copyWith(color: MyColor.white, fontSize: 8),
                        connectorLineSettings: ConnectorLineSettings(width: 0)
                    ),
                    dataLabelMapper: dataLabelMapper,
                    dataSource: dataSource,
                    legendIconType: LegendIconType.circle,
                    pointColorMapper: pointColorMapper,
                    xValueMapper: xValueMapper,
                    yValueMapper: yValueMapper,
                    onRendererCreated: onRendererCreated,
                    onCreateRenderer: onCreateRenderer,
                  ),
                ],
              )
          ),
          if(customLegend != null)
            Container(
              child: customLegend,
            )
        ],
      ) : Center(child: EmptyWidget())
          : Center(child: CircularProgressIndicator()
      )
    );
  }
}
