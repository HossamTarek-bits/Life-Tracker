import 'package:flutter/material.dart';
import '../Backend/DataBase.dart';
import 'package:moor/moor.dart';

class DataBaseLogic {
  var allTags;
  var allStats;

  MyDatabase db = MyDatabase();

  Future<List<Stat>> getSpecificTag(tag) {
    return (db.select(db.statistics)
          ..where((tbl) => tbl.tag.equals(tag))
          ..orderBy([(tbl) => OrderingTerm(expression: tbl.date)]))
        .get();
  }

  Future addStats(StatisticsCompanion entry) {
    return db.into(db.statistics).insert(entry);
  }

  Future<List<dynamic>> getAllTags() async {
    var temp = await ((db.selectOnly(db.statistics, distinct: true)
          ..addColumns([db.statistics.tag]))
        .get());
    var tags = [];
    for (TypedResult i in temp) {
      tags.add(i.read(db.statistics.tag));
    }
    return tags;
  }

  // Stream<List<dynamic>> watchAllTags() {
  //   return ((db.selectOnly(db.statistics, distinct: true)
  //         ..addColumns([db.statistics.tag]))
  //       .watch());
  // }

  void removeAll() {
    db.delete(db.statistics).go();
  }

  Future initialize() async {
    allTags = await getAllTags();
    allStats = [];
    for (var tag in allTags) {
      allStats.add(await getSpecificTag(tag));
    }
    return;
  }

  void removeSpecificTag(String tag) {
    db.delete(db.statistics)
      ..where((tbl) => tbl.tag.equals(tag))
      ..go();
  }

  Future reload() async {
    initialize();
  }

  // Stream<List<Stat>> watchEntriesInTag(String c) {
  //   return (db.select(db.statistics)..where((t) => t.tag.equals(c))).watch();
  // }
  //
  // Stream<List<Stat>> watchDataBase() {
  //   return (db.select(db.statistics).watch());
  // }
}
