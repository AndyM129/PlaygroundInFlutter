import 'package:flutter/material.dart';
import 'package:playground_in_flutter/common/text_style.dart';

/// 示例容器
class Example extends Container {
  final Widget child;
  final String title;
  final String subtitle;
  final TextStyle _titleTextStyle = TextStyle(
    color: Colors.black,
    fontSize: 14.0,
  );
  final TextStyle _subtitleTextStyle = TextStyle(
    color: Colors.grey,
    fontSize: 10.0,
  );

  Example({Key key, this.child, this.title, this.subtitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ConstrainedBox(
          constraints: BoxConstraints(
              minWidth: double.infinity, //宽度尽可能大
              minHeight: 50.0 //最小高度为50像素
              ),
          child: Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 0, 5.0),
            padding: const EdgeInsets.all(5),
            color: Color(0x10000000),
            child: child,
          ),
        ),
        Text(title ?? "", style: _titleTextStyle),
        Text(subtitle ?? "", style: _subtitleTextStyle),
        Divider(color: Colors.black),
        Padding(padding: EdgeInsets.only(top: 20.0)),
      ],
    );
  }
}

/// 示例容器
class ExampleHeader extends Container {
  final String title;
  final String subtitle;

  ExampleHeader({Key key, this.title, this.subtitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(title ?? "", style: AppTextStyle.titleTextStyle1),
        Text(subtitle ?? "", style: AppTextStyle.tipsTextStyle),
        Divider(color: Colors.black),
        Padding(padding: EdgeInsets.only(top: 20.0)),
      ],
    );
  }
}
