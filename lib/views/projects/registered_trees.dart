// ignore_for_file: unnecessary_null_comparison

import 'package:green_ghana_app/modules/get_all_trees_model.dart';
import 'package:green_ghana_app/services/trees_auth.dart';
import 'package:green_ghana_app/utils/exports.dart';

class RegisterdTreesVC extends StatefulWidget {
  const RegisterdTreesVC({super.key});

  @override
  State<RegisterdTreesVC> createState() => _RegisterdTreesVCState();
}

class _RegisterdTreesVCState extends State<RegisterdTreesVC> {
  TreeService _treeService = TreeService();
  String filter = "";
  Future<List<GetAllTreeModel>>? future;
  Future<List<GetAllTreeModel>>? filterSearch;
  @override
  void initState() {
    // TODO: implement initState
    future = _treeService.getAlltrees();
    super.initState();
  }

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
            TextField(
                onChanged: (search) {
                  filter = search;
                  setState(() {
                    filterSearch = _treeService.filterTree(search: search);
                  });
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  prefixIcon: Icon(FeatherIcons.search),
                  labelText: "Search",
                )),
            const SizedBox(height: 15),
            Expanded(
              child: FutureBuilder<List<GetAllTreeModel>>(
                  future:
                      filter != null && filter != "" ? filterSearch : future,
                  builder:
                      (context, AsyncSnapshot<List<GetAllTreeModel>> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.connectionState ==
                            ConnectionState.done &&
                        !snapshot.hasData) {
                      return Center(
                        child: Text("Seach not found"),
                      );
                    }
                    return snapshot.data!.isEmpty
                        ? Center(
                            child: Text("No Data Found"),
                          )
                        : ListView.builder(
                            // reverse: true,
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              GetAllTreeModel data = snapshot.data![index];
                              return Column(
                                children: [
                                  GestureDetector(
                                    onTap: () => Get.toNamed(
                                        AppRouter.treeDetials,
                                        arguments: data),
                                    child: Row(
                                      children: [
                                        const CircleAvatar(
                                          radius: 35,
                                          backgroundImage: AssetImage(
                                              "assets/images/tree.jpeg"),
                                        ),
                                        const SizedBox(width: 10),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                data.treeName,
                                                style: const TextStyle(
                                                    color:
                                                        CustomColors.blackColor,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              const Padding(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 5),
                                                child: Text(
                                                  "ID:5757575775",
                                                  style: TextStyle(
                                                      color: CustomColors
                                                          .primaryColor,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ),
                                              Align(
                                                alignment:
                                                    Alignment.centerRight,
                                                child: Text(
                                                  data.datePlanted,
                                                  style: const TextStyle(),
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
                              );
                            });
                  }),
            )
          ],
        ),
      ),
    );
  }
}
