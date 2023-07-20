import 'package:green_ghana_app/utils/exports.dart';

class RegisterTreeVC extends StatelessWidget {
  const RegisterTreeVC({Key? key}) : super(key: key);

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
              const ReUsableFormWidget(
                hintText: "Tree name",
              ),
              minheading(title: "Tree Height"),
              const ReUsableFormWidget(
                hintText: "",
              ),
              minheading(title: "Date"),
              const ReUsableFormWidget(
                hintText: "12/12/2015",
              ),
              minheading(title: "Location"),
              const ReUsableFormWidget(
                hintText: "",
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                  style: TextButton.styleFrom(
                      backgroundColor: CustomColors.primaryColor),
                  onPressed: () {},
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
