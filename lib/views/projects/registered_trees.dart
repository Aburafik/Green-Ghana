// ignore_for_file: unnecessary_null_comparison

import 'package:cached_network_image/cached_network_image.dart';
import 'package:green_ghana_app/modules/get_all_trees_model.dart';
import 'package:green_ghana_app/services/trees_auth.dart';
import 'package:green_ghana_app/utils/exports.dart';
import 'package:shimmer/shimmer.dart';

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
    const outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(color: CustomColors.blackColor, width: .5),
    );
    return Scaffold(
      appBar: commonAppBar(
        title: "Registerd Trees",
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    onChanged: (search) {
                      setState(() {
                        filter = search;
                        filterSearch = _treeService.filterTree(search: search);
                      });
                    },
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 10),
                      border: outlineInputBorder,
                      focusedBorder: outlineInputBorder,
                      prefixIcon: Icon(FeatherIcons.search),
                      labelText: "Search tree name",
                    ),
                  ),
                ),
                SizedBox(width: 5),
                Material(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6)),
                    color: CustomColors.primaryColor,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        FeatherIcons.filter,
                        color: CustomColors.secondaryColor,
                      ),
                    ))
              ],
            ),
            const SizedBox(height: 15),
            Expanded(
              child: FutureBuilder<List<GetAllTreeModel>>(
                  future:
                      filter != null && filter != "" ? filterSearch : future,
                  builder:
                      (context, AsyncSnapshot<List<GetAllTreeModel>> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return ListView.builder(
                          itemCount: 15,
                          itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Shimmer.fromColors(
                                  baseColor: Colors.grey.shade100,
                                  highlightColor: Colors.grey.shade300,
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 30,
                                      ),
                                      SizedBox(width: 15),
                                      Expanded(
                                          child: Container(
                                        height: 60,
                                        color: Colors.red,
                                      ))
                                    ],
                                  ),
                                ),
                          ));
                    } else if (snapshot.connectionState ==
                            ConnectionState.done &&
                        !snapshot.hasData) {
                      return const Center(
                        child: Text("Seach not found"),
                      );
                    }
                    return snapshot.data!.isEmpty
                        ? const Center(
                            child: Text("No Data Found"),
                          )
                        : ListView.builder(
                            reverse: filter.isEmpty ? true : false,
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              GetAllTreeModel data = snapshot.data![index];
                              return Column(
                                children: [
                                  GestureDetector(
                                    onTap: () => Get.toNamed(
                                      AppRouter.treeDetials,
                                      arguments: data,
                                    ),
                                    child: Container(
                                      color: Colors.white.withOpacity(.1),
                                      child: Row(
                                        children: [
                                          CachedNetworkImage(
                                            imageUrl: data.image,
                                            imageBuilder:
                                                (context, imageProvider) =>
                                                    CircleAvatar(
                                                        radius: 30,
                                                        backgroundImage:
                                                            imageProvider),
                                            placeholder: (context, url) =>
                                                CircleAvatar(
                                              radius: 30,
                                              backgroundImage: NetworkImage(
                                                  "http://via.placeholder.com/200x150"),
                                            ),
                                            errorWidget:
                                                (context, url, error) =>
                                                    Icon(Icons.error),
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
                                                      color: CustomColors
                                                          .blackColor,
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
