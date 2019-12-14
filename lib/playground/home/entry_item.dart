import 'package:flutter/material.dart';
import 'package:playground_in_flutter/playground/home/entry.dart';
import 'package:playground_in_flutter/playground/error/error_page.dart';

/// 实例显示行
class EntryItem extends StatelessWidget {
  final Entry entry;
  const EntryItem(this.entry);

  @override
  Widget build(BuildContext context) {
    return _buildTiles(context, entry);
  }

  Widget _buildTiles(BuildContext context, Entry entry) {
    if (entries.isEmpty) {
      return ListTile(title: Text('暂无数据'));
    }

    return Container(
      decoration: UnderlineTabIndicator(
        borderSide: BorderSide(width: 0.5, color: Colors.black12),
        insets: EdgeInsets.fromLTRB(15, 0, 15, 0),
      ),
      child: ListTile(
          title: Text("${entry.title}"),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return entry.page ?? ErrorPage();
            }));
          }),
    );
  }
}
