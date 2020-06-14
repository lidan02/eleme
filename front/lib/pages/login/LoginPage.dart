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
  final TextEditingController accountController = new TextEditingController();
  final TextEditingController passwordCodeController = new TextEditingController();


  Future<String> login() async {
    FocusScope.of(context).requestFocus(FocusNode());
    EasyLoading.show(status: '正在登录中');
    String phone = accountController.text;
    String validateCode = passwordCodeController.text;
    var response = await post('/login',
        body: {'account': phone, 'password': validateCode});
    EasyLoading.dismiss();
    Map<String, dynamic> resp = convert.jsonDecode(response);
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

  bool visible = false;
  GestureTapCallback onTap(){
    setState(() { visible = !visible; });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Icon(Icons.close, color: Colors.grey,),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: Container(
            child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(children: [
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          '账号登录',
                          style:
                              TextStyle(fontSize: 30, fontFamily: 'ALiHuiPu'),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  TextField(
                    autofocus: true,
                    controller: accountController,
                    decoration: InputDecoration(
                        hintText: '请输入账号',
                        suffixIcon: Icon(Icons.close),
                        border: InputBorder.none),
                  ),
                  Divider(
                    height: 3,
                    color: Colors.grey,
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: TextField(
                          controller: passwordCodeController,
                          obscureText: !visible,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: '密码',
                            suffixIcon: new GestureDetector(
                              onTap: onTap,
                              child: visible ?Icon(IconData(0xe633, fontFamily:'ALiIcon')):Icon(IconData(0xe634, fontFamily:'ALiIcon')),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    height: 3,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 30),
                  Row(
                    children: <Widget>[
                      Expanded(
                          child: MaterialButton(
                        textColor: Colors.white,
                        color: Colors.blue,
                        onPressed: () => login(),
                        child: Text(
                          '登录',
                          style:
                              TextStyle(fontSize: 15, fontFamily: 'ALiHuiPu',letterSpacing:10),
                        ),
                      ))
                    ],
                  )
                ]))));
  }
}
