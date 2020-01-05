import 'package:flutter/material.dart';
import 'package:playground_in_flutter/common/text_style.dart';
import 'package:playground_in_flutter/common/example.dart';

class ScaffoldPage2 extends StatefulWidget {
  final String title;
  ScaffoldPage2({Key key, this.title}) : super(key: key);

  @override
  _ScaffoldPage2State createState() => _ScaffoldPage2State();
}

class _ScaffoldPage2State extends State<ScaffoldPage2> {
  int _selectedIndex = 1;
  final Color appBarBackgroundColor = Colors.yellow[600];
  final Color bottomNavigationBarColor = Colors.grey[600];
  final Color bottomNavigationBarTintColor = Colors.yellow[600];
  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title ?? 'Container - Scaffold 进阶用法'),
        leading: appBarLeading(),
        actions: appBarActions(),
        backgroundColor: appBarBackgroundColor,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 44.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Text("FloatingActionButton", style: AppTextStyle.titleTextStyle1),
              Text(
                "BottomAppBar 中嵌入 FloatingActionButton",
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
      floatingActionButton: FloatingActionButton(
				backgroundColor: appBarBackgroundColor,
        child: Icon(Icons.add),
        onPressed: _onAdd,
      ),
			floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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
    return null;
  }

  // 导航栏右侧按钮
  List<Widget> appBarActions() {
    return null;
  }

  // 底部导航
  Widget bottomNavigationBar() {
    return BottomAppBar(
      color: Colors.white,
      shape: CircularNotchedRectangle(), // 底部导航栏打一个圆形的洞
      child: Row(
        children: [
          IconButton(icon: Icon(Icons.home)),
          SizedBox(), //中间位置空出
          IconButton(icon: Icon(Icons.business)),
        ],
        mainAxisAlignment: MainAxisAlignment.spaceAround, //均分底部导航栏横向空间
      ),
    );
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////

  Widget example() {
    return Example(
      child: Text("Material组件库中提供了一个BottomAppBar 组件，它可以和FloatingActionButton配合实现这种“打洞”效果。"),
      title: "Title",
      subtitle: "Subtitle",
    );
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////

}
