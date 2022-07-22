import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  late String? text;
  late Color? color;
  late double fontSize;

  BigText({this.text, this.color = Colors.black, this.fontSize = 34});

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
