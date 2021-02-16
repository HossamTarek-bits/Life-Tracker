import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:life_tracker/Backend/DataBaseLogic.dart';
import '../Utils/GraphBuilder.dart';
import '../Constants.dart';
import '../Widgets/TagsButton.dart';
import 'dart:math';

class GraphViewer extends StatefulWidget {
  GraphViewer({this.reload});

  final reload;
  @override
  _GraphViewerState createState() => _GraphViewerState();
}

class _GraphViewerState extends State<GraphViewer> {
  var graphCards;
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    graphCards = getAllGraphCards(context.read<DataBaseLogic>().allStats);
    return Card(
      elevation: 4,
      shadowColor: Colors.grey[300],
      margin: EdgeInsets.all(15),
      color: kCardBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: graphCards.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: 100,
                    child: ListTile(
                      title: TagsButton(
                        borderColor: kAccentColors[0],
                        backgroundColor: kShadowColors[0],
                        tag: graphCards[index].tag,
                        onPressed: () {
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
                    ),
                  );
                },
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Padding(
              padding: EdgeInsets.only(right: 30),
              child: graphCards[selectedIndex],
            ),
          ),
        ],
      ),
    );
  }
}
