import 'package:flutter/material.dart';

// 基础页面
class FlexLayoutPage extends StatefulWidget {
  final String title;
  FlexLayoutPage({Key key, this.title}) : super(key: key);

  @override
  _FlexLayoutPageState createState() => _FlexLayoutPageState();
}

class _FlexLayoutPageState extends State<FlexLayoutPage> {
  final TextStyle _tipsTextStyle = TextStyle(
    color: Colors.grey,
    fontSize: 10.0,
  );

  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title ?? 'Widget - FlexLayout')),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 44.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(
                "Flex 和 Expanded",
                style: TextStyle(fontSize: 18.0),
              ),
              Text(
                "可以按比例“扩伸” Row、Column和Flex子组件所占用的空间。",
                style: _tipsTextStyle,
              ),
              Divider(color: Colors.black),
              Padding(padding: EdgeInsets.only(top: 20.0)),
              flexExampleItem(),
              expandedExampleItem(),
            ],
          ),
        ),
      ),
    );
  }

	////////////////////////////////////////////////////////////////////////////////////////////////////

  Widget flexExampleItem() {
    return Column(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.fromLTRB(0, 0, 0, 5.0),
          padding: const EdgeInsets.all(10),
          color: Color(0x10000000),
          child: SizedBox(
            height: 100.0,
            child: Flex(
              direction: Axis.vertical,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 30.0,
                    color: Colors.red,
                  ),
                ),
                Spacer(flex: 1),
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 30.0,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ),
        ),
        Text("Flex"),
        Text("【注】Flex的三个子widget，在垂直方向按2:1:1来占用100像素的空间", style: _tipsTextStyle),
        Divider(color: Colors.black),
        Padding(padding: EdgeInsets.only(top: 20.0)),
      ],
    );
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////

  Widget expandedExampleItem() {
    return Column(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.fromLTRB(0, 0, 0, 5.0),
          padding: const EdgeInsets.all(10),
          color: Color(0x10000000),
          child: Flex(
            direction: Axis.horizontal,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  height: 30.0,
                  color: Colors.red,
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  height: 30.0,
                  color: Colors.green,
                ),
              ),
            ],
          ),
        ),
        Text("Expanded"),
        Text(
            "【注】flex参数为弹性系数，如果为0或null，则child是没有弹性的，即不会被扩伸占用的空间。如果大于0，所有的Expanded按照其flex的比例来分割主轴的全部空闲空间。",
            style: _tipsTextStyle),
        Divider(color: Colors.black),
        Padding(padding: EdgeInsets.only(top: 20.0)),
      ],
    );
  }

  

}
