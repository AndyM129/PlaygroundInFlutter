import 'package:flutter/material.dart';
import 'package:playground_in_flutter/common/text_style.dart';
import 'package:playground_in_flutter/common/example.dart';

class TabBarPage2 extends StatefulWidget {
  final String title;
  TabBarPage2({Key key, this.title}) : super(key: key);

  @override
  _TabBarPage2State createState() => _TabBarPage2State();
}

class _TabBarPage2State extends State<TabBarPage2>
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
        title: Text(widget.title ?? 'Container - TabBar - 进阶用法'),
        backgroundColor: appBarBackgroundColor,
        bottom: appBarBottomTabBar(),
      ),
      body: TabBarView(
        controller: _tabController,
        children: tabs.map((e) {
          return Container(
            alignment: Alignment.center,
            child: Text(
              "$e\n\nTab与页面同步显示",
							textAlign: TextAlign.center,
              textScaleFactor: 2,
              style: TextStyle(color: Colors.grey[300]),
            ),
          );
        }).toList(),
      ),
    );
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
