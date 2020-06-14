import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Food extends StatefulWidget {
  Food({Key key}) : super(key: key);

  @override
  _FoodState createState() => _FoodState();
}

class _FoodState extends State<Food> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("外卖")
      ),
      body: new Center(child: Text("外卖"),)
    );
  }
}