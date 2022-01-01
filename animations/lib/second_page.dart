import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:residemenu/residemenu.dart';
import 'package:slide_popup_dialog/slide_popup_dialog.dart' as slideDialog;

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage>
    with SingleTickerProviderStateMixin {
  MenuController _menuController;
  @override
  void initState() {
    _menuController =
        MenuController(vsync: this, direction: ScrollDirection.LEFT);
    super.initState();
  }

  @override
  void dispose() {
    _menuController.dispose();
    super.dispose();
  }

  Widget buildItem(msg) {
    return new Material(
      color: Colors.transparent,
      child: new InkWell(
        child: const ResideMenuItem(
          title: "Hello Animation",
          icon: const Icon(Icons.home, color: Colors.grey),
          right: const Icon(Icons.arrow_forward, color: Colors.grey),
        ),
        onTap: () {
          _menuController.closeMenu();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.white,
              content: new Text(
                'Hello $msg',
                style: TextStyle(
                  color: Colors.pinkAccent,
                  fontSize: 25,
                ),
              ),
            ),
          );
        },
      ),
    );
  }


  void _showDialog() {
  slideDialog.showSlideDialog(
    context: context,
    child: Text("Hello World"),
    barrierColor: Colors.black87,
  );
}

  @override
  Widget build(BuildContext context) {
    return ResideMenu.scaffold(
      controller: _menuController,
      leftScaffold: new MenuScaffold(
        header: new ConstrainedBox(
          constraints: new BoxConstraints(maxHeight: 80.0, maxWidth: 80.0),
          child: new CircleAvatar(
            backgroundColor: Colors.pinkAccent,
            radius: 40.0,
          ),
        ),
        children: <Widget>[
          buildItem("Ahmed1"),
          buildItem("Ahmed2"),
          buildItem("Ahmed3"),
          buildItem("Ahmed4"),
          buildItem("Ahmed5"),
        ],
      ),
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
               _showDialog();
              },
              icon: Icon(
                Icons.control_point_duplicate,
                size: 40,
              ),),
          ],
          leading: IconButton(
              onPressed: () {
                _menuController.openMenu(true);
              },
              icon: Icon(
                Icons.menu_open,
                size: 40,
              ),),
        ),
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.pink[100],
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LikeButton(
                size: 40,
                circleColor: CircleColor(
                    start: Color(0xff00ddff), end: Color(0xff0099cc)),
                bubblesColor: BubblesColor(
                  dotPrimaryColor: Color(0xff33b5e5),
                  dotSecondaryColor: Color(0xff0099cc),
                ),
                likeBuilder: (bool isLiked) {
                  return Icon(
                    Icons.favorite,
                    color: isLiked ? Colors.deepPurpleAccent : Colors.red,
                    size: 40,
                  );
                },
                likeCount: 665,
                countBuilder: (int count, bool isLiked, String text) {
                  var color = isLiked ? Colors.deepPurpleAccent : Colors.grey;
                  Widget result;
                  if (count == 0) {
                    result = Text(
                      "love",
                      style: TextStyle(color: color),
                    );
                  } else
                    result = Text(
                      text,
                      style: TextStyle(color: color),
                    );
                  return result;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
