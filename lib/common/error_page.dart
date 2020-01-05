import 'package:flutter/material.dart';

/// 基础页面
class ErrorPage extends StatelessWidget {
  final String title;
  ErrorPage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title ?? 'Error'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Occur Error !'),
          ],
        ),
      ),
    );
  }
}
