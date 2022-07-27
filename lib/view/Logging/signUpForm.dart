import 'package:aoda/services/appServices.dart';
import 'package:aoda/view/Logging/logging.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../model/auth.dart';
import '../components/smallText.dart';

class SignUpForm extends StatefulWidget {
  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _accountNumber = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _passwordConfirm = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var color = HexColor('#0071f2');

    return Container(
      // height: size.height,
      width: double.infinity,
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              margin: const EdgeInsets.only(bottom: 5),
              child: TextFormField(
                controller: _accountNumber,
                keyboardType: TextInputType.number,
                maxLength: 11,
                maxLines: 1,
                decoration: const InputDecoration(
                  labelText: "Account number",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              margin: const EdgeInsets.only(bottom: 20),
              child: TextFormField(
                controller: _password,
                maxLines: 1,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                controller: _passwordConfirm,
                maxLines: 1,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Confirm Password",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: size.height * 0.05),
            SizedBox(
              width: size.width * 0.9,
              child: ElevatedButton(
                onPressed: () async {
                  if (_password.text == _passwordConfirm.text) {
                    final user = Auth(
                        phoneNumber: _accountNumber.text,
                        password: _password.text);
                    print("working from signup form${user.phoneNumber}");

                    print("working from signup form${user.password}");
                    final result = await Service().createUser(user);
                    String varid;

                    result.error ?? false
                        ? varid =
                            "working from signup form ${result.errorMessage}"
                        : varid = "Created successfully";
                    print(varid);

                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Logging()));
                  }
                },
                style: ButtonStyle(
                    padding:
                        MaterialStateProperty.all(const EdgeInsets.all(10)),
                    backgroundColor: MaterialStateProperty.all(color)),
                child: const Text('Create Account'),
              ),
            ),
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
        ),
      ),
    );
  }
}
