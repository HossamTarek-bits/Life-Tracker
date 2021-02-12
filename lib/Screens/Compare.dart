import 'package:flutter/material.dart';
import 'package:life_tracker/Backend/DataBaseLogic.dart';
import '../Constants.dart';
import '../Widgets/CustomScaffold.dart';
import 'package:provider/provider.dart';

class Compare extends StatefulWidget {
  @override
  _CompareState createState() => _CompareState();
}

class _CompareState extends State<Compare> {
  var allStats;
  List<dynamic> allTags;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    allTags = context.read<DataBaseLogic>().allTags;
    allStats = context.read<DataBaseLogic>().allStats;
  }

  List<DropdownMenuItem<dynamic>> getDropdownMenuItems() => allTags
      .map(
        (tag) => DropdownMenuItem(
          value: tag,
          child: Text(tag),
        ),
      )
      .toList();

  @override
  Widget build(BuildContext context) {
    var menuItems = getDropdownMenuItems();
    var startingItem = menuItems[0].value;
    return CustomScaffold(
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButton(
                  value: startingItem,
                  onChanged: (item) {
                    setState(() {
                      startingItem = item;
                    });
                  },
                  items: menuItems,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
