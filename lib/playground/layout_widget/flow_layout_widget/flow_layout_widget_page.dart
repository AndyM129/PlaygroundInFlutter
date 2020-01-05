import 'package:flutter/material.dart';

// 基础页面
class FlowLayoutPage extends StatefulWidget {
  final String title;
  FlowLayoutPage({Key key, this.title}) : super(key: key);

  @override
  _FlowLayoutPageState createState() => _FlowLayoutPageState();
}

class _FlowLayoutPageState extends State<FlowLayoutPage> {
  final TextStyle _tipsTextStyle = TextStyle(
    color: Colors.grey,
    fontSize: 10.0,
  );

  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title ?? 'Widget - FlowLayout')),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 44.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(
                "Wrap 和 Flow",
                style: TextStyle(fontSize: 18.0),
              ),
              Text(
                "在介绍Row和Colum时，如果子widget超出屏幕范围，则会报溢出错误。"
                "\n\n"
                "这是因为Row默认只有一行，如果超出屏幕不会折行。我们把超出屏幕显示范围会自动折行的布局称为流式布局。Flutter中通过Wrap和Flow来支持流式布局，将上例中的Row换成Wrap后溢出部分则会自动折行。",
                style: _tipsTextStyle,
              ),
              Divider(color: Colors.black),
              Padding(padding: EdgeInsets.only(top: 20.0)),
              wrapExampleItem(),
              flowExampleItem(),
            ],
          ),
        ),
      ),
    );
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////

  Widget wrapExampleItem() {
    return Column(
      children: <Widget>[
        Wrap(
          spacing: 8.0, // 主轴(水平)方向间距
          runSpacing: 4.0, // 纵轴（垂直）方向间距
          alignment: WrapAlignment.center, //沿主轴方向居中
          children: <Widget>[
            new Chip(
              avatar: new CircleAvatar(
                  backgroundColor: Colors.blue, child: Text('A')),
              label: new Text('Hamilton'),
            ),
            new Chip(
              avatar: new CircleAvatar(
                  backgroundColor: Colors.blue, child: Text('M')),
              label: new Text('Lafayette'),
            ),
            new Chip(
              avatar: new CircleAvatar(
                  backgroundColor: Colors.blue, child: Text('H')),
              label: new Text('Mulligan'),
            ),
            new Chip(
              avatar: new CircleAvatar(
                  backgroundColor: Colors.blue, child: Text('J')),
              label: new Text('Laurens'),
            ),
          ],
        ),
        Text("Wrap"),
        Text("【注】alignment: WrapAlignment.center", style: _tipsTextStyle),
        Divider(color: Colors.black),
        Padding(padding: EdgeInsets.only(top: 20.0)),
      ],
    );
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////

  Widget flowExampleItem() {
    return Column(
      children: <Widget>[
        Flow(
          delegate: TestFlowDelegate(margin: EdgeInsets.all(10.0)),
          children: <Widget>[
            new Container(
              width: 80.0,
              height: 80.0,
              color: Colors.red,
            ),
            new Container(
              width: 80.0,
              height: 80.0,
              color: Colors.green,
            ),
            new Container(
              width: 80.0,
              height: 80.0,
              color: Colors.blue,
            ),
            new Container(
              width: 80.0,
              height: 80.0,
              color: Colors.yellow,
            ),
            new Container(
              width: 80.0,
              height: 80.0,
              color: Colors.brown,
            ),
            new Container(
              width: 80.0,
              height: 80.0,
              color: Colors.purple,
            ),
          ],
        ),
        Text("Flow"),
        Text(
            "【注】主要的任务就是实现paintChildren，它的主要任务是确定每个子widget位置。由于Flow不能自适应子widget的大小，我们通过在getSize返回一个固定大小来指定Flow的大小。",
            style: _tipsTextStyle),
        Divider(color: Colors.black),
        Padding(padding: EdgeInsets.only(top: 20.0)),
      ],
    );
  }
}

class TestFlowDelegate extends FlowDelegate {
  EdgeInsets margin = EdgeInsets.zero;
  TestFlowDelegate({this.margin});
  @override
  void paintChildren(FlowPaintingContext context) {
    var x = margin.left;
    var y = margin.top;
    //计算每一个子widget的位置
    for (int i = 0; i < context.childCount; i++) {
      var w = context.getChildSize(i).width + x + margin.right;
      if (w < context.size.width) {
        context.paintChild(i,
            transform: new Matrix4.translationValues(x, y, 0.0));
        x = w + margin.left;
      } else {
        x = margin.left;
        y += context.getChildSize(i).height + margin.top + margin.bottom;
        //绘制子widget(有优化)
        context.paintChild(i,
            transform: new Matrix4.translationValues(x, y, 0.0));
        x += context.getChildSize(i).width + margin.left + margin.right;
      }
    }
  }

  @override
  getSize(BoxConstraints constraints) {
    //指定Flow的大小
    return Size(double.infinity, 200.0);
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    return oldDelegate != this;
  }
}
