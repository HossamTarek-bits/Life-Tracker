import '../Widgets/GraphCard.dart';

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
