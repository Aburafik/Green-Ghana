import 'package:green_ghana_app/components/common_text_field.dart';
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
  String accountType = Get.parameters["accountType"]!;
  String organizationName = Get.parameters["organizationName"]!;
  @override
  void dispose() {
    nameController!.dispose();
    emailController!.dispose();
    contactController!.dispose();
    locationController!.dispose();
    institutionIdController!.dispose();
    institutionNameController!.dispose();
    digitalAddressController!.dispose();
    passwordController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(accountType);
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
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Text(
                                isSignIn ? "Login" : "Sign Up",
                                style: const TextStyle(
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
                                        controller: accountType == "individual"
                                            ? contactController
                                            : nameController,
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
                                        hintText: accountType == "individual"
                                            ? "Name"
                                            : "Project Name",
                                        controller: nameController,
                                      ),
                                      CommonTextFieldComponent(
                                        hintText: "Email",
                                        controller: emailController,
                                      ),
                                      accountType == "individual"
                                          ? const Wrap()
                                          : CommonTextFieldComponent(
                                              hintText: "Institution Name",
                                              controller:
                                                  institutionNameController,
                                            ),
                                      accountType == "individual"
                                          ? const Wrap()
                                          : CommonTextFieldComponent(
                                              hintText:
                                                  "Institution Identification Number",
                                              controller:
                                                  institutionNameController,
                                            ),
                                      CommonTextFieldComponent(
                                        hintText: "Digital Address",
                                        controller: digitalAddressController,
                                      ),
                                      CommonTextFieldComponent(
                                        hintText: "Contact",
                                        controller: contactController,
                                      ),
                                      CommonTextFieldComponent(
                                        hintText: "Password",
                                        controller: passwordController,
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
                                        // await _authService.signUpUser(
                                        //   signUpUser: SignUpModel(
                                        //       name: nameController!.text,
                                        //       email: emailController!.text,
                                        //       password:
                                        //           passwordController!.text,
                                        //       location:
                                        //           locationController!.text,
                                        //       digitalAddress:
                                        //           digitalAddressController!
                                        //               .text,
                                        //       accountType: accountType,
                                        //       institutionId:
                                        //           institutionIdController!.text,
                                        //       institutionName:
                                        //           institutionNameController!
                                        //               .text,
                                        //       contact: contactController!.text),
                                        // );
                                      }
                                    }
                                  : () async {
                                      _authService.signInUser(
                                          accountType: accountType,
                                          nameOrPhoneNubmer:
                                              accountType == "individual"
                                                  ? contactController!.text
                                                  : nameController!.text,
                                          password: passwordController!.text,
                                          context: context);
                                    },
                              //  () => Get.toNamed(AppRouter.projecthome),
                              child: Material(
                                color: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                    side: const BorderSide(
                                        color: CustomColors.secondaryColor),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 15,
                                  ),
                                  child: Center(
                                    child: Text(
                                      isSignIn ? "SignIn" : "Sign Up",
                                      style: const TextStyle(
                                          color: CustomColors.secondaryColor),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  isSignIn
                                      ? "Don't have an account? "
                                      : "Already have an account? ",
                                ),
                                GestureDetector(
                                  onTap: () => setState(() {
                                    isSignIn = !isSignIn;
                                  }),
                                  child: Text(
                                    isSignIn ? "Sign up" : "Sign In",
                                    style: const TextStyle(
                                        color: CustomColors.secondaryColor),
                                  ),
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


