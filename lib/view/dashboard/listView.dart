import 'package:aoda/model/transactions.dart';
import 'package:aoda/view/dashboard/listItemHist.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ListViewHist extends StatelessWidget {
  late List<TRansaction> transaction;
  ListViewHist(this.transaction);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    var color = HexColor('#0071f2');
    return ListView.separated(
        itemBuilder: (context, index) {
          final id = transaction[index].id;
          final phoneNumber = transaction[index].phoneNumber;
          final amount = transaction[index].amount;
          final transactionM = transaction[index].transaction;
          final narration = transaction[index].narration;
          final date = transaction[index].date;
          return ListItemHist(
            id: id,
            phoneNumber: phoneNumber,
            amount: amount,
            transaction: transactionM,
            narration: narration,
            date: date,
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(
              color: Color(0xff0071f2),
              // indent: 10,
              // endIndent: 10,
            ),
        itemCount: transaction.length);
  }
}
