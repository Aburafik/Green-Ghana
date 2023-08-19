// To parse this JSON data, do
//
//     final userProfileModel = userProfileModelFromJson(jsonString);

import 'dart:convert';

UserProfileModel userProfileModelFromJson(String str) => UserProfileModel.fromJson(json.decode(str));

String userProfileModelToJson(UserProfileModel data) => json.encode(data.toJson());

class UserProfileModel {
    String message;
    User user;

    UserProfileModel({
        required this.message,
        required this.user,
    });

    factory UserProfileModel.fromJson(Map<String, dynamic> json) => UserProfileModel(
        message: json["message"],
        user: User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "user": user.toJson(),
    };
}

class User {
    String? id;
    String? name;
    String? contact;
    String? location;
    String? accountType;
    String? institutionName;
    String? institutionId;
    String? email;
    String? digitalAddress;
    String? password;
    int? v;

    User({
         this.id,
         this.name,
         this.contact,
         this.location,
         this.accountType,
         this.institutionName,
         this.institutionId,
         this.email,
         this.digitalAddress,
         this.password,
         this.v,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"],
        name: json["name"],
        contact: json["contact"],
        location: json["location"],
        accountType: json["accountType"],
        institutionName: json["institutionName"],
        institutionId: json["institutionId"],
        email: json["email"],
        digitalAddress: json["digitalAddress"],
        password: json["password"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "contact": contact,
        "location": location,
        "accountType": accountType,
        "institutionName": institutionName,
        "institutionId": institutionId,
        "email": email,
        "digitalAddress": digitalAddress,
        "password": password,
        "__v": v,
    };
}
