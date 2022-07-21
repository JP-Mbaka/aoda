import 'package:aoda/view/Logging/logBody.dart';
import 'package:flutter/material.dart';

class Logging extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aoda',
      home: LogBody(),
    );
  }
}
