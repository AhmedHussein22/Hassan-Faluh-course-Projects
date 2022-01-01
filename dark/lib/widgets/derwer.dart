import 'package:dark/providers/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomDerwer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeprovider = Provider.of<DarkMode>(context);
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('Drawer Header'),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            title: Text('Item 1'),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            title: Text('Item 2'),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          SwitchListTile(
            value: themeprovider.isdark,
            onChanged: (bool val) {
              themeprovider.dodarkmode(val);
            },
            title: Text("Dark Theme"),
          ),
        ],
      ),
    );
  }
}
