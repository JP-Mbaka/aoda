import 'dart:ffi';

import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  late String? text;
  late Color? color;
  late double? fontSize;

  SmallText({this.text, this.color, this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: TextStyle(color: color, fontSize: fontSize),
    );
  }
}
