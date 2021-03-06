import 'package:flutter/material.dart';
import 'package:life_tracker/Backend/DataBase.dart';
import 'package:life_tracker/Backend/DataBaseLogic.dart';
import 'package:moor/moor.dart' hide Column;
import 'package:provider/provider.dart';
import '../Widgets/WelcomeCard.dart';
import '../Widgets/modalSheet.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import '../Widgets/GraphViewer.dart';
import '../Widgets/CustomScaffold.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<dynamic> allTags;
  var allStats;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    allTags = context.read<DataBaseLogic>().allTags;
    allStats = context.read<DataBaseLogic>().allStats;
  }

  void reload() async {
    await context.read<DataBaseLogic>().initialize();
    setState(() {
      allTags = context.read<DataBaseLogic>().allTags;
      allStats = context.read<DataBaseLogic>().allStats;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Column(
        children: [
          WelcomeCard(),
          Expanded(
            flex: 5,
            child: GraphViewer(
              reload: reload,
            ),
          ),
          Expanded(
            child: Row(
              children: [
                FloatingActionButton(
                  onPressed: () => showBarModalBottomSheet(
                    expand: true,
                    context: context,
                    builder: (context) => CustomModalSheet(allTags),
                  ),
                ),
                // RaisedButton(
                //   onPressed: () async {
                //     context.read<DataBaseLogic>().removeAll();
                //     reload();
                //   },
                //   color: Colors.red,
                // ),
                // RaisedButton(
                //   onPressed: () async {
                //     await context.read<DataBaseLogic>().addStats(
                //           StatisticsCompanion(
                //             tag: Value(Random().nextInt(10).toString()),
                //             value: Value(10 - Random().nextInt(21)),
                //             date: Value(
                //               DateTime(
                //                 2021,
                //                 1 + Random().nextInt(12),
                //                 1 + Random().nextInt(31),
                //               ),
                //             ),
                //           ),
                //         );
                //     reload();
                //   },
                // )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
