import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UnLogin extends StatelessWidget {
  const UnLogin({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          MaterialButton(
            child: Text('去登陆'),
            onPressed: () {
              Navigator.pushNamed(context, '/login');
            },
          ),
        ]
      ),
    );
  }
}