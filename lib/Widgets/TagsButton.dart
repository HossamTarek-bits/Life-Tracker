import 'package:flutter/material.dart';
import '../Constants.dart';

class TagsButton extends StatelessWidget {
  TagsButton({this.tag, this.onPressed, this.onLongPress});

  final String tag;
  final Function onPressed;
  final Function onLongPress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      onLongPress: onLongPress,
    );
    // child: );
  }
}
