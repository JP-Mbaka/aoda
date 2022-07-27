import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../components/smallText.dart';

class MiniCard extends StatelessWidget {
  late String? sign;
  late String? miniTitle;
  late String? miniCounter;
  late String? miniTotal;
  late Icon? icon;
  late Color? miniColor;
  MiniCard(
      {this.sign = '-',
      this.miniCounter,
      this.miniTitle,
      this.miniTotal,
      this.icon,
      this.miniColor});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    var color = HexColor('#0071f2'); //0xFF0071f2
    return Container(
      height: size.height * 0.25,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(left: 8, right: 8, top: 20),
      decoration: BoxDecoration(
        color: miniColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Icon(
                Icons.collections,
                color: Colors.white,
              ),
              SmallText(
                text: miniTitle,
                fontSize: 18,
                color: Colors.white,
              )
            ],
          ),
          SmallText(
            text: "${miniCounter!}  times",
            color: Colors.white,
          ),
          SmallText(
            text: '$sign₦  $miniTotal',
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
