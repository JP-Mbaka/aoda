import 'package:aoda/view/Logging/logging.dart';
import 'package:aoda/view/Logging/loggingForm.dart';
import 'package:aoda/view/Logging/signUpForm.dart';
import 'package:aoda/view/components/bigText.dart';
import 'package:aoda/view/components/smallText.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class SignUpBody extends StatelessWidget {
  var color = HexColor('#0071f2');

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Aoda'),
        backgroundColor: color,
      ),
      body: Container(
        padding: EdgeInsets.only(top: size.height * 0.1),
        // decoration: BoxDecoration(color: Colors.amber),
        child: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BigText(text: 'Sign Up', color: color),
            SizedBox(height: size.height * 0.05),
            SignUpForm(),
            SizedBox(height: size.height * 0.05),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text('Already have an Account?'),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Logging()));
                    },
                    child: SmallText(
                      text: 'Sign in',
                      color: color,
                    ),
                  )
                ],
              ),
            )
          ],
        )),
      ),
    );
  }
}
