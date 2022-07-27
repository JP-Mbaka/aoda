import 'package:aoda/view/Pages/account.dart';
import 'package:aoda/view/Pages/home.dart';
import 'package:aoda/view/Pages/transactions.dart';
import 'package:aoda/view/Pages/transfer.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Dashboard extends StatefulWidget {
  int page;
  int tab;
  Dashboard({this.page = 0, this.tab = 0});
  @override
  State<Dashboard> createState() => _DashboardState(page, tab);
}

class _DashboardState extends State<Dashboard> {
  int currentState = 0;
  int tab = 0;
  // int tab = widget.tab;
  _DashboardState(this.currentState, this.tab);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    var color = HexColor('#0071f2');
    List<Widget> pages = [
      Home(),
      Transfer(),
      Transactions(tab),
      Account(),
    ];
    return Scaffold(
      // appBar: AppBar(title: Text('Dashboard')),
      body: IndexedStack(
        index: currentState,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentState,
          onTap: (index) => setState(() => currentState = index),
          type: BottomNavigationBarType.fixed,
          backgroundColor: color,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white70,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_rounded,
              ),
              label: 'Home',
              // backgroundColor: color,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.transfer_within_a_station_rounded,
              ),
              label: 'Transfer',
              // backgroundColor: color,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.history_rounded,
              ),
              label: 'History',
              // backgroundColor: color,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.account_box_rounded,
              ),
              label: 'Account',
              // backgroundColor: color,
            )
          ]),
    );
  }
}
