import 'package:aoda/view/components/smallText.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../components/bigText.dart';

class ListItemHist extends StatelessWidget {
  late var id;
  late var phoneNumber;
  late var amount;
  late var transaction;
  late var narration;
  late var date;

  DateTime now = DateTime.now();

  ListItemHist({
    this.id,
    this.phoneNumber,
    this.amount,
    this.transaction,
    this.narration,
    this.date,
  });
  @override
  Widget build(BuildContext context) {
    var color = HexColor('#0071f2');

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  SmallText(text: 'Tues 28'),
                  SmallText(text: 'Jul'),
                  SmallText(text: '2022')
                ],
              ),
              SizedBox(
                child: SmallText(
                  text: transaction + "/" + narration,
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SmallText(text: '₦ '),
                  BigText(
                    text: amount,
                    fontSize: 25,
                    d: TextOverflow.ellipsis,
                  ),
                  SmallText(text: "'24"),
                ],
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SmallText(text: 'Balance: '),
              SmallText(text: '₦ 34679', color: color)
            ],
          )
        ],
      ),
    );
  }
}
