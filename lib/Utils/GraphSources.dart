import 'package:syncfusion_flutter_charts/charts.dart';
import '../Widgets/GraphCard.dart';

List<LineSeries<GraphData, DateTime>> getSources(
    String tag, List<DateTime> dates, List<int> values,
    {List<LineSeries<GraphData, DateTime>> sources}) {
  List<GraphData> dataSource = [];
  sources = sources ?? [];
  for (int i = 0; i < dates.length; i++) {
    dataSource.add(
      GraphData(dates[i], values[i], tag),
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
