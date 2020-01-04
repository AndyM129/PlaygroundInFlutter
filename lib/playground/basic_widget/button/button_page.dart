import 'package:flutter/material.dart';

// 基础页面
class ButtonPage extends StatelessWidget {
  final String title;
  ButtonPage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title ?? 'Widget - Button'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 44.0),
        child: Center(
          child: Column(
            children: <Widget>[
              RaisedButton(
                child: Text('RaisedButton 即"漂浮"按钮，它默认带有阴影和灰色背景。按下后，阴影会变大'),
                onPressed: () {
                  print("~~~~");
                },
              ),
              Divider(color: Colors.black),
              FlatButton(
                child: Text("FlatButton 即扁平按钮，默认背景透明并不带阴影。按下后，会有背景色"),
                onPressed: () {},
              ),
              Divider(color: Colors.black),
              OutlineButton(
                child: Text(
                    "OutlineButton 默认有一个边框，不带阴影且背景透明。按下后，边框颜色会变亮、同时出现背景和阴影(较弱)，"),
                onPressed: () {},
              ),
              Divider(color: Colors.black),
              IconButton(
                icon: Icon(Icons.thumb_up),
                onPressed: () {},
              ),
              Text('IconButton是一个可点击的Icon，不包括文字，默认没有背景，点击后会出现背景'),
              Divider(color: Colors.black),
              RaisedButton.icon(
                icon: Icon(Icons.send),
                label: Text("发送"),
                onPressed: _onPressed,
              ),
              FlatButton.icon(
                icon: Icon(Icons.info),
                label: Text("详情"),
                onPressed: _onPressed,
              ),
              OutlineButton.icon(
                icon: Icon(Icons.add),
                label: Text("添加"),
                onPressed: _onPressed,
              ),
              Text(
                  'RaisedButton、FlatButton、OutlineButton都有一个icon 构造函数，通过它可以轻松创建带图标的按钮'),
              Divider(color: Colors.black),
              FlatButton(
                color: Colors.blue,
                highlightColor: Colors.blue[700],
                colorBrightness: Brightness.dark,
                splashColor: Colors.grey,
                child: Text("自定义按钮外观 - FlatButton"),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                onPressed: () {},
              ),
              RaisedButton(
                color: Colors.blue,
                highlightColor: Colors.blue[700],
                colorBrightness: Brightness.dark,
                splashColor: Colors.grey,
                child: Text("自定义按钮外观 - RaisedButton"),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                onPressed: () {},
              ),
              Divider(color: Colors.black),
              Divider(color: Colors.black),
              Divider(color: Colors.black),
              Divider(color: Colors.black),
              Divider(color: Colors.black),
            ],
          ),
        ),
      ),
    );
  }

  // 点击事件
  void _onPressed() {
    print("~~~~");
  }
}
