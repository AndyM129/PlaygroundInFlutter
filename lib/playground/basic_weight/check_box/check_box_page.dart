import 'package:flutter/material.dart';

// 基础页面
class CheckBoxPage extends StatefulWidget {
  final String title;
  CheckBoxPage({Key key, this.title}) : super(key: key);

  @override
  _CheckBoxPageState createState() => _CheckBoxPageState();
}

class _CheckBoxPageState extends State<CheckBoxPage> {
  bool _switchSelected = true; //维护单选开关状态
  bool _checkboxSelected = true; //维护复选框状态

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title ?? 'Widget - CheckBox')),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 44.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(
                "单选开关和复选框",
                style: TextStyle(fontSize: 18.0),
              ),
              Divider(color: Colors.black),
              Switch(
                value: _switchSelected, //当前状态
                onChanged: (value) {
                  setState(() {
                    _switchSelected = value;
                  });
                },
              ),
              Checkbox(
                value: _checkboxSelected,
                activeColor: Colors.red, //选中时的颜色
                onChanged: (value) {
                  setState(() {
                    _checkboxSelected = value;
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
