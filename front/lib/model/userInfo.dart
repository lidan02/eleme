import 'package:flutter/material.dart';

class UserInfo with ChangeNotifier {
  UserInfo _userInfo;
  String account;

  UserInfo({account});

  void login(userInfo) {
    _userInfo = userInfo;
    notifyListeners();//2
  }
  get userInfo => _userInfo;//3
}