import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class CustomModalSheet extends StatefulWidget {
  CustomModalSheet(this.allTags);
  final List<dynamic> allTags;
  @override
  _CustomModalSheetState createState() => _CustomModalSheetState();
}

class _CustomModalSheetState extends State<CustomModalSheet> {
  var selectedTag;
  var dropDownMenus;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedTag = widget.allTags[0];
    dropDownMenus = widget.allTags
        .map(
          (tag) => DropdownMenuItem(
            value: tag,
            child: Text(tag),
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text("Add or Update Stats"),
          Row(
            children: [
              Expanded(child: Text("Tags: ")),
              Expanded(
                flex: 3,
                child: DropdownButtonFormField(
                    value: selectedTag,
                    onChanged: (item) {
                      selectedTag = item;
                    },
                    items: dropDownMenus),
              )
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Text("Value: "),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: RadioWidget(
                        value: -10,
                      ),
                    ),
                    Expanded(
                      child: RadioWidget(
                        value: -5,
                      ),
                    ),
                    Expanded(
                      child: RadioWidget(
                        value: 0,
                      ),
                    ),
                    Expanded(
                      child: RadioWidget(
                        value: 5,
                      ),
                    ),
                    Expanded(
                      child: RadioWidget(
                        value: 10,
                      ),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class RadioWidget extends StatefulWidget {
  RadioWidget({this.value});
  final int value;

  @override
  _RadioWidgetState createState() => _RadioWidgetState();
}

class _RadioWidgetState extends State<RadioWidget> {
  int value;
  int groupValue;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    value = widget.value;
    groupValue = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Radio(
      value: value,
      groupValue: groupValue,
      onChanged: (int item) {
        setState(
          () {
            groupValue = item;
          },
        );
      },
    );
  }
}
