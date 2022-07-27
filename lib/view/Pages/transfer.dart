import 'package:aoda/view/components/bigText.dart';
import 'package:aoda/view/components/smallText.dart';
import 'package:aoda/view/dashboard/transForm.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Transfer extends StatelessWidget {
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    var color = HexColor('#0071f2');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transfer'),
        backgroundColor: color,
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                // color: Colors.red,
                margin: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BigText(text: '₦ 53,668.39'),
                        SmallText(
                          text: 'SAVINGS 0660362082',
                        )
                      ],
                    ),
                    const Icon(
                      Icons.visibility_rounded,
                      color: Color(0xff0071f2),
                    )
                  ],
                ),
              ),
              //Form COmes Here
              TransForm()
            ],
          ),
        ),
      ),
    );
  }
}
