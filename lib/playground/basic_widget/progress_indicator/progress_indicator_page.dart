import 'package:flutter/material.dart';

// 基础页面
class ProgressIndicatorPage extends StatefulWidget {
  final String title;
  ProgressIndicatorPage({Key key, this.title}) : super(key: key);

  @override
  _ProgressIndicatorPageState createState() => _ProgressIndicatorPageState();
}

class _ProgressIndicatorPageState extends State<ProgressIndicatorPage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(widget.title ?? 'Widget - ProgressIndicator 进度指示')),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 44.0),
        child: Center(
          child: Column(
            children: <Widget>[
              linearProgressIndicatorExampleItem1(),
              linearProgressIndicatorExampleItem2(),
              circularProgressIndicatorExampleItem1(),
              circularProgressIndicatorExampleItem2(),
              customProgressIndicatorExampleItem1(),
              customProgressIndicatorExampleItem2(),
            ],
          ),
        ),
      ),
    );
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////

  // 模糊进度条(会执行一个动画)
  Widget linearProgressIndicatorExampleItem1() {
    return Column(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.fromLTRB(0, 20, 0, 5.0),
          padding: const EdgeInsets.all(10),
          color: Color(0x10000000),
          child: Column(
            children: <Widget>[
              LinearProgressIndicator(
                backgroundColor: Colors.grey[200],
                valueColor: AlwaysStoppedAnimation(Colors.blue),
              ),
            ],
          ),
        ),
        Text("LinearProgressIndicator: 模糊的进度指示"),
        Divider(color: Colors.black),
      ],
    );
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////

  //进度条显示50%
  Widget linearProgressIndicatorExampleItem2() {
    return Column(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.fromLTRB(0, 20, 0, 5.0),
          padding: const EdgeInsets.all(10),
          color: Color(0x10000000),
          child: Column(
            children: <Widget>[
              LinearProgressIndicator(
                backgroundColor: Colors.grey[200],
                valueColor: AlwaysStoppedAnimation(Colors.blue),
                value: .5,
              ),
            ],
          ),
        ),
        Text("LinearProgressIndicator: 精确的进度指示"),
        Divider(color: Colors.black),
      ],
    );
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////

  // 模糊进度条(会执行一个动画)
  Widget circularProgressIndicatorExampleItem1() {
    return Column(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.fromLTRB(0, 20, 0, 5.0),
          padding: const EdgeInsets.all(10),
          color: Color(0x10000000),
          child: Column(
            children: <Widget>[
              CircularProgressIndicator(
                backgroundColor: Colors.grey[200],
                valueColor: AlwaysStoppedAnimation(Colors.blue),
              ),
            ],
          ),
        ),
        Text("CircularProgressIndicator: 模糊的进度指示"),
        Divider(color: Colors.black),
      ],
    );
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////

  //进度条显示50%
  Widget circularProgressIndicatorExampleItem2() {
    return Column(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.fromLTRB(0, 20, 0, 5.0),
          padding: const EdgeInsets.all(10),
          color: Color(0x10000000),
          child: Column(
            children: <Widget>[
              CircularProgressIndicator(
                backgroundColor: Colors.grey[200],
                valueColor: AlwaysStoppedAnimation(Colors.blue),
                value: .5,
              ),
            ],
          ),
        ),
        Text("CircularProgressIndicator: 精确的进度指示"),
        Divider(color: Colors.black),
      ],
    );
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////

  Widget customProgressIndicatorExampleItem1() {
    return Column(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.fromLTRB(0, 20, 0, 5.0),
          padding: const EdgeInsets.all(10),
          color: Color(0x10000000),
          child: Column(
            children: <Widget>[
              // 线性进度条高度指定为3
              SizedBox(
                height: 3,
                child: LinearProgressIndicator(
                  backgroundColor: Colors.grey[200],
                  valueColor: AlwaysStoppedAnimation(Colors.blue),
                  value: .5,
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 20.0)),
              // 圆形进度条直径指定为100
              SizedBox(
                height: 100,
                width: 100,
                child: CircularProgressIndicator(
                  backgroundColor: Colors.grey[200],
                  valueColor: AlwaysStoppedAnimation(Colors.blue),
                  value: .7,
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 20.0)),
              // 宽高不等
              SizedBox(
                height: 100,
                width: 130,
                child: CircularProgressIndicator(
                  backgroundColor: Colors.grey[200],
                  valueColor: AlwaysStoppedAnimation(Colors.blue),
                  value: .7,
                ),
              ),
            ],
          ),
        ),
        Text("ProgressIndicator: 自定义尺寸"),
        Divider(color: Colors.black),
      ],
    );
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////

  AnimationController _animationController;

  @override
  void initState() {
    //动画执行时间3秒
    _animationController =
        new AnimationController(vsync: this, duration: Duration(seconds: 3));
    _animationController.forward();
    _animationController.addListener(() => setState(() => {}));
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Widget customProgressIndicatorExampleItem2() {
    return Column(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.fromLTRB(0, 20, 0, 5.0),
          padding: const EdgeInsets.all(10),
          color: Color(0x10000000),
          // child: Column(
          //   children: <Widget>[
          //     LinearProgressIndicator(
          //       backgroundColor: Colors.grey[200],
          //       valueColor: ColorTween(begin: Colors.grey, end: Colors.blue)
          //           .animate(_animationController), // 从灰色变成蓝色
          //       value: _animationController.value,
          //     ),
          //   ],
          // ),
        ),
        Text("LinearProgressIndicator: 进度色动画"),
        Divider(color: Colors.black),
      ],
    );
  }
}
