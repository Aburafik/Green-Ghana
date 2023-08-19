// ignore_for_file: null_check_always_fails

import 'dart:io';

import 'package:green_ghana_app/modules/get_all_trees_model.dart';
import 'package:green_ghana_app/modules/register_tree_model.dart';
import 'package:green_ghana_app/utils/api_endpoints.dart';
import 'package:green_ghana_app/utils/exports.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TreeService {
  // final GetConnect _connect = GetConnect(timeout: const Duration(seconds: 30));
  Logger logger = Logger();

  Future<RegesterTreeModel> registerTree(
      {RegesterTreeModel? registerTree,
      File? file,
      BuildContext? context}) async {
    //create multipart request for POST or PATCH method
    loadingBar(context!);
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token = sharedPreferences.getString("token")!;
    var request = http.MultipartRequest("POST",
        Uri.parse("${ApIEndPoints.BASE_URL}${ApIEndPoints.REGISTER_NEW_TREE}"));
    var pic = await http.MultipartFile.fromPath("image", file!.path);
    //add multipart to request
    request.files.add(pic);
    //add text fields
    request.fields["treeName"] = registerTree!.treeName;
    request.fields["locationPlanted"] = registerTree.locationPlanted;
    request.fields["datePlanted"] = registerTree.datePlanted;
    request.fields["image"] = pic.toString();
    request.fields["treeHeight"] = registerTree.treeHeight.toString();
    request.headers.addAll({'Authorization': "Bearer $token"});

    var response = await request.send();

    print(response);
    //Get the response from the server
    var responseData = await response.stream.toBytes();
    var responseString = String.fromCharCodes(responseData);
    print(responseString);

    if (response.statusCode == 201) {
      // logger.d(response.body);
      String message = 'Tree registered successfully';
      if (context.mounted) {
        Navigator.pop(context);
        showSuccessSnackBar(message: message, context: context);
      }
      return null!;
    } else {
      logger.d(responseData);
      // String message = response.body['error'] ?? response.body['message'];
      // logger.d(message);
      if (context.mounted) {
        Navigator.pop(context);
        // showErrorSnackBar(context: context, message: message);
      }
      return null!;
    }
  }

  //GET ALL TREES
  Future<List<GetAllTreeModel>> getAlltrees() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token = sharedPreferences.getString("token")!;
    final response = await http.get(
        Uri.parse("${ApIEndPoints.BASE_URL}${ApIEndPoints.GET_ALL_TREES}"),
        headers: {'Authorization': "Bearer $token"});
    if (response.statusCode == 200) {
      logger.d(response.body);
      return getAllTreeModelFromJson(response.body.toString());
    } else {
      print(response.body);
    }
    return null!;
  }

  //FILTER ALL TREES
  Future<List<GetAllTreeModel>> filterTree({String? search}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token = sharedPreferences.getString("token")!;
    final response = await http.get(
        Uri.parse("${ApIEndPoints.BASE_URL}${ApIEndPoints.FILTER_TREE}$search"),
        headers: {'Authorization': "Bearer $token"});
    if (response.statusCode == 200) {
      logger.d(response.body);
      return getAllTreeModelFromJson(response.body.toString());
    } else {
      print(response.body);
    }
    return null!;
  }
}
