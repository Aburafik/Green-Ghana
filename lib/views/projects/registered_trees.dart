import 'package:green_ghana_app/utils/exports.dart';

class RegisterdTreesVC extends StatelessWidget {
  const RegisterdTreesVC({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(
        title: "Registerd Trees",
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            const TextField(
                decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              prefixIcon: Icon(FeatherIcons.search),
              labelText: "Search",
            )),
            const SizedBox(height: 15),
            Expanded(
              child: ListView.builder(
                itemCount: 20,
                itemBuilder: (context, index) => Column(
                  children: [
                    GestureDetector(
                      onTap: () => Get.toNamed(AppRouter.treeDetials),
                      child: Row(
                        children: [
                          const CircleAvatar(
                            radius: 35,
                            backgroundImage:
                                AssetImage("assets/images/tree.jpeg"),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  "Tree Name",
                                  style: TextStyle(
                                      color: CustomColors.blackColor,
                                      fontWeight: FontWeight.bold),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 5),
                                  child: Text(
                                    "ID:5757575775",
                                    style: TextStyle(
                                        color: CustomColors.primaryColor,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    "12/07/2023",
                                    style: TextStyle(),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    const Divider(
                      thickness: 1,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
