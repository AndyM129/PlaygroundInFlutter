import 'package:flutter/material.dart';

// 基础页面
class AlignLayoutPage extends StatefulWidget {
  final String title;
  AlignLayoutPage({Key key, this.title}) : super(key: key);

  @override
  _AlignLayoutPageState createState() => _AlignLayoutPageState();
}

class _AlignLayoutPageState extends State<AlignLayoutPage> {
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
      appBar: AppBar(title: Text(widget.title ?? 'Widget - AlignLayout')),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 44.0),
        child: Center(
          child: Column(
            children: <Widget>[
              alignExampleItem1(),
              alignExampleItem2(),
              alignmentExampleItem1(),
              fractionalOffsetExampleItem1(),
              centerExampleItem1(),
            ],
          ),
        ),
      ),
    );
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////

  Widget alignExampleItem1() {
    return Column(
      children: <Widget>[
        Container(
          height: 120.0,
          width: 120.0,
          color: Colors.blue[50],
          child: Align(
            alignment: Alignment.topRight,
            child: FlutterLogo(
              size: 60,
            ),
          ),
        ),
        Text("Align"),
        Text("【注】", style: _tipsTextStyle),
        Divider(color: Colors.black),
        Padding(padding: EdgeInsets.only(top: 20.0)),
      ],
    );
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////

  Widget alignExampleItem2() {
    return Column(
      children: <Widget>[
        Container(
          height: 120.0,
          width: 120.0,
          color: Colors.blue[50],
          child: Align(
            widthFactor: 2,
            heightFactor: 2,
            alignment: Alignment.topRight,
            child: FlutterLogo(
              size: 60,
            ),
          ),
        ),
        Text("Align"),
        Text("【注】", style: _tipsTextStyle),
        Divider(color: Colors.black),
        Padding(padding: EdgeInsets.only(top: 20.0)),
      ],
    );
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////

  Widget alignmentExampleItem1() {
    return Column(
      children: <Widget>[
        Container(
          height: 120.0,
          width: 120.0,
          color: Colors.blue[50],
          child: Align(
            widthFactor: 2,
            heightFactor: 2,
            alignment: Alignment(2, 0.0),
            child: FlutterLogo(
              size: 60,
            ),
          ),
        ),
        Text("Alignment"),
        Text("【注】", style: _tipsTextStyle),
        Divider(color: Colors.black),
        Padding(padding: EdgeInsets.only(top: 20.0)),
      ],
    );
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////

  Widget fractionalOffsetExampleItem1() {
    return Column(
      children: <Widget>[
        Container(
          height: 120.0,
          width: 120.0,
          color: Colors.blue[50],
          child: Align(
            alignment: FractionalOffset(0.2, 0.6),
            child: FlutterLogo(
              size: 60,
            ),
          ),
        ),
        Text("Alignment"),
        Text("【注】", style: _tipsTextStyle),
        Divider(color: Colors.black),
        Padding(padding: EdgeInsets.only(top: 20.0)),
      ],
    );
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////

  Widget centerExampleItem1() {
    return Column(
      children: <Widget>[
        DecoratedBox(
          decoration: BoxDecoration(color: Colors.blue[50]),
          child: Center(
            child: Text("xxx"),
          ),
        ),
        Padding(padding: EdgeInsets.only(top: 10.0)),
        DecoratedBox(
          decoration: BoxDecoration(color: Colors.blue[50]),
          child: Center(
            widthFactor: 1,
            heightFactor: 1,
            child: Text("xxx"),
          ),
        ),
        Padding(padding: EdgeInsets.only(top: 20.0)),
        Text("Center"),
        Text("【注】", style: _tipsTextStyle),
        Divider(color: Colors.black),
        Padding(padding: EdgeInsets.only(top: 20.0)),
      ],
    );
  }
}
