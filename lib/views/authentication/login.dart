import 'package:green_ghana_app/modules/user_module.dart';
import 'package:green_ghana_app/services/auth_service.dart';
// import 'package:green_ghana_app/services/auth_service.dart';
import 'package:green_ghana_app/utils/exports.dart';

class LoginVC extends StatefulWidget {
  const LoginVC({super.key});

  @override
  State<LoginVC> createState() => _LoginVCState();
}

class _LoginVCState extends State<LoginVC> {
  final AuthService _authService = AuthService();
  TextEditingController? nameController;
  TextEditingController? emailController;
  TextEditingController? contactController;
  TextEditingController? locationController;
  TextEditingController? institutionIdController;
  TextEditingController? institutionNameController;
  TextEditingController? digitalAddressController;
  TextEditingController? passwordController;

  @override
  void initState() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    contactController = TextEditingController();
    locationController = TextEditingController();
    institutionIdController = TextEditingController();
    institutionNameController = TextEditingController();
    digitalAddressController = TextEditingController();
    passwordController = TextEditingController();
    // emailController = TextEditingController();

    super.initState();
  }

  bool isSignIn = true;
  String accountType = "individual";
  @override
  void dispose() {
    nameController!.dispose();
    emailController!.dispose();
    contactController!.dispose();
    contactController!.dispose();
    locationController!.dispose();
    institutionIdController!.dispose();
    digitalAddressController!.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: commonAppBar(),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            SafeArea(
              child: Image.asset(
                "assets/images/logo.png",
                width: 100,
                // height: 100,
              ),
            ),
            // Spacer(),
            Expanded(
              child: Container(
                // height: MediaQuery.of(context).size.height / 2,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30),
                    ),
                    image: decorationImage),
                child: Stack(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(30),
                          topLeft: Radius.circular(30),
                        ),
                        gradient: linearGradient,
                      ),
                      padding: const EdgeInsets.all(10),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Text(
                                "Login",
                                style: TextStyle(
                                    color: CustomColors.secondaryColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            isSignIn
                                ? Column(
                                    children: [
                                      CommonTextFieldComponent(
                                        hintText: accountType == "individual"
                                            ? "Ente your Phone Number"
                                            : "Enter Institution Name",
                                        controller: nameController,
                                      ),
                                      CommonTextFieldComponent(
                                        hintText: "Enter your password",
                                        controller: passwordController,
                                      ),
                                    ],
                                  )
                                : Column(
                                    children: [
                                      CommonTextFieldComponent(
                                        hintText: "Project Name",
                                        controller: nameController,
                                      ),
                                      CommonTextFieldComponent(
                                        hintText: "Email",
                                        controller: emailController,
                                      ),
                                      CommonTextFieldComponent(
                                        hintText: "Institution Name",
                                        controller: institutionNameController,
                                      ),
                                      CommonTextFieldComponent(
                                        hintText:
                                            "Institution Identification Number",
                                        controller: institutionNameController,
                                      ),
                                      CommonTextFieldComponent(
                                        hintText: "Digital Address",
                                        controller: digitalAddressController,
                                      ),
                                    ],
                                  ),
                            const SizedBox(height: 20),
                            GestureDetector(
                              onTap: !isSignIn
                                  ? () async {
                                      if (accountType == "individual" ||
                                          contactController!.text.isNotEmpty ||
                                          passwordController!.text.isNotEmpty) {
                                        await _authService.signUpUser(
                                          user: UserAddress(
                                              name: nameController!.text,
                                              email: emailController!.text,
                                              location:
                                                  locationController!.text,
                                              digitalAddress:
                                                  digitalAddressController!
                                                      .text,
                                              accountType: "institution",
                                              institutionId:
                                                  institutionIdController!.text,
                                              institutionName:
                                                  institutionNameController!
                                                      .text,
                                              contact: contactController!.text),
                                        );
                                      }
                                    }
                                  : () async {
                                      if (nameController!.text.isNotEmpty &&
                                          passwordController!.text.isNotEmpty) {
                                        _authService.signInUser(
                                          accountType: accountType,
                                          nameOrPhoneNubmer:
                                              nameController!.text,
                                          password: passwordController!.text,
                                        );
                                      } else {
                                        print(
                                            "Please enter a name or phone number for the account ");
                                      }
                                    },
                              //  () => Get.toNamed(AppRouter.projecthome),
                              child: Material(
                                color: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                    side: const BorderSide(
                                        color: CustomColors.secondaryColor),
                                    borderRadius: BorderRadius.circular(10)),
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 15,
                                  ),
                                  child: Center(
                                    child: Text(
                                      "SignIn",
                                      style: TextStyle(
                                          color: CustomColors.secondaryColor),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  "Don't have an account? ",
                                ),
                                Text(
                                  "Sign up",
                                  style: TextStyle(
                                      color: CustomColors.secondaryColor),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    )
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

class CommonTextFieldComponent extends StatelessWidget {
  const CommonTextFieldComponent({
    super.key,
    this.hintText,
    this.controller,
  });
  final String? hintText;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText!,
          fillColor: CustomColors.secondaryColor,
          filled: true,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
