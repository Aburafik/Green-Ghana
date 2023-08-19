// ignore_for_file: null_check_always_fails

import 'dart:convert';

import 'package:get/get_connect/connect.dart';
import 'package:get_storage/get_storage.dart';
import 'package:green_ghana_app/modules/sign_uo_module.dart';
import 'package:green_ghana_app/modules/user_module.dart';
import 'package:green_ghana_app/modules/user_profile_model.dart';
import 'package:green_ghana_app/utils/api_endpoints.dart';
import 'package:green_ghana_app/utils/exports.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class AuthService {
  final GetConnect _connect = GetConnect(timeout: const Duration(seconds: 30));
  Logger logger = Logger();
  final box = GetStorage();

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
      // UserAddress users = res.body['userAddress'];
      // logger.d(
      //     ":::::::::::::::::::${users.accountType}::::::::::::::::::::::::::::::::::::");
      logger.d(user.userToken);
      logger.d(user.userAddress.id);
      // logger.d(users.id);
      sharedPreferences.setString("token", user.userToken);
      sharedPreferences.setString("id", user.userAddress.id);
      logger.d(res.body);
      userProfile();
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

  //GET USER PROFILE
  Future<UserProfileModel> userProfile() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token = sharedPreferences.getString("token")!;
    String userId = sharedPreferences.getString("id")!;
    try {
      final response = await http.get(
          Uri.parse(
            "${ApIEndPoints.BASE_URL}${ApIEndPoints.GET_USER_PROFILE}$userId",
          ),
          headers: {'Authorization': "Bearer $token"});
      if (response.statusCode == 200) {
        print(":::::::::::::::::::::::::::::::::::::::::::::::>>>>>");
        logger.d(response.body);
        print(":::::::::::::::::::::::::::::::::::::::::::::::>>>>>");

        return userProfileModelFromJson(response.body.toString());
      }
    } catch (e) {
      logger.d(e.toString());
    }
    return null!;
  }

  ///LOOUT USER
  logoutUser({BuildContext? context}) async {
    loadingBar(context!);
    SharedPreferences pref = await SharedPreferences.getInstance();
    Future.delayed(Duration(seconds: 3), () {
      pref.remove('token');
      Navigator.pop(context);
      Get.toNamed(AppRouter.initialRoute);
    });
    if (context.mounted) {
      // Navigator.pop(context);
      Get.toNamed(AppRouter.initialRoute);
    }
  }
}
