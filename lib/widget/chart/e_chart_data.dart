import 'package:flutter/material.dart';

class EChartData {
  dynamic x;
  dynamic y;
  int? id;
  double? position;
  double? spacing;
  Color? color;
  String? labelValue;
  String? labelY;
  String? entityName;
  double? yPosition;
  double? additionalValue;
  EChartData(this.x, this.y, {this.id,this.labelY, this.color, this.labelValue, this.spacing, this.entityName, this.position, this.additionalValue});

  Map toJson() => {
    'x': x,
    'y': y,
    'id': id,
    'position': position,
    'spacing': spacing,
    'labelValue': labelValue,
    'labelY': labelY,
    'entityName': entityName
  };
}