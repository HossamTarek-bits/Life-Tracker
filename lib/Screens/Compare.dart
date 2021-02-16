import 'package:flutter/material.dart';
import 'package:life_tracker/Backend/DataBaseLogic.dart';
import '../Widgets/CustomScaffold.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../Widgets/GraphCard.dart';
import '../Utils/GraphBuilder.dart';

class Compare extends StatefulWidget {
  @override
  _CompareState createState() => _CompareState();
}

class _CompareState extends State<Compare> {
  var allStats;
  List<dynamic> compareTags;
  var menuItems;
  var selectedItem;

  List<LineSeries<GraphData, DateTime>> sources = [];

  void addGraphData(tag) => sources.add(LineSeries<GraphData, DateTime>(
        animationDuration: 1000,
        // Bind data source
        dataSource: getGraphDataForTag(allStats, tag),
        markerSettings: MarkerSettings(isVisible: true),
        width: 2,
        name: tag,
        xValueMapper: (GraphData graphData, _) => graphData.date,
        yValueMapper: (GraphData graphData, _) => graphData.value,
      ));

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    compareTags = context.read<DataBaseLogic>().allTags;
    allStats = context.read<DataBaseLogic>().allStats;
    menuItems = getDropdownMenuItems();
  }

  List<DropdownMenuItem<dynamic>> getDropdownMenuItems() => compareTags
      .map(
        (tag) => DropdownMenuItem(
          value: tag,
          child: Text(tag),
        ),
      )
      .toList();

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButton(
                  value: selectedItem,
                  onChanged: (item) {
                    setState(() {
                      addGraphData(item);
                      selectedItem = item;
                    });
                  },
                  items: menuItems,
                ),
              ),
            ],
          ),
          Expanded(
              child: GraphCard(
            data: sources,
          ))
        ],
      ),
    );
  }
}
