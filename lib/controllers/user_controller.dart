// ignore_for_file: unnecessary_null_comparison, invalid_use_of_protected_member

import 'package:get/state_manager.dart';
import 'package:green_ghana_app/modules/user_profile_model.dart';
import 'package:green_ghana_app/services/auth_service.dart';

AuthService authService = AuthService();

class UserProfileController extends GetxController {
  var isLoading = true.obs;
  var getUserInfor = User().obs;

  @override
  void onInit() {
    fetchUserProfile();

    super.onInit();
  }

  void fetchUserProfile() async {
    try {
      var userProfile = await authService.userProfile();

      if (userProfile != null) {
        getUserInfor.value = userProfile.user;
        // var campu = userProfile;

        // print(userProfile[0]!.id);
      }
    } finally {}
  }
}
