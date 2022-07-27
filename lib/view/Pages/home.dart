import 'package:aoda/view/Pages/transactions.dart';
import 'package:aoda/view/components/bigText.dart';
import 'package:aoda/view/components/smallText.dart';
import 'package:aoda/view/dashboard/dashboard.dart';
import 'package:aoda/view/dashboard/miniCard.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Home extends StatelessWidget {
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    DateTime now = DateTime.now();
    String greeting = "";
    if (now.hour < 12 && now.minute <= 30)
      greeting = "Good Morning";
    else if (now.hour >= 12 && now.hour < 16 && now.minute <= 30)
      greeting = "Good Afternoon";
    else if (now.hour >= 16 && now.hour < 24 && now.minute <= 30)
      greeting = "Good Evening";

    var color = HexColor('#0071f2');
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    SmallText(
                      text: greeting,
                    ),
                    BigText(
                      text: 'JohnPaul',
                      color: color,
                    )
                  ],
                ),
                Column(
                  children: [
                    Image.asset(
                      'assets/images/logo.jpeg',
                      height: 30, //size.height * 0.000005,
                      width: 30, //size.height * 0.000005,
                    ),
                    // Icon(
                    //   Icons.battery_unknown_rounded,
                    //   size: 45,
                    // ),
                    SmallText(
                      text: 'Aoda',
                      color: color,
                      fontSize: 18,
                    )
                  ],
                )
              ],
            ),
          ),
          Card(
            margin: EdgeInsets.only(top: 50, left: 10, right: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
              height: size.height * 0.3,
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SmallText(
                          text: 'SAVINGS ACCOUNT',
                        ),
                        SmallText(
                          text: '0660362082',
                        )
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Center(
                        child: Row(
                          children: [
                            SmallText(
                              text: '₦',
                            ),
                            BigText(
                              text: '1,8883',
                            ),
                            SmallText(
                              text: "'25",
                            )
                          ],
                        ),
                      ), //'-₦$miniTotal'
                      Column(
                        children: [
                          const Icon(
                            Icons.visibility_rounded,
                            color: Color(0xFF0071f2),
                          ),
                          SmallText(
                            text: 'Show Balance',
                            color: color,
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          SingleChildScrollView(
            padding: EdgeInsets.all(10),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Dashboard(
                                page: 2, tab: 3))); //Transactions(3)));
                  },
                  child: MiniCard(
                    sign: '',
                    miniTitle: 'Deposit',
                    miniCounter: '27',
                    miniTotal: '76,000',
                    miniColor: Colors.greenAccent,
                  ),
                ),
                GestureDetector(
                  onTap: (() => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Dashboard(page: 2, tab: 1)))),
                  child: MiniCard(
                    miniTitle: 'Transfer',
                    miniCounter: '7',
                    miniTotal: '12,000',
                    miniColor: Colors.amberAccent,
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Dashboard(page: 2, tab: 2))),
                  child: MiniCard(
                    miniTitle: 'Witdrawal',
                    miniCounter: '10',
                    miniTotal: '26,340',
                    miniColor: Colors.redAccent,
                  ),
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}
