import 'package:aoda/model/apiResponse.dart';
import 'package:aoda/model/auth.dart';
import 'package:aoda/services/appServices.dart';
import 'package:aoda/view/dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hexcolor/hexcolor.dart';

class LogForm extends StatefulWidget {
  @override
  State<LogForm> createState() => _LogFormState();
}

class _LogFormState extends State<LogForm> {
  final _formKey = GlobalKey<FormState>();
  // Service get s => GetIt.I<Service>();
  bool _isLoading = false;
  late var account;
  late var password;

  final TextEditingController _accountController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  // late APIResponse<List<Auth>> _users;
  late List<Auth> _users;

  @override
  void initState() {
    // TODO: implement initState

    // print("working 0 init");
    _fetchUser();
    // print("working 1 after _fetchUser");
    super.initState();
  }

  _fetchUser() async {
    // print("working 2 within Fetch user");
    setState(() {
      _isLoading = true;
    });
    // _users = await Service().getUser();
    _users = await Service().getUser();

    // var rem = _users.map((e) {
    //   var dear = e.phoneNumber;
    //   var dose = e.password;
    //   print("Dear Dose is executing");
    //   print("$dear has a password $dose");
    // });
    // print("working 3 within Fetch user after initializing \n $rem");
    // for(var i in _users){

    // }
    setState(() {
      _isLoading = false;
    });
  }

  String validatePass(value) {
    if (value.isEmpty) {
      return "Reqiured";
    } else {
      return "";
    }
  }

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
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                controller: _accountController,
                // validator: validatePass,
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
              child: TextFormField(
                controller: _passwordController,
                // validator: validatePass,
                maxLines: 1,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: size.height * 0.05),
            SizedBox(
              width: size.width * 0.9,
              child: ElevatedButton(
                onPressed: () {
                  for (var i in _users) {
                    if (_accountController.text == i.phoneNumber &&
                        _passwordController.text == i.password) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Dashboard(page: 0, tab: 0)));
                    }
                  }
                },
                style: ButtonStyle(
                    padding:
                        MaterialStateProperty.all(const EdgeInsets.all(10)),
                    backgroundColor: MaterialStateProperty.all(color)),
                child: const Text('Login'),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: _isLoading ? CircularProgressIndicator() : Container(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
