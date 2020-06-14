import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:front/pages/mine/Mine.dart';
import 'package:front/pages/order/Order.dart';
import 'package:front/pages/food/Food.dart';
import 'package:front/pages/find/Find.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final List<Widget> _children = [
    Food(),
    Find(),
    Order(),
    Mine(),
  ];

  int _currentIndex = 0;

  void onTapAction(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,

        selectedFontSize: 12.0,

        //type: BottomNavigationBarType.shifting,
        currentIndex: _currentIndex,
        onTap: onTapAction,
        items: [
          new BottomNavigationBarItem(
                icon: Icon(Icons.fastfood), title: Text('外卖', style: TextStyle(fontSize: 10))
            ),
            new BottomNavigationBarItem(
                icon: Icon(Icons.search), title: Text('发现', style: TextStyle(fontSize: 10))
            ),
            new BottomNavigationBarItem(
                icon: Icon(Icons.reorder), title: Text('订单', style: TextStyle(fontSize: 10))
            ),
            new BottomNavigationBarItem(
                icon: Icon(Icons.perm_identity), title: Text('我的', style: TextStyle(fontSize: 10))
            ),
        ]
      ),
    );
  }
}