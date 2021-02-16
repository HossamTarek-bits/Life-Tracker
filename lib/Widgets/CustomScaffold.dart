import 'package:flutter/material.dart';
import '../Constants.dart';

class CustomScaffold extends StatelessWidget {
  CustomScaffold({this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kBackgroundColor,
        // gradient: LinearGradient(
        //   colors: [
        //     kBackgroundColor,
        //   ],
        //   begin: Alignment.bottomCenter,
        //   end: Alignment.topCenter,
        // ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Hi,Hossam"),
          shadowColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.transparent,
        ),
        endDrawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text(
                  'Drawer Header',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.analytics_sharp),
                title: Text('Compare'),
                onTap: () {
                  Navigator.pushNamed(context, '/Compare');
                },
              ),
              ListTile(
                leading: Icon(Icons.account_circle),
                title: Text('Profile'),
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: child,
        ),
      ),
    );
  }
}
