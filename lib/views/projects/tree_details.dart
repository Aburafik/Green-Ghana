// ignore_for_file: must_be_immutable

import 'package:green_ghana_app/modules/get_all_trees_model.dart';
import 'package:green_ghana_app/utils/exports.dart';

class TreeDetailsVC extends StatelessWidget {
  TreeDetailsVC({super.key});
  GetAllTreeModel treeModel = Get.arguments;
  List treeStatus = ["Alive", "Dead"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(title: "ID:09585855875"),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: CircleAvatar(
                  radius: 60,
                  backgroundColor: Color(0xffEDEDED),
                  child: Icon(
                    FeatherIcons.camera,
                    color: Color(0xFFE1E1E1),
                    size: 50,
                  ),
                ),
              ),
              minheading(title: "Tree Name"),
               ReUsableFormWidget(
                hintText: treeModel.treeName,
              ),
              minheading(title: "Tree Status"),
              DecoratedMaterialWidget(
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                      hint:  Text(treeModel.status),
                      isExpanded: true,
                      items: treeStatus
                          .map((e) => DropdownMenuItem(
                                value: e,
                                child: Text(e.toString()),
                              ))
                          .toList(),
                      onChanged: (value) {}),
                ),
              ),
              minheading(title: "Tree Height"),
              ReUsableFormWidget(
                hintText: treeModel.treeHeight.toString(),
              ),
              minheading(title: "Tree Width"),
              const ReUsableFormWidget(
                hintText: "10cm",
              ),
              minheading(title: "Date Planted"),
              ReUsableFormWidget(
                hintText: treeModel.datePlanted.toString(),
              ),
              minheading(title: "Loaction"),
              ReUsableFormWidget(
                hintText: treeModel.locationPlanted,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ReUsableFormWidget extends StatelessWidget {
  const ReUsableFormWidget({super.key, this.hintText, this.controller});
  final String? hintText;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return DecoratedMaterialWidget(
      child: Center(
          child: Padding(
        padding: const EdgeInsets.only(left: 8),
        child: TextField(
          controller: controller,
          decoration:
              InputDecoration(hintText: hintText!, border: InputBorder.none),
        ),
      )),
    );
  }
}

class DecoratedMaterialWidget extends StatelessWidget {
  const DecoratedMaterialWidget({super.key, this.child});
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Material(
      shape: roundedRectangleBorder.copyWith(
          side: const BorderSide(
        color: Color(0xFFE1E1E1),
      )),
      child: child,
    );
  }
}
