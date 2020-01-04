import 'package:flutter/material.dart';

// 基础页面
class ImagePage extends StatelessWidget {
  final String title;
  ImagePage({Key key, this.title}) : super(key: key);

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
              Text(
                "加载图片",
                style: TextStyle(fontSize: 18.0),
              ),
              Divider(color: Colors.black),
              Image(image: AssetImage("assets/images/logo.png"), width: 100.0),
              Divider(color: Colors.black),
              Image.asset(
                "assets/images/logo.png",
                width: 100.0,
              ),
              // Divider(color: Colors.black),
              // Image(
              //   image: NetworkImage(
              //       "https://raw.githubusercontent.com/AndyM129/ImageHosting/master/images/20191220203936.png"),
              //   width: 100.0,
              // ),
              // Divider(color: Colors.black),
              // Image.network(
              //   "https://raw.githubusercontent.com/AndyM129/ImageHosting/master/images/20191220203936.png",
              //   width: 100.0,
              // ),
              Divider(color: Colors.black),
              Divider(color: Colors.black),
              Text(
                "内容显示模式",
                style: TextStyle(fontSize: 18.0),
              ),
              // imageExampleItem(),
              Divider(color: Colors.black),
              boxFitExampleItem(BoxFit.fill, "BoxFit.fill"),
              boxFitExampleItem(BoxFit.contain, "BoxFit.contain"),
              boxFitExampleItem(BoxFit.cover, "BoxFit.cover"),
              boxFitExampleItem(BoxFit.fitWidth, "BoxFit.fitWidth"),
              boxFitExampleItem(BoxFit.fitHeight, "BoxFit.fitHeight"),
              boxFitExampleItem(BoxFit.none, "BoxFit.none"),
              boxFitExampleItem(BoxFit.scaleDown, "BoxFit.scaleDown"),
              Divider(color: Colors.black),
              Text(
                "混色模式",
                style: TextStyle(fontSize: 18.0),
              ),
              Divider(color: Colors.black),
              // Image.asset(
              //   "assets/images/logo.png",
              //   width: 200.0,
              //   color: Colors.yellow,
              //   colorBlendMode: BlendMode.difference,
              // ),
							blendModeExampleItem(BlendMode.clear, "BlendMode.clear"),
							blendModeExampleItem(BlendMode.src, "BlendMode.src"),
							blendModeExampleItem(BlendMode.dst, "BlendMode.dst"),
							blendModeExampleItem(BlendMode.srcOver, "BlendMode.srcOver"),
							blendModeExampleItem(BlendMode.dstOver, "BlendMode.dstOver"),
							blendModeExampleItem(BlendMode.dst, "BlendMode.dst"),
            ],
          ),
        ),
      ),
    );
  }

  // 内容显示模式示例
  Widget boxFitExampleItem(BoxFit fit, String text) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              border:
                  Border.all(color: Color(0xFF000000), width: 0.5), // 边色与边宽度
            ),
            child: Image(
              image: AssetImage("assets/images/logo.png"),
              width: 300.0,
              height: 100,
              fit: fit,
            ),
          ),
          Text(text),
          Divider(color: Colors.black),
        ],
      ),
    );
  }

  // 内容混色模式示例
  Widget blendModeExampleItem(BlendMode colorBlendMode, String text) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                border:
                    Border.all(color: Color(0xFF000000), width: 0.5) // 边色与边宽度
                ),
            child: Image(
              image: AssetImage("assets/images/logo.png"),
              width: 300.0,
              height: 100,
              color: Colors.yellow,
              colorBlendMode: colorBlendMode,
            ),
          ),
          Text(text),
          Divider(color: Colors.black),
        ],
      ),
    );
  }

  // 点击事件
  void _onPressed() {
    print("~~~~");
  }
}
