import 'dart:convert';

import 'package:aoda/model/apiResponse.dart';
import 'package:aoda/model/auth.dart';
import 'package:aoda/model/transactions.dart';
import 'package:http/http.dart' as http;

class Service {
  static const url = "https://aoda-rest-api.herokuapp.com";
  static const headers = {
    "apikey": "5997b07c-9ab6-46eb-8442-fc9aa544cff2",
  };

  Future<APIResponse<bool>> transfer(TRansaction trans) {
    print("Working working working 1");

    return http
        .post(Uri.parse("$url/account"),
            headers: <String, String>{
              // 'Content-Type': 'application/json; charset=UTF-8',
              "apikey": "5997b07c-9ab6-46eb-8442-fc9aa544cff2",
            },
            body: trans.toJson())
        .then((data) {
      print(data.statusCode);
      if (data.statusCode == 201) {
        // print("I am working");
        return APIResponse<bool>(data: true);
      }
      return APIResponse<bool>(
          data: false, error: true, errorMessage: "An error occured");
    }).catchError((onError) => APIResponse(
            data: false,
            error: true,
            errorMessage: "An error Occured : $onError"));
  }

  Future<List<TRansaction>> getTransferTransactions() async {
    final response = await http.get(
      Uri.parse("$url/account?q=Transfer"),
    );

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body).cast<Map<String, dynamic>>();

      return jsonData
          .map<TRansaction>((json) => TRansaction.fromJson(json))
          .toList();
    } else {
      throw Exception('Failed to Load');
    }
  }

  Future<List<TRansaction>> getWithdrawalTransactions() async {
    final response = await http.get(
      Uri.parse("$url/account?q=Withdrawal"),
    );

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body).cast<Map<String, dynamic>>();

      return jsonData
          .map<TRansaction>((json) => TRansaction.fromJson(json))
          .toList();
    } else {
      throw Exception('Failed to Load');
    }
  }

  Future<List<TRansaction>> getDepositTransactions() async {
    final response = await http.get(
      Uri.parse("$url/account?q=Deposit"),
    );

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body).cast<Map<String, dynamic>>();

      return jsonData
          .map<TRansaction>((json) => TRansaction.fromJson(json))
          .toList();
    } else {
      throw Exception('Failed to Load');
    }
  }

  Future<List<TRansaction>> getTransactions() async {
    final response = await http.get(
      Uri.parse("$url/account"),
    );

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body).cast<Map<String, dynamic>>();

      return jsonData
          .map<TRansaction>((json) => TRansaction.fromJson(json))
          .toList();
    } else {
      throw Exception('Failed to Load');
    }
  }

  Future<APIResponse<bool>> createUser(Auth user) {
    print(user.phoneNumber);
    print(user.password);
    return http
        .post(Uri.parse("$url/auth"),
            headers: <String, String>{
              // 'Content-Type': 'application/json; charset=UTF-8',
              "apikey": "5997b07c-9ab6-46eb-8442-fc9aa544cff2",
            },
            body: user.toJson())
        .then((data) {
      print(data.statusCode);
      if (data.statusCode == 201) {
        // print("I am working");
        return APIResponse<bool>(data: true);
      }
      return APIResponse<bool>(
          data: false, error: true, errorMessage: "An error occured");
    }).catchError((onError) => APIResponse(
            data: false,
            error: true,
            errorMessage: "An error Occured : $onError"));
  }

  Future<List<Auth>> getUser() async {
    ///auth?q=09133950084
    // print("Working 1234");
    final response = await http.get(Uri.parse("$url/auth"));

    // print("Working");
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body).cast<Map<String, dynamic>>();

      return jsonData.map<Auth>((json) => Auth.fromJson(json)).toList();
      // return Auth.fromJson(jsonData);
      // final users = <Auth>[];
      // for (var e in jsonData) {
      //   users.add(Auth.fromJson(e));
      // }
      // return users;
      //   //   final user = Auth(
      //   //     phoneNumber: e['phoneNumber'],
      //   //     password: e['password'],
      //   //   );
      //   //   // print(user.phoneNumber);
      //   //   // print(user.password);
      //   //   users.add(user);
      // }
      // users.map((e) {
      //   print('Sample 1 ${e.phoneNumber}');
      //   print('Sample 2 ${e.password}');
      // });
      // return APIResponse<List<Auth>>(data: users); remove
    } else {
      throw Exception('Failed to Load');
    }
    // return APIResponse<List<Auth>>(
    //     data: [], error: true, errorMessage: 'Something went wrong');
  } //).catchError((er) =>
  //     APIResponse<List<Auth>>(data: [], error: true, errorMessage: er));

  List<Auth> getUserS() {
    return [
      Auth(phoneNumber: '09034526388', password: 'admin'),
      Auth(phoneNumber: '08134526388', password: 'admin'),
      Auth(phoneNumber: '07034526388', password: 'admin'),
      Auth(phoneNumber: '09134526388', password: 'admin'),
      Auth(phoneNumber: '09133950084', password: 'pass'),
    ];
  }
}
