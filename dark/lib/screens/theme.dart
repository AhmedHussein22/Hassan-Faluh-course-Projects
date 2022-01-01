import 'package:dark/widgets/derwer.dart';
import 'package:flutter/material.dart';

class ThemePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: CustomDerwer(),
        appBar: AppBar(
          title: Text("Theme Page"),
        ),
        body: Container(),
      ),
    );
  }
}
