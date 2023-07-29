// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
    String message;
    UserAddress userAddress;
    String userToken;

    UserModel({
        required this.message,
        required this.userAddress,
        required this.userToken,
    });

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        message: json["message"],
        userAddress: UserAddress.fromJson(json["userAddress"]),
        userToken: json["userToken"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "userAddress": userAddress.toJson(),
        "userToken": userToken,
    };
}

class UserAddress {
    String id;
    String name;
    String email;
    String location;
    String digitalAddress;
    String accountType;
    String institutionId;
    String institutionName;

    UserAddress({
        required this.id,
        required this.name,
        required this.email,
        required this.location,
        required this.digitalAddress,
        required this.accountType,
        required this.institutionId,
        required this.institutionName,
    });

    factory UserAddress.fromJson(Map<String, dynamic> json) => UserAddress(
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        location: json["location"],
        digitalAddress: json["digitalAddress"],
        accountType: json["accountType"],
        institutionId: json["institutionId"],
        institutionName: json["institutionName"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "email": email,
        "location": location,
        "digitalAddress": digitalAddress,
        "accountType": accountType,
        "institutionId": institutionId,
        "institutionName": institutionName,
    };
}
