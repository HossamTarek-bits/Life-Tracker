import 'package:flutter/material.dart';
import '../Constants.dart';

class TagsButton extends StatelessWidget {
  TagsButton(
      {this.tag,
      this.onPressed,
      this.onLongPress,
      this.borderColor,
      this.backgroundColor});

  final String tag;
  final Function onPressed;
  final Function onLongPress;
  final borderColor;
  final backgroundColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: 60,
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: borderColor,
            ),
            bottom: BorderSide(
              color: borderColor,
            ),
            left: BorderSide(
              color: borderColor,
            ),
            right: BorderSide(
              color: borderColor,
            ),
          ),
          borderRadius: BorderRadius.circular(50),
          color: backgroundColor,
        ),
        child: Text(
          tag,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16, color: kTextColor),
        ),
      ),
      onTap: onPressed,
      onLongPress: onLongPress,
    );
    // child: );
  }
}
