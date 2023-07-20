import 'package:green_ghana_app/utils/exports.dart';

class LoginVC extends StatefulWidget {
  const LoginVC({super.key});

  @override
  State<LoginVC> createState() => _LoginVCState();
}

class _LoginVCState extends State<LoginVC> {
  bool isSignIn = false;
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
                                ? const Column(
                                    children: [
                                      CommonTextFieldComponent(
                                        hintText: "Ente your Phone Number",
                                      ),
                                      CommonTextFieldComponent(
                                        hintText: "Enter your password",
                                      ),
                                    ],
                                  )
                                : const Column(
                                    children: [
                                      CommonTextFieldComponent(
                                        hintText: "Project Name",
                                      ),
                                      CommonTextFieldComponent(
                                        hintText: "Institution Name",
                                      ),
                                      CommonTextFieldComponent(
                                        hintText: "District",
                                      ),
                                      CommonTextFieldComponent(
                                        hintText: "District",
                                      ),
                                    ],
                                  ),
                            const SizedBox(height: 20),
                            GestureDetector(
                              onTap: () => Get.toNamed(AppRouter.projecthome),
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
