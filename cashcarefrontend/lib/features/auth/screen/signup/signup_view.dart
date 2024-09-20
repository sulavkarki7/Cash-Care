import 'package:cashcarefrontend/common/widgets/divider.dart';
import 'package:cashcarefrontend/features/auth/screen/login/login_view.dart';
import 'package:cashcarefrontend/features/auth/screen/signup/signup_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.dark(),
      child: Scaffold(
          backgroundColor: Colors.grey[900],
          appBar: AppBar(
              surfaceTintColor: Colors.grey[900],
              automaticallyImplyLeading: false,
              centerTitle: true,
              title: const Text(
                'Cash Care',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 28),
              )),
          body: SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.all(5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Image.asset(
                    'assets/ccLogoDarkGrey.2.png',
                    height: Get.height * 0.15,
                    width: double.infinity,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: const Text(
                    "Create Your Account",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                const SignUpForm(),
                const Dividertext(dividerText: ' or'),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Already have an account?  ',
                        style: TextStyle(
                          // color: wwBlac,
                          fontWeight: FontWeight.w400,
                          // decoration: TextDecoration.underline,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Login()));
                        },
                        child: const Text(
                          'Login Here',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.05,
                ),
                // const Text('Joining our app means you agree with our'),
                // GestureDetector(
                //   onTap: () {
                //     Navigator.push(
                //         context,
                //         MaterialPageRoute(
                //             builder: (context) => TermsAndConditionsPage()));
                //   },
                //   child: const Text(
                //     'Terms and Conditions',
                //     style: TextStyle(
                //       color: Colors.blue,
                //       fontWeight: FontWeight.bold,
                //       decoration: TextDecoration.underline,
                //     ),
                //   ),
                // ),
              ],
            ),
          ))),
    );
  }
}
