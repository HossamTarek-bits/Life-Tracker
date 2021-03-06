import 'package:flutter/material.dart';
import '../Constants.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../Utils/GraphSources.dart';

class GraphCard extends StatelessWidget {
  GraphCard({this.tag, this.dates, this.values, this.data});
  final String tag;
  final List<DateTime> dates;
  final List<int> values;
  final data;
  @override
  Widget build(BuildContext context) {
    final sources = data ?? getSources(tag, dates, values);
    return SfCartesianChart(
      zoomPanBehavior: ZoomPanBehavior(

          /// To enable the pinch zooming as true.
          enablePinching: true,
          zoomMode: ZoomMode.x,
          enablePanning: true,
          enableMouseWheelZooming: true),

      plotAreaBorderColor: Colors.transparent,
      primaryYAxis: NumericAxis(
        visibleMinimum: -20,
        visibleMaximum: 20,
        majorTickLines: MajorTickLines(width: 1),
        minorTickLines: MinorTickLines(width: 0),
        axisLine: AxisLine(width: 0, color: Colors.transparent),
        majorGridLines: MajorGridLines(width: 0),
        minorGridLines: MinorGridLines(width: 0),
      ),
      primaryXAxis: DateTimeAxis(
        axisLine: AxisLine(
          color: Colors.white,
        ),
        majorTickLines: MajorTickLines(width: 1),
        majorGridLines: MajorGridLines(width: 0),
      ),
      // Chart title
      title: ChartTitle(
        text: tag ?? "",
        textStyle: TextStyle(
          color: kTextColor,
          fontWeight: FontWeight.w900,
          fontSize: 16,
        ),
      ),
      // Enable legend
      legend: Legend(isVisible: true),
      // Enable tooltip
      tooltipBehavior: TooltipBehavior(enable: true),
      series: sources,
    );
  }
}

class GraphData {
  GraphData(this.date, this.value, this.tag);
  String tag;
  DateTime date;
  int value;
}
