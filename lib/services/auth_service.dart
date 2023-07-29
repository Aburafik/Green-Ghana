// ignore_for_file: null_check_always_fails

import 'dart:convert';

import 'package:get/get_connect/connect.dart';
import 'package:green_ghana_app/modules/user_module.dart';
import 'package:green_ghana_app/utils/api_endpoints.dart';
import 'package:logger/logger.dart';

class AuthService {
  final GetConnect _connect = GetConnect(timeout: const Duration(seconds: 30));
  Logger logger = Logger();

  ///SignUp User
  Future<UserAddress> signUpUser({UserAddress? user}) async {
    final res = await _connect.post(
        "${ApIEndPoints.BASE_URL}${ApIEndPoints.SIGN_UP}", user!.toJson());
    if (res.statusCode == 200) {
      final user = userModelFromJson(res.body);
      print(user.userAddress);
      return UserAddress.fromJson(res.body);
    }
    return null!;
  }

  ///Sign In User
  Future<UserModel> signInUser(
      {String? nameOrPhoneNubmer,
      String? password,
      String? accountType}) async {
    final res = await _connect.post(
        "${ApIEndPoints.BASE_URL}${ApIEndPoints.LOG_IN}",
        jsonEncode({
          accountType == "individual" ? "contact" : "insttitutionName":
              nameOrPhoneNubmer,
          "password": password
        }));
    if (res.statusCode == 200) {
      UserModel user = userModelFromJson(res.body.toString());
      logger.d(user.userToken);
      // logger.d(res.body);
      // return User.fromJson(res.body);
    } else {
      print(res.body);
    }
    return null!;
  }
}
