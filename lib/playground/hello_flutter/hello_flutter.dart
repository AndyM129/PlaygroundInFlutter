import 'package:flutter/material.dart';

/// 基础页面
class HelloPage extends StatelessWidget {
  final String title;
  HelloPage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title ?? 'Hello Fullter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Hello Fullter !'),
          ],
        ),
      ),
    );
  }
}
