import 'dart:convert';
import 'dart:io';

import 'package:green_ghana_app/modules/register_tree_model.dart';
import 'package:green_ghana_app/services/trees_auth.dart';
import 'package:green_ghana_app/utils/exports.dart';
import 'package:image_picker/image_picker.dart';

class RegisterTreeVC extends StatefulWidget {
  const RegisterTreeVC({Key? key}) : super(key: key);

  @override
  State<RegisterTreeVC> createState() => _RegisterTreeVCState();
}

class _RegisterTreeVCState extends State<RegisterTreeVC> {
  TreeService registration = TreeService();
  TextEditingController? treeNameController;

  TextEditingController? treeHeightController;

  TextEditingController? datePlantedController;

  TextEditingController? locationController;
  File? _image;
  // String? _imageUrls;
  String? selectedFile;
  String? uploadFile;

  final _picker = ImagePicker();
  Future<void> _openImagePicker({bool? isFrom}) async {
    final XFile? pickedImage = await _picker.pickImage(
        source: isFrom! ? ImageSource.gallery : ImageSource.camera);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
        print("Image: " + _image!.path);
        print("Image: " + _image!.absolute.toString());
        selectedFile = pickedImage.name;
        print(pickedImage.name);
      });
    }
  }

  ////SELECT IMAGE BOTTOM SHEET
  selectImageFrom() {
    showModalBottomSheet(
        context: context,
        builder: (context) => SafeArea(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Select image from"),
                  ),
                  ListTile(
                    onTap: () {
                      Get.back();

                      _openImagePicker(isFrom: false);
                    },
                    title: const Text("Camera"),
                    leading: const Icon(Icons.camera_alt_outlined),
                  ),
                  ListTile(
                    onTap: () {
                      Get.back();
                      _openImagePicker(isFrom: true);
                    },
                    title: const Text("Gallery"),
                    leading: const Icon(Icons.camera),
                  )
                ],
              ),
            ));
  }

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
              uploadImageAvater(),
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
                            image: "",
                            treeName: treeNameController!.text,
                            treeHeight: int.parse(treeHeightController!.text),
                            locationPlanted: locationController!.text,
                            datePlanted: datePlantedController!.text),
                        file: _image,
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

  Align uploadImageAvater() {
    return Align(
      child: Stack(
        children: [
          CircleAvatar(
            radius: 60,
            backgroundImage: _image != null ? FileImage(_image!) : null,
            backgroundColor: Color(0xffEDEDED),
            child: const Center(
              child: Icon(
                FeatherIcons.camera,
                color: Color(0xFFE1E1E1),
                size: 50,
              ),
            ),
          ),
          Positioned(
              bottom: 0,
              left: 70,
              right: 0,
              child: IconButton(
                  onPressed: () {
                    selectImageFrom();
                  },
                  icon: const Icon(
                    Icons.camera_alt_outlined,
                  )))
        ],
      ),
    );
  }
}
