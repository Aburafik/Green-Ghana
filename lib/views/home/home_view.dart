import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:green_ghana_app/components/drawer_tiles.dart';
import 'package:green_ghana_app/utils/colors.dart';
import 'package:green_ghana_app/utils/routers.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text("Greenghana"),
        actions: [
          Image.asset(
            "assets/images/logo.png",
            // height: 100,
          ),
        ],
        elevation: 0,
      ),
      drawer: const Drawer(
        backgroundColor: CustomColors.primaryColor,
        child: HomeDrawer(),
      ),
      body: Stack(children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  "assets/images/tree.jpeg",
                ),
                fit: BoxFit.cover),
          ),
          child: Stack(children: [
            Container(
              color: CustomColors.primaryColor.withOpacity(.7),
              child: SafeArea(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: ListView.builder(
                        itemCount: categories.length,
                        itemBuilder: (context, index) => GestureDetector(
                              onTap: () => Get.toNamed(AppRouter.login),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 110,
                                          width: 110,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    categories[index]['image']),
                                                fit: BoxFit.cover),
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        Expanded(
                                          child: Text(
                                            categories[index]['title'],
                                            style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        )
                                      ],
                                    )),
                              ),
                            )),
                  ),
                ),
              ),
            )
          ]),
        ),
        // Container(height: 200,color: Colors.white,)
      ]),
    );
  }
}

List<Map<String, dynamic>> categories = [
  {
    "id": 1,
    "title": "General Public Tree Planting program",
    "image": "assets/images/g.jpg",
  },
  {
    "id": 2,
    "title": "Government Institutions Tree Planting Program",
    "image": "assets/images/g.jpg",
  },
  {
    "id": 3,
    "title": "Private Institutions Tree Planting Program",
    "image": "assets/images/g.jpg",
  },
  {
    "id": 4,
    "title": "Religious Groups Tree Planting Program",
    "image": "assets/images/g.jpg",
  }
];

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Image.asset(
          "assets/images/logo.png",
          height: 100,
        ),
        const DrawerTileComponent(
          title: "Profile",
          icon: FeatherIcons.user,
        ),
        const DrawerTileComponent(
          title: "Strategies",
          icon: FeatherIcons.anchor,
        ),
        const DrawerTileComponent(
          title: "About Green Ghana",
          icon: FeatherIcons.anchor,
        ),
        const DrawerTileComponent(
          title: "Get in touch",
          icon: FeatherIcons.phoneCall,
        ),
        const DrawerTileComponent(
          title: "Terms and Policy",
          icon: FeatherIcons.wifi,
        ),
        const DrawerTileComponent(
          title: "Logout",
          icon: FeatherIcons.anchor,
        )
      ],
    );
  }
}
