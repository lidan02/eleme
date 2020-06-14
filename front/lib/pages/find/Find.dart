import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Find extends StatefulWidget {
  Find({Key key}) : super(key: key);

  @override
  _FindState createState() => _FindState();
}

class _FindState extends State<Find> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("发现")
      ),
      body: new Center(child: Text("发现"),)
    );
  }
}