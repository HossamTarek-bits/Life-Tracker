import 'package:flutter/material.dart';
import 'package:life_tracker/Constants.dart';
import 'package:blobs/blobs.dart';

class WelcomeCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Blob.fromID(
            id: ['12-6-97'],
            size: 100,
          ),
        ),
        Expanded(
          child: Container(
            height: 100,
            width: double.infinity,
            child: Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              color: Colors.transparent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              elevation: 11,
              shadowColor: Colors.transparent,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      "Welcome,",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 20,
                        color: kAccentColors[1],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Text(
                      "Hossam",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 30,
                        color: kTextColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
