import 'package:flutter/material.dart';
class ReusableCard extends StatelessWidget {
  final Color colour;
  final Widget cardChild;
  final Function onPress;

  ReusableCard({@required this.colour,@required this.cardChild, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: new Container(
        margin: EdgeInsets.all(15.0),
        decoration: new BoxDecoration(
            color: colour,
            borderRadius: BorderRadius.circular(10.0)),
        child: cardChild,//lo que sea que tenga ese child pues sera este
      ),
    );
  }
}