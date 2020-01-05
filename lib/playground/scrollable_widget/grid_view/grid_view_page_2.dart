import 'package:flutter/material.dart';
import 'package:playground_in_flutter/common/text_style.dart';
import 'package:playground_in_flutter/common/example.dart';
import 'package:playground_in_flutter/common/example_page.dart';

class GridViewPage2 extends StatefulWidget {
  final String title;
  GridViewPage2({Key key, this.title}) : super(key: key);

  @override
  _GridViewPage2State createState() => _GridViewPage2State();
}

class _GridViewPage2State extends State<GridViewPage2> {
  List<IconData> _icons = []; //保存Icon数据

  @override
  void initState() {
    _retrieveIcons(); // 初始化数据
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title ?? appBarDefaultTitle()),
      ),
      body: body(),
    );
  }

  // 导航栏右侧按钮
  List<Widget> appBarActions() {
    return null;
		// return [
    //   new IconButton(
    //     icon: Icon(Icons.arrow_upward, color: Colors.white),
    //     onPressed: () {
    //       Navigator.push(context, MaterialPageRoute(builder: (context) {
    //         return ExamplePage();
    //       }));
    //     },
    //   ),
    // ];
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

  Widget body() {
    return Scrollbar(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, //每行三列
          childAspectRatio: 1.0, //显示区域宽高相等
        ),
        itemCount: _icons.length,
        itemBuilder: (context, index) {
          //如果显示到最后一个并且Icon总数小于200时继续获取数据
          if (index == _icons.length - 1 && _icons.length < 200) {
            _retrieveIcons();
          }
          return Icon(_icons[index]);
        },
      ),
    );
  }

  //模拟异步获取数据
  void _retrieveIcons() {
    Future.delayed(Duration(milliseconds: 200)).then((e) {
      setState(() {
        _icons.addAll([
          Icons.ac_unit,
          Icons.airport_shuttle,
          Icons.all_inclusive,
          Icons.beach_access,
          Icons.cake,
          Icons.free_breakfast
        ]);
      });
    });
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////

}
