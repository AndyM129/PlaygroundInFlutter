import 'package:flutter/material.dart';
import 'package:playground_in_flutter/common/text_style.dart';
import 'package:playground_in_flutter/common/example.dart';
import 'package:playground_in_flutter/playground/container_widget/tabbar_widget/tabbar_widget_page_2.dart';

class TabBarPage extends StatefulWidget {
  final String title;
  TabBarPage({Key key, this.title}) : super(key: key);

  @override
  _TabBarPageState createState() => _TabBarPageState();
}

class _TabBarPageState extends State<TabBarPage>
    with SingleTickerProviderStateMixin {
  final Color appBarBackgroundColor = Colors.red[600];

  @override
  void initState() {
    super.initState();
    initAppBarBottomTabBar();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title ?? 'Container - TabBar'),
        actions: appBarActions(),
        backgroundColor: appBarBackgroundColor,
        bottom: appBarBottomTabBar(),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 44.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Text("TabBar", style: AppTextStyle.titleTextStyle1),
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

  // 导航栏右侧按钮
  List<Widget> appBarActions() {
    return [
      new IconButton(
        icon: Icon(Icons.arrow_upward, color: Colors.white),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return TabBarPage2();
          }));
        },
      ),
    ];
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////

  TabController _tabController; //需要定义一个Controller
  List tabs = ["关注", "推荐", "科技", "娱乐", "问答", "电影", "军事", "收藏", "关注"];

// 初始化Tab菜单
  void initAppBarBottomTabBar() {
    _tabController = TabController(length: tabs.length, vsync: this);
    _tabController.addListener(() {
      print(
          "点击了下标为 ${_tabController.index} 的 “${tabs[_tabController.index]}” 频道");
    });
  }

  // 生成Tab菜单
  Widget appBarBottomTabBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(48),
      child: Material(
        color: Colors.white,
        child: TabBar(
          controller: _tabController,
          isScrollable: true,
          indicatorColor: Colors.white,
          labelColor: Colors.red,
          unselectedLabelColor: Colors.grey,
          tabs: tabs.map((e) => Tab(text: e)).toList(),
        ),
      ),
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
