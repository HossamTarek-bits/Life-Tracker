import 'package:flutter/material.dart';
import 'package:life_tracker/Backend/DataBaseLogic.dart';
import '../Widgets/GraphCard.dart';

List<GraphData> getGraphDataForTag(List<dynamic> allStats, String tag) {
  var stats = allStats.where((stat) => stat[0].tag == tag).toList();
  List<DateTime> dates = [];
  List<int> values = [];
  for (var stat in stats) {
    dates.add(stat[0].date);
    values.add(stat[0].value);
  }
  List<GraphData> dataSource = [];
  for (int i = 0; i < stats.length; i++) {
    dataSource.add(
      GraphData(dates[i], values[i], tag),
    );
  }
  return dataSource;
}

List<GraphCard> getAllGraphCards(var allStats) {
  List<GraphCard> cards = [];
  for (var groupOfStats in allStats) {
    List<DateTime> dates = [];
    List<int> values = [];
    String tag;
    for (var stat in groupOfStats) {
      dates.add(stat.date);
      values.add(stat.value);
      tag = stat.tag;
    }
    cards.add(GraphCard(
      tag: tag,
      dates: dates,
      values: values,
    ));
  }
  return cards;
}
