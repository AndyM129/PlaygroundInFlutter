import 'package:flutter/material.dart';
import 'package:playground_in_flutter/common/text_style.dart';
import 'package:playground_in_flutter/common/example.dart';
import 'package:playground_in_flutter/playground/container_widget/drawer_widget/my_drawer.dart';

class DrawerPage extends StatefulWidget {
  final String title;
  DrawerPage({Key key, this.title}) : super(key: key);

  @override
  _DrawerPageState createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title ?? 'Container - Drawer')),
      endDrawer: MyDrawer(), //抽屉
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 44.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Text("Drawer", style: AppTextStyle.titleTextStyle1),
              Text(
                "Scaffold的drawer和endDrawer属性可以分别接受一个Widget来作为页面的左、右抽屉菜单。如果开发者提供了抽屉菜单，那么当用户手指从屏幕左（或右）侧向里滑动时便可打开抽屉菜单。本节开始部分的示例中实现了一个左抽屉菜单MyDrawer",
                style: AppTextStyle.tipsTextStyle,
              ),
              Divider(color: Colors.black),
              Padding(padding: EdgeInsets.only(top: 20.0)),
              example(),
            ],
          ),
        ),
      ),
    );
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////

  Widget example() {
    return Example(
      child: Text("点击导航栏右侧按钮体验，\n或通过手指从屏幕右侧末端向内拖拽 也可达到相同效果", textAlign: TextAlign.center),
      title: "endDrawer",
    );
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////

}
