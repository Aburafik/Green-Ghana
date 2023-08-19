import 'package:green_ghana_app/utils/exports.dart';

class ProjectHomeView extends StatelessWidget {
  ProjectHomeView({Key? key}) : super(key: key);

  final modelType = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Get.toNamed(AppRouter.home);
          },
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: decorationImage,
              gradient: linearGradient,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: linearGradient,
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset(
                      "assets/images/logo.png",
                      width: 100,
                      // height: 100,
                    ),
                    ReUsableCard(
                      title: "Register A Tree",
                      image: "trees.jpg",
                      onTap: () => Get.toNamed(AppRouter.registerTreeScreen),
                    ),
                    ReUsableCard(
                      title: "Registered Trees",
                      image: 'tree-planting.jpg',
                      onTap: () => Get.toNamed(AppRouter.regidtered_tress),
                    ),
                    Container(),
                    Column(
                      children: [
                        const Text(
                          "Logged into",
                          style: TextStyle(
                              fontSize: 16,
                              color: CustomColors.secondaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          modelType,
                          style: const TextStyle(
                              color: CustomColors.secondaryColor),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ReUsableCard extends StatelessWidget {
  const ReUsableCard({
    super.key,
    this.title,
    this.onTap,
    this.image,
  });

  final String? title;
  final void Function()? onTap;
  final String? image;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: roundedRectangleBorder,
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: CustomColors.blackColor,
                image: DecorationImage(
                    image: AssetImage("assets/images/$image"),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(10),
              ),
              height: 150,
              width: 120,
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                title!,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            )
          ],
        ),
      ),
    );
  }
}
