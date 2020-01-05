import 'package:flutter/material.dart';
import 'package:playground_in_flutter/common/text_style.dart';
import 'package:playground_in_flutter/common/example.dart';
import 'package:playground_in_flutter/common/error_page.dart';

// 示例页面框架
class CustomScrollViewPage extends StatefulWidget {
  final String title;
  CustomScrollViewPage({Key key, this.title}) : super(key: key);

  @override
  _CustomScrollViewPageState createState() => _CustomScrollViewPageState();
}

class _CustomScrollViewPageState extends State<CustomScrollViewPage> {
  @override
  Widget build(BuildContext context) => buildPage();

  // 构建页面
  Widget buildPage() {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildBody(),
    );
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////

  final String chapterTitle = "Scrollable";
  final String widgetTitle = "CustomScrollView";
  final String widgetSubtitle = "Subtitle";

  String appBarDefaultTitle() {
    return "${widgetTitle ?? ""}";
  }

  // 构建导航栏
  Widget buildAppBar() {
    return null;
  }

  // 构建页面内容
  Widget buildBody() {
    return CustomScrollView(
      slivers: <Widget>[
        //AppBar，包含一个导航栏
        SliverAppBar(
          pinned: true,
          expandedHeight: 250.0,
          flexibleSpace: FlexibleSpaceBar(
            title: Text(widget.title ?? appBarDefaultTitle()),
            background: Image.asset(
              "assets/images/logo.png",
              fit: BoxFit.cover,
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.all(8.0),
          sliver: SliverGrid(
            //Grid
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, //Grid按两列显示
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 4.0,
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                //创建子widget
                return Container(
                  alignment: Alignment.center,
                  color: Colors.cyan[100 * (index % 9)],
                  child: Text('grid item $index'),
                );
              },
              childCount: 20,
            ),
          ),
        ),
        //List
        SliverFixedExtentList(
          itemExtent: 50.0,
          delegate:
              SliverChildBuilderDelegate((BuildContext context, int index) {
            return Container(
              alignment: Alignment.center,
              color: Colors.lightBlue[100 * (index % 9)],
              child: Text('list item $index'),
            );
          }, childCount: 50),
        ),
      ],
    );
  }
}
