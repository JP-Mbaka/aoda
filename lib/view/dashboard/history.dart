import 'package:aoda/model/transactions.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../components/bigText.dart';
import '../components/smallText.dart';
import 'listView.dart';

class TransHistory extends StatefulWidget {
  int transState;
  late List<TRansaction> transactions;
  TransHistory(this.transState, this.transactions);

  @override
  State<TransHistory> createState() => _TransHistoryState();
}

class _TransHistoryState extends State<TransHistory> {
  bool _isLoading = false;

  late List<TRansaction> transactions = widget.transactions;

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   _fetchTransactions();
  //   super.initState();
  // }

  // _fetchTransactions() {
  //   transactions = widget.transactions;

  //   if (transactions.isEmpty) {
  //     setState(() {
  //       _isLoading = true;
  //     });
  // late List<TRansaction> transactions;
  //   }
  //   print("Print Working from initializing transactions");
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    var color = HexColor('#0071f2');
    return _isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 80),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SmallText(text: '₦ '),
                    BigText(text: '3,859'),
                    SmallText(text: "'24"),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                alignment: Alignment.center,
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(color: color),
                child: SmallText(
                  text: 'History',
                  color: Colors.white,
                ),
              ),
              SingleChildScrollView(
                  child: Container(
                height: size.height * 0.617,
                width: double.infinity,
                child: ListViewHist(transactions),
              ))
            ],
          );
  }
}
