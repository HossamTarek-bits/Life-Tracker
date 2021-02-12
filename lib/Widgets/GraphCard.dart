import 'package:flutter/material.dart';
import '../Constants.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class GraphCard extends StatelessWidget {
  GraphCard({this.tag, this.dates, this.values});
  final String tag;
  final List<DateTime> dates;
  final List<int> values;

  List<LineSeries<GraphData, DateTime>> getSources(
      String tag, List<DateTime> dates, List<int> values) {
    List<GraphData> dataSource = [];
    List<LineSeries<GraphData, DateTime>> sources = [];
    for (int i = 0; i < dates.length; i++) {
      dataSource.add(
        GraphData(
          dates[i],
          values[i],
        ),
      );
    }
    sources.add(
      LineSeries<GraphData, DateTime>(
        animationDuration: 1000,
        // Bind data source
        dataSource: dataSource,
        markerSettings: MarkerSettings(isVisible: true),
        width: 2,
        name: tag,
        xValueMapper: (GraphData graphData, _) => graphData.date,
        yValueMapper: (GraphData graphData, _) => graphData.value,
        // dataLabelSettings: DataLabelSettings(isVisible: true),
      ),
    );

    return sources;
  }

  @override
  Widget build(BuildContext context) {
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
        majorTickLines: MajorTickLines(width: 0),
        minorTickLines: MinorTickLines(width: 0),
        axisLine: AxisLine(width: 0, color: Colors.transparent),
        majorGridLines: MajorGridLines(width: 0),
        minorGridLines: MinorGridLines(width: 0),
      ),
      primaryXAxis: DateTimeAxis(
        axisLine: AxisLine(
          color: Colors.white,
        ),
        majorTickLines: MajorTickLines(width: 0),
        minorTickLines: MinorTickLines(width: 0),
        majorGridLines: MajorGridLines(width: 0),
        minorGridLines: MinorGridLines(width: 0),
      ),
      // Chart title
      title: ChartTitle(
        text: tag,
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
      series: getSources(tag, dates, values),
    );
  }
}

class GraphData {
  GraphData(this.date, this.value);
  DateTime date;
  int value;
}
