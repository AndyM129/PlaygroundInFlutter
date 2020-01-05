import 'package:flutter/material.dart';
import 'package:playground_in_flutter/common/text_style.dart';
import 'package:playground_in_flutter/common/example.dart';
import 'package:playground_in_flutter/common/error_page.dart';
import 'package:playground_in_flutter/playground/functional_widget/theme/theme_example_page_2.dart';

// 示例页面框架
class ThemeExamplePage extends StatefulWidget {
  final String title;
  ThemeExamplePage({Key key, this.title}) : super(key: key);

  @override
  _ThemeExamplePageState createState() => _ThemeExamplePageState();
}

class _ThemeExamplePageState extends State<ThemeExamplePage> {
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

  final String chapterTitle = "Functional";
  final String widgetTitle = "Theme";
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
        icon: Icon(Icons.color_lens, color: Colors.white),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return ThemeExamplePage2();
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
      example_2(),
    ];
  }

  Widget exampleHeader() {
    return ExampleHeader(
      title: "颜色",
      subtitle: "在介绍主题前我们先了解一些Flutter中的Color类。Color类中颜色以一个int值保存，我们知道显示器颜色是由红、绿、蓝三基色组成，每种颜色占8比特",
    );
  }

  Widget example_1() {
    return Example(
      child: Column(children: <Widget>[
        NavBar(color: Colors.blue[700], title: "文本"), //背景为蓝色，则title自动为白色
        Padding(padding: EdgeInsets.only(top: 10.0)), // 加一个间距
        NavBar(color: Colors.blue[200], title: "文本"), //背景为白色，则title自动为黑色
      ]),
      title: "颜色亮度",
      subtitle:
          "假如，我们要实现一个背景颜色和Title可以自定义的导航栏，并且背景色为深色时我们应该让Title显示为浅色；背景色为浅色时，Title显示为深色。要实现这个功能，我们就需要来计算背景色的亮度，然后动态来确定Title的颜色。Color类中提供了一个computeLuminance()方法，它可以返回一个[0-1]的一个值，数字越大颜色就越浅，我们可以根据它来动态确定Title的颜色",
    );
  }

  Widget example_2() {
    return Example(
      child: Scrollbar(
        child: Container(
          height: 200,
          child: ListView.builder(
            itemCount: 10,
            itemExtent: 30.0, //强制高度为50.0
            itemBuilder: (BuildContext context, int index) {
              int colorIndex = index == 0 ? 50 : (100 * (index % 10));
              Color color = Colors.blue[colorIndex];
              Color textColor = color.computeLuminance() < 0.5
                  ? Colors.white
                  : Colors.black; //根据背景色亮度来确定Title颜色
              return Container(
                alignment: Alignment.center,
                color: color,
                child: Text(
                  'Colors.blue[$colorIndex]',
                  style: TextStyle(color: textColor),
                ),
              );
            },
          ),
        ),
      ),
      title: "MaterialColor",
      subtitle:
          'MaterialColor是实现Material Design中的颜色的类，它包含一种颜色的10个级别的渐变色。MaterialColor通过"[]"运算符的索引值来代表颜色的深度，有效的索引有：50，100，200，…，900，数字越大，颜色越深。MaterialColor的默认值为索引等于500的颜色。'
					'\n\n'
					'Colors.blue[50]到Colors.blue[100]的色值从浅蓝到深蓝渐变，效果如上所示',
    );
  }

}

////////////////////////////////////////////////////////////////////////////////////////////////////

class NavBar extends StatelessWidget {
  final String title;
  final Color color; //背景颜色

  NavBar({Key key, this.color, this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minHeight: 52,
        minWidth: double.infinity,
      ),
      decoration: BoxDecoration(
        color: color,
        boxShadow: [
          //阴影
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0, 3),
            blurRadius: 3,
          ),
        ],
      ),
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          //根据背景色亮度来确定Title颜色
          color: color.computeLuminance() < 0.5 ? Colors.white : Colors.black,
        ),
      ),
      alignment: Alignment.center,
    );
  }
}
