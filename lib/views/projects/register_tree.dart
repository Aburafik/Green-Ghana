import 'package:green_ghana_app/modules/register_tree_model.dart';
import 'package:green_ghana_app/services/trees_auth.dart';
import 'package:green_ghana_app/utils/exports.dart';

class RegisterTreeVC extends StatefulWidget {
  const RegisterTreeVC({Key? key}) : super(key: key);

  @override
  State<RegisterTreeVC> createState() => _RegisterTreeVCState();
}

class _RegisterTreeVCState extends State<RegisterTreeVC> {
  TreeRegistration registration = TreeRegistration();
  TextEditingController? treeNameController;

  TextEditingController? treeHeightController;

  TextEditingController? datePlantedController;

  TextEditingController? locationController;
  @override
  void initState() {
    treeNameController = TextEditingController();
    treeHeightController = TextEditingController();
    datePlantedController = TextEditingController();
    locationController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    treeHeightController!.dispose();
    treeNameController!.dispose();
    datePlantedController!.dispose();
    locationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(title: "Register Tree"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
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
                hintText: "Tree name",
                controller: treeNameController,
              ),
              minheading(title: "Tree Height"),
              ReUsableFormWidget(
                hintText: "",
                controller: treeHeightController,
              ),
              minheading(title: "Date"),
              ReUsableFormWidget(
                hintText: "12/12/2015",
                controller: datePlantedController,
              ),
              minheading(title: "Location"),
              ReUsableFormWidget(
                hintText: "",
                controller: locationController,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                  style: TextButton.styleFrom(
                      backgroundColor: CustomColors.primaryColor),
                  onPressed: () async {
                    registration.registerTree(
                        registerTree: RegesterTreeModel(
                            treeName: treeNameController!.text,
                            treeHeight: int.parse(treeHeightController!.text),
                            locationPlanted: locationController!.text,
                            datePlanted: datePlantedController!.text),
                        context: context);
                  },
                  child: const Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        "Submit",
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
