import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Icon(Icons.close)
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              Text(
                '手机号登录',
                style: TextStyle(fontSize: 30)
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: '请输入手机号',
                  border: InputBorder.none
                ), 
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: '验证码',
                  border: InputBorder.none
                ), 
              ),
              Row(children: <Widget>[
                Expanded(
                  child:
                  MaterialButton(
                    textColor: Colors.white,
                    color: Colors.blue,
                    onPressed: () => {},
                    child: Text('登录'),
                  )
                )
              ],)
              
            ]
          )
        )
      )
    );
  }
}