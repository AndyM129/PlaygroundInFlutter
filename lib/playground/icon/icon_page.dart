import 'package:flutter/material.dart';

// 基础页面
class IconPage extends StatelessWidget {
  final String title;
  IconPage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title ?? 'Widget - Icon'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 44.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(
                "图标",
                style: TextStyle(fontSize: 18.0),
              ),
              Divider(color: Colors.black),
              Text(
                "\uE914 \uE000 \uE90D",
                style: TextStyle(
                    fontFamily: "MaterialIcons",
                    fontSize: 50.0,
                    color: Colors.blue),
              ),
              Text("使用Material Design字体图标"),
              Divider(color: Colors.black),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.accessible, color: Colors.green),
                  Icon(Icons.error, color: Colors.green),
                  Icon(Icons.fingerprint, color: Colors.green),
                ],
              ),
              Text("Flutter封装了IconData和Icon来专门显示字体图标"),
              Divider(color: Colors.black),
							Text("此外，我们也可以使用自定义字体图标..."),
            ],
          ),
        ),
      ),
    );
  }

  // // 内容显示模式示例
  // Widget exampleRow(BoxFit fit, String text) {
  //   return Container(
  //     child: Column(
  //       children: <Widget>[
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: <Widget>[
  //             exampleItem(
  // 							Image(
  //               image: AssetImage("assets/images/logo.png"),
  //               width: 300.0,
  //               height: 100,
  //               fit: fit,
  //             ),
  // 						),
  //           ],
  //         ),
  //         Text(text),
  //         Divider(color: Colors.black),
  //       ],
  //     ),
  //   );

  // 	// 添加边框
  //   Widget exampleItem(Widget widget) {
  //     return Container(
  //       decoration: BoxDecoration(
  //         border: Border.all(color: Color(0xFF000000), width: 0.5), // 边色与边宽度
  //       ),
  //       child: widget,
  //     );
  //   }

  // Widget exampleRow(BoxFit fit, String text) {
  //   return Container(
  //     child: Column(
  //       children: <Widget>[
  //         Container(
  //           decoration: BoxDecoration(
  //             border:
  //                 Border.all(color: Color(0xFF000000), width: 0.5), // 边色与边宽度
  //           ),
  //           child: Row(
  // 						mainAxisAlignment: MainAxisAlignment.center,
  // 						children: <Widget>[
  // 							Image(
  //             image: AssetImage("assets/images/logo.png"),
  //             width: 300.0,
  //             height: 100,
  //             fit: fit,
  //           ),
  // 						],
  // 					)
  //         ),
  //         Text(text),
  //         Divider(color: Colors.black),
  //       ],
  //     ),
  //   );
  // }

  // 点击事件
  void _onPressed() {
    print("~~~~");
  }
}
