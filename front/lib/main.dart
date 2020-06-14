import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:front/Home.dart';
import 'package:front/pages/login/LoginPage.dart';
import 'package:provider/provider.dart';
import 'model/userInfo.dart';
// https://book.flutterchina.club/chapter7/provider.html
void main() {
  runApp(
    ChangeNotifierProvider<UserInfo>.value(
      value: null,
      child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter rewr',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: FlutterEasyLoading(
        child: Home(),
      ),
      routes: {
         '/login': (BuildContext context) {
          return LoginPage();
        },
      },
    );
  }
}