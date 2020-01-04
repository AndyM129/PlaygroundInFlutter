import 'package:flutter/material.dart';
import 'package:playground_in_flutter/common/text_style.dart';
import 'package:playground_in_flutter/common/example.dart';

class ScaffoldPage extends StatefulWidget {
  final String title;
  ScaffoldPage({Key key, this.title}) : super(key: key);

  @override
  _ScaffoldPageState createState() => _ScaffoldPageState();
}

class _ScaffoldPageState extends State<ScaffoldPage> {
  int _selectedIndex = 1;
  final Color appBarBackgroundColor = Colors.black87;
  final Color bottomNavigationBarColor = Colors.grey[600];
  final Color bottomNavigationBarTintColor = Colors.green;
  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title ?? 'Container - Scaffold'),
        leading: appBarLeading(),
        actions: appBarActions(),
        backgroundColor: appBarBackgroundColor,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 44.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Text("Scaffold", style: AppTextStyle.titleTextStyle1),
              Text(
                "一个完整的路由页可能会包含导航栏、抽屉菜单(Drawer)以及底部Tab导航菜单等。如果每个路由页面都需要开发者自己手动去实现这些，这会是一件非常麻烦且无聊的事。幸运的是，Flutter Material组件库提供了一些现成的组件来减少我们的开发任务。Scaffold是一个路由页的骨架，我们使用它可以很容易地拼装出一个完整的页面。",
                style: AppTextStyle.tipsTextStyle,
              ),
              Divider(color: Colors.black),
              Padding(padding: EdgeInsets.only(top: 20.0)),
              example(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: bottomNavigationBar(),
    );
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onAdd() {}

  ////////////////////////////////////////////////////////////////////////////////////////////////////

  // 导航栏左侧按钮
  Widget appBarLeading() {
    return Builder(builder: (context) {
      return IconButton(
        icon: Icon(Icons.menu, color: Colors.white), //自定义图标
        onPressed: () {
          // 打开抽屉菜单
          Scaffold.of(context).openDrawer();
        },
      );
    });
  }

  // 导航栏右侧按钮
  List<Widget> appBarActions() {
    return [
      new IconButton(
        icon: Icon(Icons.refresh, color: Colors.white),
        onPressed: () {
          print("object");
        },
      ),
    ];
  }

  // 底部导航
  Widget bottomNavigationBar() {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.message, color: bottomNavigationBarColor),
          activeIcon: Icon(Icons.message, color: bottomNavigationBarTintColor),
          title: Text('消息', style: AppTextStyle.titleTextStyle5),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.contacts, color: bottomNavigationBarColor),
          activeIcon: Icon(Icons.contacts, color: bottomNavigationBarTintColor),
          title: Text('联系人', style: AppTextStyle.titleTextStyle5),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.near_me, color: bottomNavigationBarColor),
          activeIcon: Icon(Icons.near_me, color: bottomNavigationBarTintColor),
          title: Text('动态', style: AppTextStyle.titleTextStyle5),
        ),
      ],
      currentIndex: _selectedIndex,
      fixedColor: Colors.blue,
      onTap: _onItemTapped,
    );
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////

  Widget example() {
    return Example(
      child: Text("playground"),
      title: "Title",
      subtitle: "Subtitle",
    );
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////

}
