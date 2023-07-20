import 'package:green_ghana_app/components/drawer_tiles.dart';
import 'package:green_ghana_app/utils/exports.dart';

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
        DrawerTileComponent(
            title: "Strategies",
            icon: FeatherIcons.anchor,
            onTap: () {
              Navigator.pop(context);
              Get.toNamed(AppRouter.strategies);
            }),
        DrawerTileComponent(
            title: "About Green Ghana",
            icon: FeatherIcons.anchor,
            onTap: () {
              Navigator.pop(context);
              Get.toNamed(AppRouter.aboutScreen);
            }),
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
