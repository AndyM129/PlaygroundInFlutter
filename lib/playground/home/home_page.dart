import 'package:flutter/material.dart';
import 'package:playground_in_flutter/playground/home/entry.dart';
import 'package:playground_in_flutter/playground/home/entry_item.dart';

/// 首页
class HomePage extends StatelessWidget {
  final String title;
  HomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title ?? 'Playground In Flutter'),
      ),
			body: ListView.builder(
          itemBuilder: (BuildContext context, int index) => EntryItem(entries[index]),
          itemCount: entries.length,
        ),
    );
  }
}
