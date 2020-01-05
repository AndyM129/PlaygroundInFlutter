import 'package:flutter/material.dart';
import 'package:playground_in_flutter/common/text_style.dart';
import 'package:playground_in_flutter/common/example.dart';
import 'package:playground_in_flutter/common/error_page.dart';

// 示例页面框架
class ExamplePage extends StatefulWidget {
  final String title;
  ExamplePage({Key key, this.title}) : super(key: key);

  @override
  _ExamplePageState createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {
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

  final String chapterTitle = "Widget";
  final String widgetTitle = "WidgetExample";
  final String widgetSubtitle = "Subtitle";

  // 构建导航栏
  Widget buildAppBar() {
    return AppBar(
      title: Text(widget.title ?? appBarDefaultTitle()),
      actions: appBarActions(),
    );
  }

  // 构建页面内容
  Widget buildBody() {
    return Scrollbar(
      child: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 44.0),
        child: Column(children: buildExamples()),
      ),
    );
  }

  String appBarDefaultTitle() {
    return "${chapterTitle ?? ""}${chapterTitle == null ? "" : " - "}${widgetTitle ?? ""}";
  }

  // 导航栏右侧按钮
  List<Widget> appBarActions() {
    return <Widget>[
      new IconButton(
        icon: Icon(Icons.arrow_upward, color: Colors.white),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return ErrorPage();
          }));
        },
      ),
    ];
  }

	////////////////////////////////////////////////////////////////////////////////////////////////////

  // 构建示例
  List<Widget> buildExamples() {
    return <Widget>[
      exampleHeader(),
      example_1(),
    ];
  }

  Widget exampleHeader() {
    return ExampleHeader(
      title: widgetTitle ?? "",
      subtitle: widgetSubtitle ?? "",
    );
  }

  Widget example_1() {
    return Example(
      child: Text("playground"),
      title: "Title",
      subtitle: "Subtitle",
    );
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////

}
