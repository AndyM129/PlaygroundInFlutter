import 'package:flutter/material.dart';
import 'package:playground_in_flutter/common/text_style.dart';
import 'package:playground_in_flutter/common/example.dart';
import 'package:playground_in_flutter/common/error_page.dart';

// 示例页面框架
class ThemeExamplePage2 extends StatefulWidget {
  final String title;
  ThemeExamplePage2({Key key, this.title}) : super(key: key);

  @override
  _ThemeExamplePage2State createState() => _ThemeExamplePage2State();
}

class _ThemeExamplePage2State extends State<ThemeExamplePage2> {
  @override
  Widget build(BuildContext context) => buildPage();

  // 构建页面
  Widget buildPage() {
    return Theme(
      data: ThemeData(
        primarySwatch: _themeColor, //用于导航栏、FloatingActionButton的背景色等
        iconTheme: IconThemeData(color: _themeColor), //用于Icon颜色
      ),
      child: Scaffold(
        appBar: buildAppBar(),
        body: buildBody(),
      ),
    );
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////

  final String chapterTitle = "Functional";
  final String widgetTitle = "Theme";
  final String widgetSubtitle =
      "Theme组件可以为Material APP定义主题数据（ThemeData）。Material组件库里很多组件都使用了主题数据，如导航栏颜色、标题字体、Icon样式等。Theme内会使用InheritedWidget来为其子树共享样式数据。";
  Color _themeColor = Colors.blue; //当前路由主题色

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
    //     icon: Icon(Icons.color_lens, color: Colors.white),
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
      example_2(),
    ];
  }

  Widget exampleHeader() {
    return ExampleHeader(
      title: widgetTitle ?? "",
      subtitle: widgetSubtitle ?? "",
    );
  }

  Widget example_2() {
    return Example(
      child: Scrollbar(
        child: Container(
          height: 308,
          child: ListView.builder(
            itemCount: 7,
            itemExtent: 44.0, //强制高度为50.0
            itemBuilder: (BuildContext context, int index) {
              Color color;
							if (index == 0) color = Colors.red;
							else if (index == 1) color = Colors.orange;
							else if (index == 2) color = Colors.yellow;
							else if (index == 3) color = Colors.green;
							else if (index == 4) color = Colors.cyan;
							else if (index == 5) color = Colors.blue;
							else if (index == 6) color = Colors.purple;

              Color textColor = color.computeLuminance() < 0.5
                  ? Colors.white
                  : Colors.black; //根据背景色亮度来确定Title颜色
              return FlatButton(
                  color: color,
                  child: Text(
                    '文  本',
                    style: TextStyle(color: textColor),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0.0),
                  ),
                  onPressed: () {
                    setState(() {
                      _themeColor = color;

                    });
                  }); //切换主题
            },
          ),
        ),
      ),
      title: "点击以切换主题颜色",
      subtitle:'',
    );
  }
}

////////////////////////////////////////////////////////////////////////////////////////////////////
