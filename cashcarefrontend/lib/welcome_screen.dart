import 'package:cashcarefrontend/routes/routes.dart';
import 'package:cashcarefrontend/theme/theme_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void visitLogin() {
      Get.toNamed(CashCareRoute.getLoginRoute());
    }

    return Theme(
        data: ThemeData.dark(),
        child: Scaffold(
          backgroundColor: Colors.black,
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: Get.height * 0.1),
                  Container(
                      margin: const EdgeInsets.only(bottom: 5),
                      child: const Text(
                        "Cash Care",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 45.0),
                      )),
                  Container(
                      child: const Text(
                    "Money Management without \n the migraines.",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  )),
                  SizedBox(height: Get.height * 0.04),
                  GestureDetector(
                    onTap: visitLogin,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Color(0xff2517DB), Color(0xff1180D1)]),
                        borderRadius: BorderRadius.circular(25.0),
                        // Add border similar to YouTube's style
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            'Get Started',
                            style: TextStyle(
                              color: ccWhite,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward,
                            color: ccWhite,
                            size: 24,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: Get.height * 0.04),
                  Container(
                    constraints: BoxConstraints(maxHeight: 500),
                    child: Image.asset(
                      // 'assets/mainbanner.png',
                      'assets/mainbanner3.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
