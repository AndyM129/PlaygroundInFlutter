import 'package:flutter/material.dart';


// 基础页面
class StackLayoutPage extends StatefulWidget {
  final String title;
  StackLayoutPage({Key key, this.title}) : super(key: key);

  @override
  _StackLayoutPageState createState() => _StackLayoutPageState();
}

class _StackLayoutPageState extends State<StackLayoutPage> {
  final TextStyle _tipsTextStyle = TextStyle(
    color: Colors.grey,
    fontSize: 10.0,
  );
  final TextStyle _textStyle = TextStyle(color: Colors.white);

  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title ?? 'Widget - StackLayout')),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 44.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(
                "Stack 和 Positioned",
                style: TextStyle(fontSize: 18.0),
              ),
              Text(
                "层叠布局和Web中的绝对定位、Android中的Frame布局是相似的，子组件可以根据距父容器四个角的位置来确定自身的位置。绝对定位允许子组件堆叠起来（按照代码中声明的顺序）。Flutter中使用Stack和Positioned这两个组件来配合实现绝对定位。Stack允许子组件堆叠，而Positioned用于根据Stack的四个角来确定子组件的位置。",
                style: _tipsTextStyle,
              ),
              Divider(color: Colors.black),
              Padding(padding: EdgeInsets.only(top: 20.0)),
              stackExampleItem1(),
              stackExampleItem2(),
            ],
          ),
        ),
      ),
    );
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////

  Widget stackExampleItem1() {
    return Column(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.fromLTRB(0, 0, 0, 5.0),
          padding: const EdgeInsets.all(0),
          height: 300,
          color: Color(0x10000000),
          child: ConstrainedBox(
            constraints: BoxConstraints.expand(),
            child: Stack(
              alignment: Alignment.center, //指定未定位或部分定位widget的对齐方式
              children: <Widget>[
                Container(
                  child: Text("A" * 10, style: _textStyle),
                  color: Color(0xddF44336),
                ),
                Positioned(
                  left: 18.0,
                  child: Container(
                    child: Text("B" * 10, style: _textStyle),
                    color: Colors.green,
                  ),
                ),
                Positioned(
                  top: 18.0,
                  child: Container(
                    child: Text("C" * 10, style: _textStyle),
                    color: Colors.blue,
                  ),
                )
              ],
            ),
          ),
        ),
        Text("Flex"),
        Text(
            "【注】由于第一个子文本组件A 没有指定定位，并且alignment值为Alignment.center，所以它会居中显示。\n\n"
            "第二个子文本组件B 只指定了水平方向的定位(left)，所以属于部分定位，即垂直方向上没有定位，那么它在垂直方向的对齐方式则会按照alignment指定的对齐方式对齐，即垂直方向居中。\n\n"
            "对于第三个子文本组件C，和 B 原理一样，只不过是水平方向没有定位，则水平方向居中。",
            style: _tipsTextStyle),
        Divider(color: Colors.black),
        Padding(padding: EdgeInsets.only(top: 20.0)),
      ],
    );
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////

  Widget stackExampleItem2() {
    return Column(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.fromLTRB(0, 0, 0, 5.0),
          padding: const EdgeInsets.all(0),
          height: 300,
          color: Color(0x10000000),
          child: ConstrainedBox(
            constraints: BoxConstraints.expand(),
            child: Stack(
              alignment: Alignment.center, //指定未定位或部分定位widget的对齐方式
              fit: StackFit.expand, //未定位widget占满Stack整个空间
              children: <Widget>[
                Positioned(
                  left: 18.0,
                  child: Container(
                    child: Text("B" * 10, style: _textStyle),
                    color: Colors.green,
                  ),
                ),
                Container(
                  child: Text("A" * 10, style: _textStyle),
                  color: Color(0xddF44336),
                ),
                Positioned(
                  top: 18.0,
                  child: Container(
                    child: Text("C" * 10, style: _textStyle),
                    color: Colors.blue,
                  ),
                )
              ],
            ),
          ),
        ),
        Text("给上例中的Stack指定一个fit属性，\n然后将A、B组件的顺序交换一下"),
        Text(
            "【注】可以看到，由于第二个子文本组件A 没有定位，所以fit属性会对它起作用，就会占满Stack。由于Stack子元素是堆叠的，所以第一个子文本组件B 被第二个A 遮住了(可透过A的半透明红色看到B组件)，而第三个C 在最上层，所以可以正常显示。",
            style: _tipsTextStyle),
        Divider(color: Colors.black),
        Padding(padding: EdgeInsets.only(top: 20.0)),
      ],
    );
  }
}
