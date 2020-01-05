import 'package:flutter/material.dart';

// 基础页面
class LinearLayoutPage extends StatefulWidget {
  final String title;
  LinearLayoutPage({Key key, this.title}) : super(key: key);

  @override
  _LinearLayoutPageState createState() => _LinearLayoutPageState();
}

class _LinearLayoutPageState extends State<LinearLayoutPage> {
  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title ?? 'Widget - LinearLayout')),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 44.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(
                "Row: 可以在水平方向排列其子widget",
                style: TextStyle(fontSize: 18.0),
              ),
              Divider(color: Colors.black),
              Padding(padding: EdgeInsets.only(top: 20.0)),
              rowExampleItem1(),
              rowExampleItem2(),
              rowExampleItem3(),
              rowExampleItem4(),
              Padding(padding: EdgeInsets.only(top: 100.0)),
              Text(
                "Column: 可以在垂直方向排列其子组件",
                style: TextStyle(fontSize: 18.0),
              ),
              Divider(color: Colors.black),
              Padding(padding: EdgeInsets.only(top: 20.0)),
              columnExampleItem1(),
              columnExampleItem2(),
              columnExampleItem3(),
            ],
          ),
        ),
      ),
    );
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////

  final Color _boxBackgroundColor = Colors.blue;
  final TextStyle _tipsTextStyle = TextStyle(
    color: Colors.grey,
    fontSize: 10.0,
  );
  final Decoration _boxDecoration = BoxDecoration(
    border: Border.all(color: Color(0xFF000000), width: 0.5), // 边色与边宽度
  );
  final Container _smallBox = Container(
    width: 30,
    height: 30,
    decoration: BoxDecoration(
      border: Border.all(color: Color(0xFF000000), width: 0.5), // 边色与边宽度
    ),
  );
  final Container _middleBox = Container(
    width: 60,
    height: 60,
    decoration: BoxDecoration(
      border: Border.all(color: Color(0xFF000000), width: 0.5), // 边色与边宽度
    ),
  );
  final Container _bigBox = Container(
    width: 90,
    height: 90,
    decoration: BoxDecoration(
      border: Border.all(color: Color(0xFF000000), width: 0.5), // 边色与边宽度
    ),
  );

  ////////////////////////////////////////////////////////////////////////////////////////////////////

  Widget rowExampleItem1() {
    return Column(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.fromLTRB(0, 0, 0, 5.0),
          padding: const EdgeInsets.all(10),
          color: Color(0x10000000),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[_smallBox, _middleBox, _bigBox],
          ),
        ),
        Text("mainAxisAlignment: MainAxisAlignment.center"),
        Text("【注】默认为居中对齐", style: _tipsTextStyle),
        Divider(color: Colors.black),
        Padding(padding: EdgeInsets.only(top: 20.0)),
      ],
    );
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////

  Widget rowExampleItem2() {
    return Column(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.fromLTRB(0, 0, 0, 5.0),
          padding: const EdgeInsets.all(10),
          color: Color(0x10000000),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[_smallBox, _middleBox, _bigBox],
          ),
        ),
        Text("mainAxisSize: MainAxisSize.min,\n"
            "mainAxisAlignment: MainAxisAlignment.center,"),
        Text(
            "【注】由于mainAxisSize值为MainAxisSize.min，Row的宽度等于两个Text的宽度和，所以对齐是无意义的，所以会从左往右显示；",
            style: _tipsTextStyle),
        Divider(color: Colors.black),
        Padding(padding: EdgeInsets.only(top: 20.0)),
      ],
    );
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////

  Widget rowExampleItem3() {
    return Column(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.fromLTRB(0, 0, 0, 5.0),
          padding: const EdgeInsets.all(10),
          color: Color(0x10000000),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            textDirection: TextDirection.rtl,
            children: <Widget>[_smallBox, _middleBox, _bigBox],
          ),
        ),
        Text("mainAxisAlignment: MainAxisAlignment.end,\n"
            "textDirection: TextDirection.rtl,"),
        Text(
            "【注】设置textDirection值为TextDirection.rtl，所以子组件会从右向左的顺序排列，而此时MainAxisAlignment.end表示左对齐，所以最终显示结果就是图中第三行的样子；",
            style: _tipsTextStyle),
        Divider(color: Colors.black),
        Padding(padding: EdgeInsets.only(top: 20.0)),
      ],
    );
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////

  Widget rowExampleItem4() {
    return Column(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.fromLTRB(0, 0, 0, 5.0),
          padding: const EdgeInsets.all(10),
          color: Color(0x10000000),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            verticalDirection: VerticalDirection.up,
            children: <Widget>[_smallBox, _middleBox, _bigBox],
          ),
        ),
        Text("crossAxisAlignment: CrossAxisAlignment.start,\n"
            "verticalDirection: VerticalDirection.up,"),
        Text(
            "【注】纵轴的对齐方式，由于两个子Text字体不一样，所以其高度也不同，我们指定了verticalDirection值为VerticalDirection.up，即从低向顶排列，而此时crossAxisAlignment值为CrossAxisAlignment.start表示底对齐。",
            style: _tipsTextStyle),
        Divider(color: Colors.black),
        Padding(padding: EdgeInsets.only(top: 20.0)),
      ],
    );
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////

  Widget columnExampleItem1() {
    return Column(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.fromLTRB(0, 0, 0, 5.0),
          padding: const EdgeInsets.all(10),
          color: Color(0x10000000),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[_smallBox, _middleBox, _bigBox],
          ),
        ),
        Text("crossAxisAlignment: CrossAxisAlignment.center"),
        Text("【注】参数和Row一样，不同的是布局方向为垂直，主轴纵轴正好相反，读者可类比Row来理解，",
            style: _tipsTextStyle),
        Divider(color: Colors.black),
        Padding(padding: EdgeInsets.only(top: 20.0)),
      ],
    );
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////

  Widget columnExampleItem2() {
    return Column(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.fromLTRB(0, 0, 0, 5.0),
          padding: const EdgeInsets.all(10),
          color: Color(0x10000000),
          child: ConstrainedBox(
            constraints: BoxConstraints(minWidth: double.infinity),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[_smallBox, _middleBox, _bigBox],
            ),
          ),
        ),
        Text("minWidth: double.infinity"),
        Text(
            "【注】将Column的宽度指定为屏幕宽度；这很简单，我们可以通过ConstrainedBox或SizedBox（我们将在后面章节中专门介绍这两个Widget）来强制更改宽度限制，将minWidth设为double.infinity，可以使宽度占用尽可能多的空间。",
            style: _tipsTextStyle),
        Divider(color: Colors.black),
        Padding(padding: EdgeInsets.only(top: 20.0)),
      ],
    );
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////

  Widget columnExampleItem3() {
    return Column(
      children: <Widget>[
				// Expanded( 
				// 	child: Container(
				// 		color: Colors.red,
				// 		child: Column(
				// 			mainAxisAlignment: MainAxisAlignment.center, //垂直方向居中对齐
				// 			children: <Widget>[
				// 				Text("hello world "),
				// 				Text("I am Jack "),
				// 			],
				// 		),
				// 	),
				// )
        Text("【注】如果要让里面的Column占满外部Column，可以使用Expanded 组件",
            style: _tipsTextStyle),
        Divider(color: Colors.black),
        Padding(padding: EdgeInsets.only(top: 20.0)),
      ],
    );
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////

}
