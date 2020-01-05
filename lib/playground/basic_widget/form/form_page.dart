import 'package:flutter/material.dart';

// 基础页面
class FormPage extends StatefulWidget {
  final String title;
  FormPage({Key key, this.title}) : super(key: key);

  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title ?? 'Widget - Form 表单')),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 44.0),
        child: Center(
          child: Column(
            children: <Widget>[
              formExampleItem(),
            ],
          ),
        ),
      ),
    );
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////

  TextEditingController _unameController = new TextEditingController();
  TextEditingController _pwdController = new TextEditingController();
  GlobalKey _formKey = new GlobalKey<FormState>();

  // 输入框
  Widget formExampleItem() {
    return Column(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.fromLTRB(0, 0, 0, 5.0),
          padding: const EdgeInsets.all(10),
          color: Color(0x10000000),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
            child: Form(
              key: _formKey, //设置globalKey，用于后面获取FormState
              autovalidate: true, //开启自动校验
              child: Column(
                children: <Widget>[
                  TextFormField(
                      autofocus: true,
                      controller: _unameController,
                      decoration: InputDecoration(
                        labelText: "用户名",
                        hintText: "用户名或邮箱",
                        icon: Icon(Icons.person),
                      ),
                      // 校验用户名
                      validator: (v) {
                        return v.trim().length > 0 ? null : "用户名不能为空";
                      }),
                  TextFormField(
                      controller: _pwdController,
                      decoration: InputDecoration(
                        labelText: "密码",
                        hintText: "您的登录密码",
                        icon: Icon(Icons.lock),
                      ),
                      obscureText: true,
                      //校验密码
                      validator: (v) {
                        return v.trim().length > 5 ? null : "密码不能少于6位";
                      }),
                  // 登录按钮
                  Padding(
                    padding: const EdgeInsets.only(top: 28.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: RaisedButton(
                            padding: EdgeInsets.all(15.0),
                            child: Text("登录"),
                            color: Theme.of(context).primaryColor,
                            textColor: Colors.white,
                            onPressed: () {
                              //在这里不能通过此方式获取FormState，context不对
                              //print(Form.of(context));

                              // 通过_formKey.currentState 获取FormState后，
                              // 调用validate()方法校验用户名密码是否合法，校验
                              // 通过后再提交数据。
                              if ((_formKey.currentState as FormState)
                                  .validate()) {
                                //验证通过提交数据
																print("提交表单：用户名=${_unameController.text}, 密码=${_pwdController.text} ");
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Text("用户登录的示例，在提交之前校验：\n"
            "\n1. 用户名不能为空，如果为空则提示“用户名不能为空”;"
            "\n2. 密码不能小于6位，如果小于6为则提示“密码不能少于6位”。"),
        Divider(color: Colors.black),
      ],
    );
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////

}
