import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController phoneController = new TextEditingController();
  final TextEditingController validateCodeController =
      new TextEditingController();

  Future<String> login() async {
    EasyLoading.show(status: 'loading....');
    String url = "http://192.168.1.156:7001/login";
    String phone = phoneController.text;
    String validateCode = phoneController.text;
    var response = await http.post(url, body: {'phone': phone});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    EasyLoading.dismiss();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Icon(Icons.close),
        ),
        body: Container(
            child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(children: [
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          '手机号登录',
                          style: TextStyle(fontSize: 30),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  ),
                  TextField(
                    autofocus: true,
                    controller: phoneController,
                    decoration: InputDecoration(
                        hintText: '请输入手机号', border: InputBorder.none),
                  ),
                  TextField(
                    controller: validateCodeController,
                    decoration: InputDecoration(
                        hintText: '验证码', border: InputBorder.none),
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                          child: MaterialButton(
                        textColor: Colors.white,
                        color: Colors.blue,
                        onPressed: () => login(),
                        child: Text('登录'),
                      ))
                    ],
                  )
                ]))));
  }
}
