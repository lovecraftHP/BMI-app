import 'package:flutter/material.dart';

const containerColor = 0xffeb1555;
class ButtonBottom extends StatelessWidget {
  final String title;
  final Function onTap;

  ButtonBottom({this.title,@required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: new Container(
        margin: EdgeInsets.only(top: 8.0),
        color: Color(containerColor),
        width: double.infinity,
        height: 70.0,
        child: new Center(
          child: new Text(
            title,
            style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
