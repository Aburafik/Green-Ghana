// To parse this JSON data, do
//
//     final signUpModel = signUpModelFromJson(jsonString);

import 'dart:convert';

String signUpModelToJson(SignUpModel data) => json.encode(data.toJson());

class SignUpModel {
  String name;
  String email;
  String location;
  String accountType;
  String contact;
  String digitalAddress;
  String? institutionName;
  String password;
  String? institutionId;

  SignUpModel({
    required this.name,
    required this.email,
    required this.location,
    required this.accountType,
    required this.contact,
    required this.digitalAddress,
    this.institutionName,
    required this.password,
    this.institutionId,
  });

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "location": location,
        "accountType": accountType,
        "contact": contact,
        "digitalAddress": digitalAddress,
        "institutionName": institutionName??"null",
        "password": password,
        "institutionId": institutionId??"null",
      };
}
