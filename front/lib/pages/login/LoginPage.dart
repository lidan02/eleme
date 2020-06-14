import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:front/pages/const/HttpConst.dart';
import 'package:front/pages/util/HttpUtil.dart';
import 'dart:convert' as convert;

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
    EasyLoading.show(status: '正在登录中');
    String phone = phoneController.text;
    String validateCode = phoneController.text;
    var response = await post('/login',
        body: {'phone': phone, 'validateCode': validateCode});
    Map<String, dynamic> resp = convert.jsonDecode(response);
    EasyLoading.dismiss();
    if (resp['code'] == ResponseCode.SUCCESS) {
      Fluttertoast.showToast(
          msg: resp['msg'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      Fluttertoast.showToast(
          msg: resp['msg'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
    }
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
                          style:
                              TextStyle(fontSize: 30, fontFamily: 'ALiHuiPu'),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  ),
                  TextField(
                    autofocus: true,
                    controller: phoneController,
                    decoration: InputDecoration(hintText: '请输入手机号'),
                  ),
                  TextField(
                    controller: validateCodeController,
                    decoration: InputDecoration(hintText: '验证码'),
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
