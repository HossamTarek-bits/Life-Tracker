import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:life_tracker/Backend/DataBaseLogic.dart';
import 'GraphCard.dart';
import '../Utils/GraphBuilder.dart';
import 'TagsButton.dart';
import '../Constants.dart';

class GraphViewer extends StatefulWidget {
  GraphViewer({this.reload});

  var reload;
  @override
  _GraphViewerState createState() => _GraphViewerState();
}

class _GraphViewerState extends State<GraphViewer> {
  var graphCards;
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    graphCards = getAllGraphCards(context.read<DataBaseLogic>().allStats);
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: graphCards.length,
            itemBuilder: (context, index) {
              return Container(
                width: 80,
                child: ListTile(
                  selectedTileColor: Colors.greenAccent,
                  title: Container(
                    margin: EdgeInsets.all(10),
                    child: Text(
                      graphCards[index].tag,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: kTextColor,
                      ),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  onLongPress: () {
                    context
                        .read<DataBaseLogic>()
                        .removeSpecificTag(graphCards[index].tag);
                    widget.reload();
                  },
                ),
              );
            },
          ),
        ),
        Expanded(
          flex: 10,
          child: Container(
            child: graphCards[selectedIndex],
          ),
        ),
      ],
    );
  }
}
