import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:green_ghana_app/utils/routers.dart';

class IntroView extends StatelessWidget {
  const IntroView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          // color: Colors.red,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  "assets/images/cover.jpeg",
                ),
                fit: BoxFit.cover),
          ),
          child: Stack(children: [
            Container(
              color: Colors.grey.withOpacity(.6),
              child: SafeArea(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Image.asset(
                            "assets/images/logo.png",
                            height: 150,
                          ),
                          const Text(
                            "Lets Go Planting",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () => Get.toNamed(AppRouter.home),
                            child: Material(
                                color: Colors.grey.withOpacity(.0),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    side: const BorderSide(
                                        color: Colors.white, width: 2)),
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 50),
                                  child: Text("Start",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20)),
                                )),
                          ),
                          const SizedBox(
                            height: 100,
                          ),
                          const Text("Central tech Hub"),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ]),
        )
      ]),
    );
  }
}
