import 'dart:math';

import 'package:animations/second_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/second':
            return PageTransition(
              child: SecondPage(),
              type: PageTransitionType.topToBottom,
              duration: Duration(seconds: 1),
            );
            break;
          default:
            return null;
        }
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  final random = Random();
  double width = 100;
  double height = 100;
  double _angle = 0;
  double _value = 0;
  AnimationController _animationController;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this,
        duration: Duration(seconds: 3),
        debugLabel: "Hello Animation")
      ..repeat(
        reverse: true,
      );
    _animation =
        CurvedAnimation(parent: _animationController, curve: Curves.linear);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello Animation"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              BtnAnimation(
                width: _animationController,
              ),
              SizedBox(
                height: 20,
              ),
              RotationTransition(
                turns: _animation,
                child: Container(
                  alignment: Alignment.center,
                  width: 200,
                  height: 50,
                  color: Colors.cyan[200],
                  child: Text(
                    "Explicit Animation",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TweenAnimationBuilder<double>(
                tween: Tween(begin: 0, end: _angle),
                duration: Duration(seconds: 1),
                child: Container(
                  alignment: Alignment.center,
                  width: 200,
                  height: 50,
                  color: Colors.indigoAccent,
                  child: Text(
                    "Tween Animation",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
                builder: (context, double _angle, child) =>
                    Transform.rotate(angle: _angle, child: child),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: AnimatedContainer(
                  duration: Duration(seconds: 3),
                  width: width,
                  height: height,
                  color: Colors.cyan,
                  curve: Curves.bounceInOut,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Slider(
                value: _value,
                onChanged: (val) {
                  setState(() {
                    _angle = val;
                    _value = val;
                  });
                },
                divisions: 4,
                min: 0,
                max: pi * 2,
              ),
              SizedBox(
                height: 20,
              ),
              CupertinoButton(
                color: Colors.pink[100],
                onPressed: () {
                  Navigator.pushNamed(context, '/second');
                },
                child: Text("GoTo Animation Page"),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            width = random.nextInt(300).toDouble();
            height = random.nextInt(100).toDouble();
          });
        },
        tooltip: 'Increment',
        child: Icon(Icons.animation),
      ),
    );
  }
}

class BtnAnimation extends AnimatedWidget {
  const BtnAnimation({
    width,
  }) : super(listenable: width);
  Animation<double> get width => listenable;
  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      onPressed: () {},
      borderSide: BorderSide(
        width: width.value * 3,
        color: Colors.black,
      ),
      child: Text(
        "Tween Animation",
        style: TextStyle(
          color: Colors.pink,
          fontSize: 20,
        ),
      ),
    );
  }
}
