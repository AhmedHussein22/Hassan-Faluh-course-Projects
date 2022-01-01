import 'package:dark/providers/theme.dart';
import 'package:dark/screens/homePage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/count.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Count>(create: (_) => Count()),
        ChangeNotifierProvider<DarkMode>(create: (_) => DarkMode()),
      ],
      child: Consumer<DarkMode>(builder: (_, darkMode, child) {
        return MaterialApp(
          debugShowMaterialGrid: false,
          debugShowCheckedModeBanner: false,
          title: 'Provider',
          darkTheme: darkMode.isdark ? ThemeData.dark() : ThemeData.light(),
          theme: ThemeData(
            primaryColor: Colors.deepPurple[900],
            accentColor: Colors.white,
          ),
          home: MyHomePage(),
        );
      }),
    );
  }
}
