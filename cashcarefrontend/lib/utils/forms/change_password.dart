import 'package:cashcarefrontend/controllers/auth/change_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ChangePasswordForm extends StatelessWidget {
  const ChangePasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = ChangePasswordController();
    return Theme(
        data: ThemeData.dark(),
        child: Scaffold(
            backgroundColor: Colors.grey[900],
            appBar: AppBar(
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () {
                  Get.back();
                },
              ),
              automaticallyImplyLeading: true,
              title: Text("Change Password"),
            ),
            body: Center(
              child: Form(
                  key: controller.changePasswordFormKey,
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      Container(
                        width: Get.width * 0.9,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              10.0), // Adjust the value according to your preference
                          border: Border.all(
                              color: Colors.white), // Add border color
                        ),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter the Old Password";
                            }
                            return null;
                          },
                          controller: controller.oldPassword,
                          style: const TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                            labelText: 'Old Password',
                            border: InputBorder
                                .none, // Hide the default border of the input field
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 15.0), // Adjust padding
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      Container(
                        width: Get.width * 0.9,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              10.0), // Adjust the value according to your preference
                          border: Border.all(
                              color: Colors.white), // Add border color
                        ),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter the New Password";
                            }
                            return null;
                          },
                          controller: controller.newPassword,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            labelText: 'New Password',
                            border: InputBorder
                                .none, // Hide the default border of the input field
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 15.0), // Adjust padding
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      Container(
                        width: Get.width * 0.9,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              10.0), // Adjust the value according to your preference
                          border: Border.all(
                              color: Colors.white), // Add border color
                        ),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter the Confirm New Password";
                            }
                            return null;
                          },
                          style: const TextStyle(color: Colors.white),
                          controller: controller.confirmNewPassword,
                          decoration: InputDecoration(
                            labelText: 'Confirm New Password',
                            border: InputBorder
                                .none, // Hide the default border of the input field
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 15.0), // Adjust padding
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                          style: const ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll<Color>(Colors.blue)),
                          onPressed: () => controller.changePassword(),
                          child: const Padding(
                            padding: EdgeInsets.all(6),
                            child: Text(
                              "Change Password",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          )),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  )),
            )));
  }
}
