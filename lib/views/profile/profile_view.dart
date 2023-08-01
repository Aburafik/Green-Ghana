import 'package:green_ghana_app/utils/exports.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(title: "Profile"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: Column(
          children: [
            CircleAvatar(
              radius: 60,
              backgroundColor: Color(0xffEDEDED),
            ),
            SizedBox(height: 60),
            profileCard(title: "Name",icon: FeatherIcons.user),
            profileCard(title: "Location",icon: FeatherIcons.home),
            profileCard(title: "Digital Address",icon: FeatherIcons.mapPin),
            profileCard(title: "Citizen Raf",icon: FeatherIcons.user),
           
          ],
        ),
      ),
    );
  }

  Card profileCard({String? title, IconData? icon}) {
    return Card(
      margin: EdgeInsets.only(top: 25),
      child: ListTile(
        leading: Icon(icon),
        title: Text(title!),
        subtitle: Text("C-00-45"),
      ),
    );
  }
}
