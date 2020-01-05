import 'package:flutter/material.dart';
import 'package:playground_in_flutter/common/text_style.dart';
import 'package:playground_in_flutter/common/example.dart';
import 'package:english_words/english_words.dart';

class ListViewPage2 extends StatefulWidget {
  final String title;
  ListViewPage2({Key key, this.title}) : super(key: key);

  @override
  _ListViewPage2State createState() => _ListViewPage2State();
}

class _ListViewPage2State extends State<ListViewPage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title ?? appBarDefaultTitle())),
      body: body(),
    );
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////

  static const String chapterTitle = "Scrollable";
  static const String widgetTitle = "ListView 无限加载";
  static const String widgetSubtitle =
      '假设我们要从数据源异步分批拉取一些数据，然后用ListView展示，当我们滑动到列表末尾时，判断是否需要再去拉取数据，如果是，则去拉取，拉取过程中在表尾显示一个loading，拉取成功后将数据插入列表；如果不需要再去拉取，则在表尾提示"没有更多"';
	static const String separatorText = "==================================";
  static const loadingTag = "##loading##"; //表尾标记
  var _words = <String>[widgetTitle, widgetSubtitle, separatorText, loadingTag];
	static const int wordsMaxLength = 30;

  @override
  void initState() {
    super.initState();
    _retrieveData();
  }

  String appBarDefaultTitle() {
    return "${chapterTitle ?? ""}${chapterTitle == null ? "" : " - "}${widgetTitle ?? ""}";
  }

  Widget body() {
    return Scrollbar(
      child: ListView.separated(
        itemCount: _words.length,
        itemBuilder: (context, index) {
          //如果到了表尾
          if (_words[index] == loadingTag) {
            //不足100条，继续获取数据
            if (_words.length - 4 < wordsMaxLength) {
              //获取数据
              _retrieveData();
              //加载时显示loading
              return Container(
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.center,
                child: SizedBox(
                    width: 24.0,
                    height: 24.0,
                    child: CircularProgressIndicator(strokeWidth: 2.0)),
              );
            } else {
              //已经加载了100条数据，不再获取数据。
              return Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    "没有更多了",
                    style: TextStyle(color: Colors.grey),
                  ));
            }
          }
          //显示单词列表项
          return ListTile(title: Text(_words[index]));
        },
        separatorBuilder: (context, index) => Divider(height: .0),
      ),
    );
  }

  void _retrieveData() {
    Future.delayed(Duration(seconds: 2)).then((e) {
      _words.insertAll(
          _words.length - 1,
          //每次生成20个单词
          generateWordPairs().take(10).map((e) => e.asPascalCase).toList());
      setState(() {
        //重新构建列表
      });
    });
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////

}
