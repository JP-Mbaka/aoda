class Auth {
  String? phoneNumber;
  String? password;

  Auth({this.phoneNumber, this.password});

  factory Auth.fromJson(Map<String, dynamic> item) {
    return Auth(
      phoneNumber: item['phoneNumber'],
      password: item['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "phoneNumber": phoneNumber,
      "password": password,
    };
  }
}
