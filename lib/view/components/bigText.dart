import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  late String? text;
  late Color? color;
  late double fontSize;
  late TextOverflow? d;

  BigText({this.text, this.color = Colors.black, this.fontSize = 34, this.d});

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: FontWeight.w600,
        overflow: d,
      ),
    );
  }
}
