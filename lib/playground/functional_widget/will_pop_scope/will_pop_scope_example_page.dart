import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:playground_in_flutter/common/text_style.dart';
import 'package:playground_in_flutter/common/example.dart';
import 'package:playground_in_flutter/common/error_page.dart';

// 示例页面框架
class WillPopScopeExamplePage extends StatefulWidget {
  final String title;
  WillPopScopeExamplePage({Key key, this.title}) : super(key: key);

  @override
  _WillPopScopeExamplePageState createState() =>
      _WillPopScopeExamplePageState();
}

class _WillPopScopeExamplePageState extends State<WillPopScopeExamplePage> {
  //上次点击时间
  DateTime _lastPressedAt;

  @override
  Widget build(BuildContext context) => buildPage();

  // 构建页面
  Widget buildPage() {
    return WillPopScope(
      onWillPop: () async {
        if (_lastPressedAt == null || DateTime.now().difference(_lastPressedAt) > Duration(seconds: 1)) {
          _lastPressedAt = DateTime.now(); //两次点击间隔超过1秒则重新计时
          Fluttertoast.showToast(
            msg: "1秒内再次点击则返回上一页",
            gravity: ToastGravity.CENTER,
            timeInSecForIos: 1,
          );
          return false;
        }
        return true;
      },
      child: Scaffold(
        appBar: buildAppBar(),
        body: buildBody(),
      ),
    );
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////

  final String chapterTitle = "Functional";
  final String widgetTitle = "WillPopScope";
  final String widgetSubtitle =
      "onWillPop是一个回调函数，当用户点击返回按钮时被调用（包括导航返回按钮及Android物理返回按钮）。该回调需要返回一个Future对象，如果返回的Future最终值为false时，则当前路由不出栈(不会返回)；最终值为true时，当前路由出栈退出。我们需要提供这个回调来决定是否退出。";

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
    // return <Widget>[
    //   new IconButton(
    //     icon: Icon(Icons.arrow_upward, color: Colors.white),
    //     onPressed: () {
    //       Navigator.push(context, MaterialPageRoute(builder: (context) {
    //         return ErrorPage();
    //       }));
    //     },
    //   ),
    // ];
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////

  // 构建示例
  List<Widget> buildExamples() {
    return <Widget>[
      exampleHeader(),
      example(),
    ];
  }

  Widget exampleHeader() {
    return ExampleHeader(
      title: widgetTitle ?? "",
      subtitle: widgetSubtitle ?? "",
    );
  }

  Widget example() {
    return Example(
      child: Text(
          "为了防止用户误触返回键退出，我们拦截返回事件。当用户在1秒内点击两次返回按钮时，则退出；如果间隔超过1秒则不退出，并重新记时。"),
      title: "示例",
      subtitle: "",
    );
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////

}
