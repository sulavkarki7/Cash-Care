import 'package:cashcarefrontend/features/auth/screen/login/login_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Login extends StatelessWidget {
  const Login({super.key});
  @override
  Widget build(BuildContext context) {
    return Theme(
        data: ThemeData.dark(),
        child: Scaffold(
            backgroundColor: Colors.grey[900],
            appBar: AppBar(
                centerTitle: true,
                automaticallyImplyLeading: false,
                title: const Text(
                  'Cash Care',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 28),
                )),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Image.asset(
                        'assets/ccLogoDarkGrey.2.png',
                        height: Get.height * 0.15,
                        width: double.infinity,
                      ),
                    ),
                    const LoginForm(),
                  ],
                ),
              ),
            )));
  }
}
