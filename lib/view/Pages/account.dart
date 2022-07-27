import 'package:aoda/view/components/smallText.dart';
import 'package:flutter/material.dart';

import '../components/bigText.dart';

class Account extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.blueAccent,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/images/img1.jpg'),
        ),
      ),
      child: Center(
        child: BigText(
          text: 'Betaview',
          color: Colors.white,
        ),
      ),
    );
  }

  static fromJson(json) {}
}
