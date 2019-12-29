import 'package:flutter/material.dart';

// 基础页面
class TextFieldPage extends StatefulWidget {
  final String title;
  TextFieldPage({Key key, this.title}) : super(key: key);

  @override
  _TextFieldPageState createState() => _TextFieldPageState();
}

class _TextFieldPageState extends State<TextFieldPage> {
  @override
  void initState() {
    _initTextFieldController();
    _initTextFieldWithFocusNodeListener();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title ?? 'Widget - TextField')),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 44.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(
                "输入框",
                style: TextStyle(fontSize: 18.0),
              ),
              Divider(
                color: Colors.black,
                height: 5,
              ),
              textFieldExampleItem(),
              usernameAndPasswordExampleItem(),
              textFieldWithEventExampleItem(),
              textFieldWithControllerExampleItem(),
              textFieldWithFocusNodeExampleItem(),
              textFieldWithFocusNodeListenerExampleItem(),
							textFieldWithDecorationExampleItem(),
            ],
          ),
        ),
      ),
    );
  }

  // 输入框
  Widget textFieldExampleItem() {
    return Column(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.fromLTRB(0, 40, 0, 5.0),
          padding: const EdgeInsets.all(10),
          color: Color(0x10000000),
          child: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(hintText: "请输入文本..."),
              ),
              TextField(
                decoration: InputDecoration(hintText: "请输入密码..."),
                obscureText: true,
              ),
            ],
          ),
        ),
        Text("输入框"),
        Divider(color: Colors.black),
      ],
    );
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////

  // 用户名、密码输入框
  Widget usernameAndPasswordExampleItem() {
    return Column(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.fromLTRB(0, 40, 0, 5.0),
          padding: const EdgeInsets.all(10),
          color: Color(0x10000000),
          child: Column(
            children: <Widget>[
              TextField(
                autofocus: true,
                decoration: InputDecoration(
                  labelText: "用户名",
                  hintText: "用户名或邮箱",
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: "密码",
                  hintText: "您的登录密码",
                  prefixIcon: Icon(Icons.lock),
                ),
                obscureText: true,
              ),
              // Text("输入框"),
            ],
          ),
        ),
        Text("登录输入框"),
        Divider(color: Colors.black),
      ],
    );
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////

  // 输入框交互
  Widget textFieldWithEventExampleItem() {
    return Column(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.fromLTRB(0, 40, 0, 5.0),
          padding: const EdgeInsets.all(10),
          color: Color(0x10000000),
          child: Column(
            children: <Widget>[
              TextField(
                  decoration: InputDecoration(hintText: "请输入文本..."),
                  onChanged: (text) {
                    print("onChange: $text");
                  }),
            ],
          ),
        ),
        Text("输入框: 可通过onChange监听输入"),
        Divider(color: Colors.black),
      ],
    );
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////

  TextEditingController _textFieldController = TextEditingController();

  // 输入框交互
  Widget textFieldWithControllerExampleItem() {
    return Column(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.fromLTRB(0, 40, 0, 5.0),
          padding: const EdgeInsets.all(10),
          color: Color(0x10000000),
          child: Column(
            children: <Widget>[
              TextField(
                controller: _textFieldController,
                decoration: InputDecoration(hintText: "请输入文本..."),
              ),
            ],
          ),
        ),
        Text("输入框：可通过controller直接设置、获取输入内容"),
        Divider(color: Colors.black),
      ],
    );
  }

  // 初始化输入框
  void _initTextFieldController() {
    _textFieldController.text = "hello world!";
    _textFieldController.selection = TextSelection(
      baseOffset: 2,
      extentOffset: _textFieldController.text.length,
    );
    //监听输入改变
    _textFieldController.addListener(() {
      print(_textFieldController.text);
    });
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////

  FocusNode focusNode1 = new FocusNode();
  FocusNode focusNode2 = new FocusNode();
  FocusScopeNode focusScopeNode;

  // 输入框 - 控制焦点
  Widget textFieldWithFocusNodeExampleItem() {
    return Column(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.fromLTRB(0, 40, 0, 5.0),
          padding: const EdgeInsets.all(10),
          color: Color(0x10000000),
          child: Column(
            children: <Widget>[
              TextField(
                autofocus: true,
                focusNode: focusNode1, //关联focusNode1
                decoration: InputDecoration(labelText: "input1"),
              ),
              TextField(
                focusNode: focusNode2, //关联focusNode2
                decoration: InputDecoration(labelText: "input2"),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(
                    child: Text("移动焦点"),
                    onPressed: () {
                      // FocusScope.of(context).requestFocus(focusNode2);
                      //将焦点从第一个TextField移到第二个TextField
                      // 这是一种写法 FocusScope.of(context).requestFocus(focusNode2);
                      // 这是第二种写法
                      if (null == focusScopeNode) {
                        focusScopeNode = FocusScope.of(context);
                        focusScopeNode.requestFocus(focusNode1);
                      } else {
                        focusScopeNode.requestFocus(focusNode2);
                      }
                    },
                  ),
                  RaisedButton(
                    child: Text("隐藏键盘"),
                    onPressed: () {
                      // 当所有编辑框都失去焦点时键盘就会收起
                      // focusNode1.unfocus();
                      // focusNode2.unfocus();

                      FocusScope.of(context).unfocus();
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
        Text("输入框：控制焦点"),
        Divider(color: Colors.black),
      ],
    );
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////

  FocusNode focusNode3 = new FocusNode();

  // 监听焦点状态改变事件
  Widget textFieldWithFocusNodeListenerExampleItem() {
    return Column(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.fromLTRB(0, 40, 0, 5.0),
          padding: const EdgeInsets.all(10),
          color: Color(0x10000000),
          child: Column(
            children: <Widget>[
              TextField(
                autofocus: true,
                focusNode: focusNode3,
                decoration: InputDecoration(labelText: "input"),
              ),
            ],
          ),
        ),
        Text("输入框：监听焦点状态改变事件"),
        Divider(color: Colors.black),
      ],
    );
  }

  void _initTextFieldWithFocusNodeListener() {
    focusNode3.addListener(() {
      print("获得焦点时focusNode.hasFocus值为true，失去焦点时为false, "
          "当前状态：${focusNode3.hasFocus}");
    });
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////

  // 监听焦点状态改变事件
  Widget textFieldWithDecorationExampleItem() {
    return Column(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.fromLTRB(0, 40, 0, 5.0),
          padding: const EdgeInsets.all(10),
          color: Color(0x10000000),
          child: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  labelText: "请输入用户名",
                  prefixIcon: Icon(Icons.person),
                  // 未获得焦点下划线设为灰色
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  //获得焦点下划线设为蓝色
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
              ),
            ],
          ),
        ),
        Text("输入框：通过decoration属性来定义输入框样式"),
        Divider(color: Colors.black),
      ],
    );
  }
}
