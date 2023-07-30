// ignore_for_file: must_be_immutable

import 'package:green_ghana_app/utils/exports.dart';

class TreeDetailsVC extends StatelessWidget {
  TreeDetailsVC({super.key});
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
              const ReUsableFormWidget(
                hintText: "Mahugani",
              ),
              minheading(title: "Tree Status"),
              DecoratedMaterialWidget(
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                      hint: const Text(""),
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
              const ReUsableFormWidget(
                hintText: "2cm",
              ),
              minheading(title: "Tree Width"),
              const ReUsableFormWidget(
                hintText: "10cm",
              ),
              minheading(title: "Date Planted"),
              const ReUsableFormWidget(
                hintText: "12/01/2023",
              ),
              minheading(title: "Loaction"),
              const ReUsableFormWidget(
                hintText: "Kasoa",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ReUsableFormWidget extends StatelessWidget {
  const ReUsableFormWidget({
    super.key,
    this.hintText,
    this.controller
  });
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
