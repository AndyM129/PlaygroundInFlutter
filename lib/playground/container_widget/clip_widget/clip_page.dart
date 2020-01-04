import 'package:flutter/material.dart';
import 'package:playground_in_flutter/common/text_style.dart';
import 'package:playground_in_flutter/common/example.dart';

class ClipPage extends StatefulWidget {
  final String title;

  ClipPage({Key key, this.title}) : super(key: key);

  @override
  _ClipPageState createState() => _ClipPageState();
}

class _ClipPageState extends State<ClipPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title ?? 'Container - Clip')),
      body: Scrollbar(
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 44.0),
          child: Center(
            child: Column(
              children: <Widget>[
                ExampleHeader(
                  title: "Clip",
                  subtitle: "Flutter中提供了一些剪裁函数，用于对组件进行剪裁。",
                ),
                example(),
                example2(),
                example3(),
                example4(),
                example5(),
                example6(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////

  Widget example() {
    return Example(
      child: UnconstrainedBox(
        child: Image.asset("assets/images/logo.png", width: 100.0),
      ),
      title: "原图",
      subtitle: "",
    );
  }

  Widget example2() {
    return Example(
      child: UnconstrainedBox(
        child: ClipOval(
          child: Image.asset("assets/images/logo.png", width: 100.0),
        ),
      ),
      title: "ClipOval：剪裁为圆形",
      subtitle: "子组件为正方形时剪裁为内贴圆形，为矩形时，剪裁为内贴椭圆",
    );
  }

  Widget example3() {
    return Example(
      child: UnconstrainedBox(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Image.asset("assets/images/logo.png", width: 100.0),
        ),
      ),
      title: "ClipRRect：剪裁为圆角矩形",
      subtitle: "子组件为正方形时剪裁为内贴圆形，为矩形时，剪裁为内贴椭圆",
    );
  }

  Widget example4() {
    Widget avatar = Image.asset("assets/images/logo.png", width: 100.0);
    return Example(
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                widthFactor: .5, //宽度设为原来宽度一半，另一半会溢出
                child: avatar,
              ),
              Text("你好世界 AAAA", style: AppTextStyle.titleTextStyle2)
            ],
          ),
          Padding(padding: const EdgeInsets.all(5)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ClipRect(
                //将溢出部分剪裁
                child: Align(
                  alignment: Alignment.topLeft,
                  widthFactor: .5, //宽度设为原来宽度一半
                  child: avatar,
                ),
              ),
              Text("你好世界 BBBBB", style: AppTextStyle.titleTextStyle2)
            ],
          ),
        ],
      ),
      title: "ClipRect：将溢出部分剪裁（如示例B）",
      subtitle: "剪裁子组件到实际占用的矩形大小（溢出部分剪裁）\n\n"
          "上面示例代码注释比较详细，在此不再赘述。但值得一提的是最后的两个Row！它们通过Align设置widthFactor为0.5后，图片的实际宽度等于60×0.5，即原宽度一半，但此时图片溢出部分依然会显示，所以第一个“你好世界”会和图片的另一部分重合，为了剪裁掉溢出部分，我们在第二个Row中通过ClipRect将溢出部分剪裁掉了。",
    );
  }

  Widget example5() {
    return Example(
      child: UnconstrainedBox(
        child: DecoratedBox(
          decoration: BoxDecoration(color: Colors.red),
          child: ClipRect(
            clipper: MyClipper(), //使用自定义的clipper
            child: Image.asset("assets/images/logo.png", width: 100.0),
          ),
        ),
      ),
      title: "CustomClipper：剪裁子组件的特定区域",
      subtitle: "Rect.fromLTWH(10.0, 15.0, 40.0, 30.0)\n\n"
          "可以看到我们的剪裁成功了，但是图片所占用的空间大小仍然是60×60（红色区域），这是因为剪裁是在layout完成后的绘制阶段进行的，所以不会影响组件的大小，这和Transform原理是相似的。",
    );
  }

  Widget example6() {
    return Example(
      child: UnconstrainedBox(
        child: DecoratedBox(
          decoration: BoxDecoration(color: Colors.red),
          child: ClipRect(
            clipper: MyClipper2(rect: Rect.fromLTWH(10.0, 20.0, 30.0, 40.0)),
            child: Image.asset("assets/images/logo.png", width: 100.0),
          ),
        ),
      ),
      title: "CustomClipper：剪裁子组件的特定区域",
      subtitle: "Rect.fromLTWH(10.0, 20.0, 30.0, 40.0)",
    );
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////

}

class MyClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) => Rect.fromLTWH(10.0, 15.0, 40.0, 30.0);

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) => false;
}

// 二次封装，将 rect 声明为参数
class MyClipper2 extends CustomClipper<Rect> {
  final Rect rect;

  MyClipper2({this.rect}) : super();

  @override
  Rect getClip(Size size) => rect;

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) => false;
}
