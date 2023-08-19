// ignore_for_file: unnecessary_null_comparison

import 'package:get/get_instance/src/extension_instance.dart';
import 'package:green_ghana_app/controllers/user_controller.dart';
import 'package:green_ghana_app/modules/user_profile_model.dart';
import 'package:green_ghana_app/utils/exports.dart';

class ProfileView extends StatelessWidget {
  ProfileView({super.key});
  final UserProfileController userProfileController =
      Get.find<UserProfileController>();
  @override
  Widget build(BuildContext context) {
    final User user = userProfileController.getUserInfor.value;
    return Scaffold(
      appBar: commonAppBar(title: "Profile"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: user != null
            ? SingleChildScrollView(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundColor: Color(0xffEDEDED),
                    ),
                    SizedBox(height: 20),
                    profileCard(
                        title: "Name",
                        icon: FeatherIcons.user,
                        subTitle: user.name),
                    profileCard(
                        title: "Location",
                        icon: FeatherIcons.home,
                        subTitle: user.location),
                    profileCard(
                        title: "Digital Address",
                        icon: FeatherIcons.mapPin,
                        subTitle: user.digitalAddress),
                    profileCard(
                        title: "Contact",
                        icon: FeatherIcons.phone,
                        subTitle: user.contact),
                    profileCard(
                        title: "Email",
                        icon: FeatherIcons.mail,
                        subTitle: user.email),
                    profileCard(
                        title: "Account Type",
                        icon: FeatherIcons.type,
                        subTitle: user.accountType!.toUpperCase()),
                  ],
                ),
              )
            : Center(
                child: Text("Please login"),
              ),
      ),
    );
  }

  Card profileCard({String? title, IconData? icon, String? subTitle}) {
    return Card(
      margin: EdgeInsets.only(top: 25),
      child: ListTile(
        leading: Icon(icon),
        title: Text(title!),
        subtitle: Text(subTitle!),
      ),
    );
  }
}
