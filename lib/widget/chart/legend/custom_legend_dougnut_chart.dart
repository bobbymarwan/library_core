import 'package:library_core/misc/helper.dart';
import 'package:library_core/widget/chart/e_chart_data.dart';
import 'package:library_core/widget/custom_ink_well.dart';
import 'package:library_core/widget/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:library_core/misc/constant.dart';
import 'package:library_core/styles/my_color.dart';
import 'package:library_core/styles/my_style.dart';
import 'package:flutter_bootstrap5/flutter_bootstrap5.dart';

class CustomLegendDougnutChart extends StatefulWidget {
  final List<EChartData> chartData;
  final Function(int index, EChartData, bool)? onTap;
  final bool isFormatCurrency;

  CustomLegendDougnutChart(
      {super.key,
      required this.chartData,
      this.isFormatCurrency = true,
      this.onTap});

  @override
  State<CustomLegendDougnutChart> createState() =>
      _CustomLegendDougnutChartState();
}

class _CustomLegendDougnutChartState extends State<CustomLegendDougnutChart> {
  List<bool> enabled = [];
  List<Color> colors = [
    MyColor.chart1,
    MyColor.chart2,
    MyColor.chart3,
    MyColor.chart4,
    MyColor.chart5,
    MyColor.chart6,
    MyColor.chart7,
    MyColor.chart8,
    MyColor.chart1,
    MyColor.chart2,
    MyColor.chart3,
    MyColor.chart4,
    MyColor.chart5,
    MyColor.chart6,
    MyColor.chart7,
    MyColor.chart8
  ];

  @override
  void initState() {
    // TODO: implement initState
    if (widget.chartData.isNotEmpty == true) {
      for (int i = 0; i < widget.chartData.length; i++) {
        enabled.insert(i, true);
      }
    }
    super.initState();
  }

  void _updated(int index, EChartData data) {
    setState(() {
      EChartData charData = data;
      enabled[index] = !enabled[index];
      if (!enabled[index]) {
        charData = EChartData(data.x, 0, color: data.color);
      }
      widget.onTap?.call(index, charData, enabled[index]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return FB5Row(
        classNames: 'justify-content-between g-1',
        children: List.generate(widget.chartData.length, (index) {
          EChartData data = widget.chartData[index];
          Color? color = data.color ?? colors[index];
          return FB5Col(
              classNames: 'col-6',
              child: CustomInkWell(
                  onTap: () {
                    _updated(index, data);
                  },
                  child: Container(
                      child: Row(
                    children: [
                      Container(
                        width: 10,
                        height: 10,
                        margin: EdgeInsets.only(right: kPadding10),
                        decoration: BoxDecoration(
                            color: enabled[index] ? color : MyColor.grey4,
                            shape: BoxShape.circle),
                      ),
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            data.x,
                            style: MyStyle.smallBody2Regular.copyWith(
                                color: enabled[index]
                                    ? MyColor.grey6
                                    : MyColor.grey4),
                          ),
                          data.labelY != null
                              ? CustomText(data.labelY.toString(),
                                  style: MyStyle.smallBody2Regular.copyWith(
                                      color: enabled[index]
                                          ? MyColor.grey6
                                          : MyColor.grey4))
                              : CustomText(
                                  widget.isFormatCurrency
                                      ? Helper.formatCurrency(data.y)
                                      : data.y.toString(),
                                  style: MyStyle.smallBody2Regular.copyWith(
                                      color: enabled[index]
                                          ? MyColor.grey6
                                          : MyColor.grey4))
                        ],
                      ))
                    ],
                  ))));
        }));
  }
}
