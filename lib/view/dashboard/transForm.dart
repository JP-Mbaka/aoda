import 'dart:math';

import 'package:aoda/model/transactions.dart';
import 'package:aoda/services/appServices.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../components/bigText.dart';
import 'dashboard.dart';

class TransForm extends StatefulWidget {
  @override
  State<TransForm> createState() => _TransFormState();
}

class _TransFormState extends State<TransForm> {
  final _formKey = GlobalKey<FormState>();
  String dropDownInitialValue = 'Bank';
  var items = ['Bank', 'not Specified'];

  final TextEditingController _accountNumber = TextEditingController();
  final TextEditingController _amount = TextEditingController();
  final TextEditingController _narration = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var color = HexColor('#0071f2');
    return SizedBox(
      // height: size.height,
      width: double.infinity,
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: size.height * 0.05),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                // boxShadow: const [
                //   BoxShadow(
                //     color: Colors.black12,
                //     blurRadius: 5,
                //   )
                // ],
                border: Border.all(),
                // borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.all(5),
              child: DropdownButton(
                isExpanded: true,
                underline: Container(),
                value: dropDownInitialValue,
                icon: const Icon(Icons.keyboard_arrow_down_rounded),
                borderRadius: BorderRadius.circular(20),
                items: items.map((e) {
                  return DropdownMenuItem(
                    value: e,
                    child: Text(e),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    dropDownInitialValue = newValue!;
                  });
                },
              ),
            ),
            SizedBox(height: size.height * 0.05),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              margin: const EdgeInsets.only(bottom: 20),
              child: TextFormField(
                controller: _accountNumber,
                keyboardType: TextInputType.number,
                maxLines: 1,
                decoration: const InputDecoration(
                  labelText: "Beneficiary Account Number",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            // SizedBox(height: size.height * 0.05),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              margin: const EdgeInsets.only(bottom: 20),
              child: TextFormField(
                controller: _amount,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "₦ Amount",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(bottom: 20),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                controller: _narration,
                decoration: const InputDecoration(
                  labelText: "Narration",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            // SizedBox(height: size.height * 0.05),
            SizedBox(
              width: size.width * 0.9,
              child: ElevatedButton(
                onPressed: () async {
                  final transfer = TRansaction(
                      id: Random().nextInt(1000).toString(),
                      phoneNumber: _accountNumber.text,
                      transaction: "Deposit",
                      amount: _amount.text,
                      narration: _narration.text,
                      date: DateTime.now().toString());
                  final result = await Service().transfer(transfer);
                  String varid;

                  result.error ?? false
                      ? varid =
                          "working from signup form ${result.errorMessage}"
                      : varid = "Created successfully";
                  print(varid);

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Dashboard(page: 0, tab: 0)));
                },
                style: ButtonStyle(
                    padding:
                        MaterialStateProperty.all(const EdgeInsets.all(10)),
                    backgroundColor: MaterialStateProperty.all(color)),
                child: const Text('Send'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
