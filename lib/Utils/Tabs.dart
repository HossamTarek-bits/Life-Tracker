import 'package:flutter/material.dart';

List<Widget> getAllTabs(var tags) {
  List<Widget> tabs = [];
  for (var tag in tags) {
    tabs.add(Tab(
      text: tag,
    ));
  }
  return tabs;
}
