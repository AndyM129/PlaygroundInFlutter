import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:playground_in_flutter/common/text_style.dart';
import 'package:playground_in_flutter/common/example.dart';
import 'package:playground_in_flutter/playground/scrollable_widget/grid_view/grid_view_page_2.dart';

class GridViewPage extends StatefulWidget {
  final String title;
  GridViewPage({Key key, this.title}) : super(key: key);

  @override
  _GridViewPageState createState() => _GridViewPageState();
}

class _GridViewPageState extends State<GridViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title ?? appBarDefaultTitle()),
        actions: appBarActions(),
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 44.0),
          child: Column(
            children: <Widget>[
              exampleHeader(),
              example(),
              example2(),
              example3(),
              example4(),
              example5(),
            ],
          ),
        ),
      ),
    );
  }

  // 导航栏右侧按钮
  List<Widget> appBarActions() {
    return [
      IconButton(
        icon: Icon(Icons.arrow_upward, color: Colors.white),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return GridViewPage2();
          }));
        },
      ),
    ];
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////

  final String chapterTitle = "Widget";
  final String widgetTitle = "GridView";
  final String widgetSubtitle = "GridView可以构建一个二维网格列表";

  String appBarDefaultTitle() {
    return "${chapterTitle ?? ""}${chapterTitle == null ? "" : " - "}${widgetTitle ?? ""}";
  }

  Widget exampleHeader() {
    return ExampleHeader(
      title: widgetTitle ?? "",
      subtitle: widgetSubtitle,
    );
  }

  Widget example() {
    return Example(
      child: Container(
        height: 200,
        child: GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, //横轴三个子widget
              childAspectRatio: 1.0, //宽高比为1时，子widget
            ),
            children: <Widget>[
              Icon(Icons.ac_unit),
              Icon(Icons.airport_shuttle),
              Icon(Icons.all_inclusive),
              Icon(Icons.beach_access),
              Icon(Icons.cake),
              Icon(Icons.free_breakfast)
            ]),
      ),
      title: "SliverGridDelegateWithFixedCrossAxisCount",
      subtitle: "该子类实现了一个横轴为固定数量子元素的layout算法",
    );
  }

  Widget example2() {
    return Example(
      child: Container(
        height: 200,
        child: GridView.count(
          crossAxisCount: 3,
          childAspectRatio: 1.0,
          children: <Widget>[
            Icon(Icons.ac_unit),
            Icon(Icons.airport_shuttle),
            Icon(Icons.all_inclusive),
            Icon(Icons.beach_access),
            Icon(Icons.cake),
            Icon(Icons.free_breakfast),
          ],
        ),
      ),
      title: "GridView.count",
      subtitle:
          "GridView.count构造函数内部使用了SliverGridDelegateWithFixedCrossAxisCount，我们通过它可以快速的创建横轴固定数量子元素的GridView",
    );
  }

  Widget example3() {
    return Example(
      child: Container(
        height: 200,
        child: GridView(
          padding: EdgeInsets.zero,
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 120.0, childAspectRatio: 2.0, //宽高比为2
          ),
          children: <Widget>[
            Icon(Icons.ac_unit),
            Icon(Icons.airport_shuttle),
            Icon(Icons.all_inclusive),
            Icon(Icons.beach_access),
            Icon(Icons.cake),
            Icon(Icons.free_breakfast),
          ],
        ),
      ),
      title: "SliverGridDelegateWithMaxCrossAxisExtent",
      subtitle: "该子类实现了一个横轴子元素为固定最大长度的layout算法",
    );
  }

  Widget example4() {
    return Example(
      child: Container(
        height: 200,
        child: GridView.extent(
          maxCrossAxisExtent: 120.0,
          childAspectRatio: 2.0,
          children: <Widget>[
            Icon(Icons.ac_unit),
            Icon(Icons.airport_shuttle),
            Icon(Icons.all_inclusive),
            Icon(Icons.beach_access),
            Icon(Icons.cake),
            Icon(Icons.free_breakfast),
          ],
        ),
      ),
      title: "GridView.extent",
      subtitle:
          "GridView.extent构造函数内部使用了SliverGridDelegateWithMaxCrossAxisExtent，我们通过它可以快速的创建纵轴子元素为固定最大长度的的GridView",
    );
  }

  Widget example5() {
    return Example(
      child: Container(
        height: 200,
        child: StaggeredGridView.countBuilder(
          crossAxisCount: 4,
          itemCount: 8,
          itemBuilder: (BuildContext context, int index) => Container(
            color: Colors.green,
            child: Center(
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text('$index'),
              ),
            ),
          ),
          staggeredTileBuilder: (int index) =>
              StaggeredTile.count(2, index.isEven ? 2 : 1),
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
        ),
      ),
      title: "flutter_staggered_grid_view",
      subtitle:
          "Pub上有一个包“flutter_staggered_grid_view” ，它实现了一个交错GridView的布局模型，可以很轻松的实现这种布局",
    );
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////

}
