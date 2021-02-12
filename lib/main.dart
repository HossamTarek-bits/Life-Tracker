import 'package:flutter/material.dart';
import 'Screens/Home.dart';
import 'Screens/Compare.dart';
import 'package:provider/provider.dart';
import 'Backend/DataBaseLogic.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DataBaseLogic dbLogic = DataBaseLogic();
  await dbLogic.initialize();
  // var allTags = await db.getAllTags();
  // List<List<Stat>> allStats = [];
  // for (var tag in allTags) {
  //   allStats.add(await db.getSpecificTag(tag));
  // }
  runApp(MyApp(dbLogic));
}

class MyApp extends StatelessWidget {
  MyApp(this.db);
  DataBaseLogic db;
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => db,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(),
        initialRoute: '/',
        routes: {
          '/': (context) => Home(),
          '/Compare': (context) => Compare(),
        },
      ),
    );
  }
}
