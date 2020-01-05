import 'package:flutter/material.dart';
import 'package:playground_in_flutter/common/text_style.dart';
import 'package:playground_in_flutter/common/example.dart';
import 'package:playground_in_flutter/common/error_page.dart';

// 示例页面框架
class ScrollControllerPage extends StatefulWidget {
  final String title;
  ScrollControllerPage({Key key, this.title}) : super(key: key);

  @override
  _ScrollControllerPageState createState() => _ScrollControllerPageState();
}

class _ScrollControllerPageState extends State<ScrollControllerPage> {
  @override
  Widget build(BuildContext context) => buildPage();

  @override
  void dispose() {
    //为了避免内存泄露，需要调用_controller.dispose
    _controller.dispose();
    super.dispose();
  }

  // 构建页面
  Widget buildPage() {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildBody(),
      floatingActionButton: floatingActionButton(),
    );
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////

  final String chapterTitle = "Scrollable";
  final String widgetTitle = "ScrollController";
  final String widgetSubtitle = "Subtitle";
  bool showToTopBtn = false; //是否显示“返回到顶部”按钮
  String _progress = "0%"; //保存进度百分比
  ScrollController _controller = ScrollController();

  // 构建导航栏
  Widget buildAppBar() {
    return AppBar(
      title: Text(widget.title ?? appBarDefaultTitle()),
      actions: appBarActions(),
    );
  }

  // 构建页面内容
  Widget buildBody() {
    return Scrollbar(
      //进度条
      // 监听滚动通知
      child: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification notification) {
          double progress = notification.metrics.pixels /
              notification.metrics.maxScrollExtent;
          print(
              "progress = $progress, BottomEdge: ${notification.metrics.extentAfter == 0}");

          //重新构建
          setState(() {
            _progress = "${(progress * 100).toInt()}%";
          });

          // 控制回到顶部 按钮的显示
          if (progress < 0.1) {
            if (showToTopBtn == true)
              setState(() {
                showToTopBtn = false;
              });
          } else {
            if (showToTopBtn == false)
              setState(() {
                showToTopBtn = true;
              });
          }
          //return true; //放开此行注释后，进度条将失效
        },
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            ListView.builder(
              itemCount: 100,
              itemExtent: 50.0,
              itemBuilder: (context, index) {
                return ListTile(title: Text("$index"));
              },
              controller: _controller,
            ),
            CircleAvatar(
              //显示进度百分比
              radius: 30.0,
              child: Text(_progress),
              backgroundColor: Colors.black54,
            )
          ],
        ),
      ),
    );
  }

  Widget floatingActionButton() {
    return !showToTopBtn
        ? null
        : FloatingActionButton(
            child: Icon(Icons.arrow_upward),
            onPressed: () {
              //返回到顶部时执行动画
              _controller.animateTo(.0,
                  duration: Duration(milliseconds: 200), curve: Curves.ease);
            },
          );
  }

  String appBarDefaultTitle() {
    return "${widgetTitle ?? ""}";
  }

  // 导航栏右侧按钮
  List<Widget> appBarActions() {
    return null;
  }
}
