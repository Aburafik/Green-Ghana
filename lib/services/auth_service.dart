// ignore_for_file: null_check_always_fails

import 'dart:convert';

import 'package:get/get_connect/connect.dart';
import 'package:green_ghana_app/modules/sign_uo_module.dart';
import 'package:green_ghana_app/modules/user_module.dart';
import 'package:green_ghana_app/utils/api_endpoints.dart';
import 'package:green_ghana_app/utils/exports.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final GetConnect _connect = GetConnect(timeout: const Duration(seconds: 30));
  Logger logger = Logger();

  ///SignUp User
  Future<UserAddress> signUpUser(
      {SignUpModel? signUpUser,
      BuildContext? context,
      String? modelName}) async {
    loadingBar(context!);
    final res = await _connect.post(
        "${ApIEndPoints.BASE_URL}${ApIEndPoints.SIGN_UP}",
        signUpUser!.toJson());
    if (res.statusCode == 201) {
      print(":::::::::::::::::::::::::::::::::::::::::::::::");
      logger.d(res.body);
      print(":::::::::::::::::::::::::::::::::::::::::::::::");

      if (context.mounted) {
        Navigator.pop(context);
        Get.toNamed(AppRouter.projecthome, arguments: modelName.toString());
      }
      // final user = userModelFromJson(res.body);
      // logger.d(user.userAddress);
      // return UserAddress.fromJson(res.body);
    } else {
      String message = res.body['error'] ?? res.body['message'];
      logger.d(message);
      if (context.mounted) {
        Navigator.pop(context);
        showErrorSnackBar(context: context, message: message);
      }
    }
    return null!;
  }

  ///Sign In User
  Future<UserModel> signInUser({
    String? nameOrPhoneNubmer,
    String? password,
    BuildContext? context,
    String? accountType,
    String? modelName,
  }) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    loadingBar(context!);
    final res = await _connect.post(
        "${ApIEndPoints.BASE_URL}${ApIEndPoints.LOG_IN}",
        jsonEncode({
          accountType == "individual" ? "contact" : "institutionName":
              nameOrPhoneNubmer,
          "password": password,
          "accountType": accountType
        }));
    if (res.statusCode == 200) {
      if (context.mounted) {
        Navigator.pop(context);
        Get.toNamed(AppRouter.projecthome, arguments: modelName.toString());
      }
      UserModel user = UserModel.fromJson(res.body);
      // final user = res.body['userAddress'];
      logger.d(user.userToken);
      sharedPreferences.setString("token", user.userToken);
      logger.d(res.body);
    } else {
      String message = res.body['error'];
      logger.d(res.body['error']);
      if (context.mounted) {
        Navigator.pop(context);
        showErrorSnackBar(context: context, message: message);
      }
    }
    return null!;
  }
}
