import 'package:flutter/material.dart';
import 'package:playground_in_flutter/common/text_style.dart';
import 'package:playground_in_flutter/common/example.dart';
import 'package:playground_in_flutter/playground/scrollable_widget/list_view/list_view_page_2.dart';

class ListViewPage extends StatefulWidget {
  final String title;
  ListViewPage({Key key, this.title}) : super(key: key);

  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
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
            ],
          ),
        ),
      ),
    );
  }

  // 导航栏右侧按钮
  List<Widget> appBarActions() {
    return [
      new IconButton(
        icon: Icon(Icons.arrow_upward, color: Colors.white),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return ListViewPage2();
          }));
        },
      ),
    ];
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////

  final String chapterTitle = "Scrollable";
  final String widgetTitle = "ListView";
  final String widgetSubtitle =
      "ListView是最常用的可滚动组件之一，它可以沿一个方向线性排布所有子组件，并且它也支持基于Sliver的延迟构建模型。";

  String appBarDefaultTitle() {
    return "${chapterTitle ?? ""}${chapterTitle == null ? "" : " - "}${widgetTitle ?? ""}";
  }

  Widget exampleHeader() {
    return ExampleHeader(
      title: widgetTitle ?? "",
      subtitle: widgetSubtitle ?? "",
    );
  }

  Widget example() {
    return Example(
      child: Scrollbar(
        child: Container(
          height: 200,
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.all(20.0),
            children: <Widget>[
              const Text('I\'m dedicating every day to you'),
              const Divider(color: Colors.black),
              const Text('Domestic life was never quite my style'),
              const Divider(color: Colors.black),
              const Text('When you smile, you knock me out, I fall apart'),
              const Divider(color: Colors.black),
              const Text('And I thought I was so smart'),
            ],
          ),
        ),
      ),
      title: "默认构造函数",
      subtitle:
          "默认构造函数有一个children参数，它接受一个Widget列表（List）。这种方式适合只有少量的子组件的情况，因为这种方式需要将所有children都提前创建好（这需要做大量工作），而不是等到子widget真正显示的时候再创建，也就是说通过默认构造函数构建的ListView没有应用基于Sliver的懒加载模型。实际上通过此方式创建的ListView和使用SingleChildScrollView+Column的方式没有本质的区别。"
          "\n\n"
          "再次强调，可滚动组件通过一个List来作为其children属性时，只适用于子组件较少的情况，这是一个通用规律，并非ListView自己的特性，像GridView也是如此。",
    );
  }

  Widget example2() {
    return Example(
      child: Scrollbar(
        child: Container(
          height: 200,
          child: ListView.builder(
            itemCount: 100,
            itemExtent: 30.0, //强制高度为50.0
            itemBuilder: (BuildContext context, int index) {
              return ListTile(title: Text("$index"));
            },
          ),
        ),
      ),
      title: "ListView.builder",
      subtitle:
          "ListView.builder适合列表项比较多（或者无限）的情况，因为只有当子组件真正显示的时候才会被创建，也就说通过该构造函数创建的ListView是支持基于Sliver的懒加载模型的。"
          "\n\n"
          "可滚动组件的构造函数如果需要一个列表项Builder，那么通过该构造函数构建的可滚动组件通常就是支持基于Sliver的懒加载模型的，反之则不支持，这是个一般规律。我们在后面在介绍可滚动组件的构造函数时将不再专门说明其是否支持基于Sliver的懒加载模型了。",
    );
  }

  Widget example3() {
    //下划线widget预定义以供复用。
    Widget divider1 = Divider(color: Colors.blue);
    Widget divider2 = Divider(color: Colors.red);

    return Example(
      child: Scrollbar(
        child: Container(
          height: 200,
          child: ListView.separated(
            itemCount: 100,
            //列表项构造器
            itemBuilder: (BuildContext context, int index) {
              return ListTile(title: Text("$index"));
            },
            //分割器构造器
            separatorBuilder: (BuildContext context, int index) {
              return index % 2 == 0 ? divider1 : divider2;
            },
          ),
        ),
      ),
      title: "ListView.builder",
      subtitle:
          "ListView.builder适合列表项比较多（或者无限）的情况，因为只有当子组件真正显示的时候才会被创建，也就说通过该构造函数创建的ListView是支持基于Sliver的懒加载模型的。"
          "\n\n"
          "可滚动组件的构造函数如果需要一个列表项Builder，那么通过该构造函数构建的可滚动组件通常就是支持基于Sliver的懒加载模型的，反之则不支持，这是个一般规律。我们在后面在介绍可滚动组件的构造函数时将不再专门说明其是否支持基于Sliver的懒加载模型了。",
    );
  }

  Widget example4() {
    return Example(
      child: Scrollbar(
        child: Container(
          height: 200,
          child: Column(children: <Widget>[
            ListTile(title: Text("商品列表")),
            Expanded(
              child: ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text("$index"),
                );
              }),
            ),
          ]),
        ),
      ),
      title: "添加固定列表头",
      subtitle: "很多时候我们需要给列表添加一个固定表头，比如我们想实现一个商品列表，需要在列表顶部添加一个“商品列表”标题。",
    );
  }

  // Widget example5() {
  //   //下划线widget预定义以供复用。
  //   Widget divider1 = Divider(color: Colors.blue);
  //   Widget divider2 = Divider(color: Colors.red);

  //   return Example(
  //     child: Scrollbar(
  //       child: Container(
  //         height: 200,
  //         child: ListView.separated(
  //           itemCount: 100,
  //           //列表项构造器
  //           itemBuilder: (BuildContext context, int index) {
  //             return ListTile(title: Text("$index"));
  //           },
  //           //分割器构造器
  //           separatorBuilder: (BuildContext context, int index) {
  //             return index % 2 == 0 ? divider1 : divider2;
  //           },
  //         ),
  //       ),
  //     ),
  //     title: "ListView.builder",
  //     subtitle:
  //         "ListView.builder适合列表项比较多（或者无限）的情况，因为只有当子组件真正显示的时候才会被创建，也就说通过该构造函数创建的ListView是支持基于Sliver的懒加载模型的。"
  //         "\n\n"
  //         "可滚动组件的构造��数如果需要一个列表项Builder，那么通过该构造函数构建的可滚动组件通常就是支持基于Sliver的懒加载模型的，反之则不支持，这是个一般规律。我们在后面在介绍可滚动组件的构造函数时将不再专门说明其是否支持基于Sliver的懒加载模型了。",
  //   );
  // }

  ////////////////////////////////////////////////////////////////////////////////////////////////////

}
