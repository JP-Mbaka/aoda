import 'package:aoda/view/Logging/loggingForm.dart';
import 'package:aoda/view/components/bigText.dart';
import 'package:aoda/view/components/smallText.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'signup.dart';

class LogBody extends StatefulWidget {
  @override
  State<LogBody> createState() => _LogBodyState();
}

class _LogBodyState extends State<LogBody> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    var color = HexColor('#0071f2');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Aoda'),
        backgroundColor: color,
        // foregroundColor:HexColor('#2f2e41'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: size.height * 0.1),
        // decoration: BoxDecoration(color: Colors.amber),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //const Text('Sign in'),
              BigText(text: 'Sign in', color: color),
              SizedBox(height: size.height * 0.05),
              LogForm(),
              SizedBox(height: size.height * 0.05),
              Container(
                padding: EdgeInsets.only(
                    left: size.width * 0.2, right: size.width * 0.2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text('If not registered ?'),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => SignUp()));
                      },
                      child: SmallText(
                        text: 'Sign Up',
                        color: color,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
