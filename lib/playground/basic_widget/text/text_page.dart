import 'package:flutter/material.dart';
import 'package:playground_in_flutter/common/text_style.dart';

// 基础页面
class TextPage extends StatelessWidget {
  final String title;
  TextPage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title ?? 'Widget - Text'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 44.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Text('Text用于显示简单样式文本，它包含一些控制文本显示样式的一些属性',
                  textAlign: TextAlign.left),
              Divider(color: Colors.black),
              Text('Text用于显示简单样式文本，它包含一些控制文本显示样式的一些属性',
                  textAlign: TextAlign.center),
              Divider(color: Colors.black),
              Text(
                'Text用于显示简单样式文本，它包含一些控制文本显示样式的一些属性',
                textAlign: TextAlign.right,
                textScaleFactor: 1.5, // 缩放比例
              ),
              Divider(color: Colors.black),
              Text('Text用于显示简单样式文本，它包含一些控制文本显示样式的一些属性' * 5,
                  textAlign: TextAlign.right,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis),
              Divider(color: Colors.black),
              Text(
                'Text用于显示简单样式文本，它包含一些控制文本显示样式的一些属性' * 5,
                textAlign: TextAlign.right,
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 18.0,
                  height:
                      1.2, // 该属性用于指定行高，但它并不是一个绝对值，而是一个因子，具体的行高等于fontSize*height。
                  fontFamily: "Courier",
                  background: new Paint()..color = Colors.yellow,
                  decoration: TextDecoration.underline,
                  decorationStyle: TextDecorationStyle.dashed,
                ),
              ),
              Divider(color: Colors.black),
              Divider(color: Colors.black),
              Divider(color: Colors.black),
              Text.rich(TextSpan(children: [
                TextSpan(text: "Home: "),
                TextSpan(
                  text: "https://flutterchina.club",
                  style: TextStyle(color: Colors.blue),
                  //recognizer: _tapRecognizer
                ),
              ])),
              Divider(color: Colors.black),
              Divider(color: Colors.black),
              Divider(color: Colors.black),
              DefaultTextStyle(
                //1.设置文本默认样式
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 20.0,
                ),
                textAlign: TextAlign.start,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                        "在Widget树中，文本的样式默认是可以被继承的（子类文本类组件未指定具体样式时可以使用Widget树中父级设置的默认样式），"),
                    Divider(color: Colors.black38),
                    Text(
                        "因此，如果在Widget树的某一个节点处设置一个默认的文本样式，那么该节点的子树中所有文本都会默认使用这个样式，"),
                    Divider(color: Colors.black38),
                    Text(
                      "而DefaultTextStyle正是用于设置默认文本样式的。",
                      style: TextStyle(
                          inherit: false, //2.不继承默认样式
                          color: Colors.grey),
                    ),
                  ],
                ),
              ),
              Divider(color: Colors.black),
              Text(
                '使用字体, ' * 10,
                style: TextStyle(fontFamily: 'Poppins'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
