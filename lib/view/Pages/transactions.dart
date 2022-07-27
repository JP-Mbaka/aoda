import 'package:aoda/view/dashboard/history.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../model/transactions.dart';
import '../../services/appServices.dart';

class Transactions extends StatefulWidget {
  late int selectedPage;
  Transactions(this.selectedPage);

  @override
  State<Transactions> createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {
  bool _isLoading = false;

  late List<TRansaction> transactions;
  late List<TRansaction> transferTransactions;
  late List<TRansaction> withdrawalTransactions;
  late List<TRansaction> depositTransactions;

  @override
  void initState() {
    // TODO: implement initState
    _fetchTransactions();
    super.initState();
  }

  _fetchTransactions() async {
    setState(() {
      _isLoading = true;
    });

    transactions = await Service().getTransactions();
    transferTransactions = await Service().getTransferTransactions();
    withdrawalTransactions = await Service().getWithdrawalTransactions();
    depositTransactions = await Service().getDepositTransactions();
    /******************************** YET TO IMPLEMENT TO DISPLAY DIFERENT TYPE OF TRANSACTION****************************************** */
    // for (var i in transactions) {
    //   if (i.transaction == "Transfer") {
    //     transferTransactions.add(i);
    //   } else if (i.transaction == "Withdrawal") {
    //     withdrawalTransactions.add(i);
    //   } else if (i.transaction == "Deposit") {
    //     depositTransactions.add(i);
    //   }
    // }

    if (transactions.isEmpty) {
      setState(() {
        _isLoading = true;
      });
    }
    print("Print Working from initializing transactions");
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    var color = HexColor('#0071f2');
    return DefaultTabController(
      initialIndex: widget.selectedPage,
      length: 4,
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Transactions'),
            backgroundColor: color,
            bottom: const TabBar(tabs: [
              Tab(text: 'All'),
              Tab(text: 'Transfer'),
              Tab(text: 'withdrawal'),
              Tab(text: 'Deposit')
            ]),
          ),
          body: TabBarView(children: [
            TransHistory(1, transactions),
            TransHistory(2, transferTransactions),
            TransHistory(3, withdrawalTransactions),
            TransHistory(4, depositTransactions)
          ])),
    );
  }
}
