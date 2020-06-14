import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:front/model/userInfo.dart';
import 'package:provider/provider.dart';

import 'UnLogin.dart';

class Order extends StatefulWidget {
  Order({Key key}) : super(key: key);

  @override
  _OrderState createState() => _OrderState();
}

class _OrderState extends State<Order> {
  @override
  Widget build(BuildContext context) {
    UserInfo userInfo = Provider.of<UserInfo>(context);
    print(userInfo);
    return Scaffold(
      appBar: AppBar(
        title: Text("外卖")
      ),
      body: new Center(
        child:
        userInfo == null
        ? UnLogin()
        : Text('Order'),)
    );
  }
}