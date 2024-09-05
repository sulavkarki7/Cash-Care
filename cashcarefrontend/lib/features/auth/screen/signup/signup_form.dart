import 'dart:developer';

import 'package:cashcarefrontend/features/auth/screen/terms_&_conditions/terms_and_conditions_page.dart';
import 'package:cashcarefrontend/theme/theme_constant.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:get/get.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;
  bool isChecked = false;

  Future<void> _saveUserName(String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_name', name);
    log('Name saved: $name');
  }

  Future<void> _saveUserEmail(String email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_email', email);
    log('Email saved: $email');
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());

    return Form(
        key: controller.signupFormkey,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(children: [
                    Expanded(
                        child: TextFormField(
                      controller: controller.firstName,
                      validator: (value) => WwValidator.isInputEmpty(value),
                      expands: false,
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          // border:
                          // OutlineInputBorder(
                          //     borderRadius:
                          //         BorderRadius.all(Radius.circular(20.0))
                          //         ),
                          labelText: 'First Name',
                          prefixIcon:
                              Icon(Icons.person_outline, color: Colors.grey),
                          labelStyle: TextStyle(
                            color: Colors.grey,
                          )),
                    )),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.only(left: 2, right: 17),
                      child: TextFormField(
                        controller: controller.lastName,
                        validator: (value) => WwValidator.isInputEmpty(value),
                        expands: false,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            labelText: 'Last Name',
                            labelStyle: TextStyle(
                              color: Colors.grey,
                            )),
                      ),
                    ))
                  ]),
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 15),
              //   child: TextFormField(
              //     controller: controller.firstName,
              //     validator: (value) => WwValidator.isInputEmpty(value),
              //     expands: false,
              //     decoration: const InputDecoration(
              //         prefixIcon: Icon(
              //           Icons.person_2_outlined,
              //           color: Colors.grey,
              //         ),
              //         labelText: 'Name',
              //         labelStyle: TextStyle(color: Colors.grey),
              //         border: OutlineInputBorder(
              //             borderRadius: BorderRadius.all(Radius.circular(20)))),
              //   ),
              // ),
              SizedBox(
                height: Get.height * 0.01,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: TextFormField(
                  expands: false,
                  controller: controller.email,
                  validator: (value) => WwValidator.isInputEmpty(value),
                  decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        color: Colors.grey,
                      ),
                      labelText: 'Email',
                      labelStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)))),
                ),
              ),
              SizedBox(
                height: Get.height * 0.01,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: TextFormField(
                  keyboardType: TextInputType.phone,
                  expands: false,
                  controller: controller.phoneNumber,
                  validator: (value) => WwValidator.isInputEmpty(value),
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.phone_outlined,
                      color: Colors.grey,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    labelText: 'Phone-Number',
                    labelStyle: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              SizedBox(
                height: Get.height * 0.01,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: TextFormField(
                  expands: false,
                  controller: controller.password,
                  obscureText: !isPasswordVisible,
                  validator: (value) => WwValidator.isInputEmpty(value),
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.lock_outline,
                      color: Colors.grey,
                    ),
                    suffixIcon: IconButton(
                      color: Colors.grey,
                      icon: Icon(
                        isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          isPasswordVisible = !isPasswordVisible;
                        });
                      },
                    ),
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    labelText: 'Password',
                    labelStyle: const TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              SizedBox(
                height: Get.height * 0.01,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: TextFormField(
                  expands: false,
                  controller: controller.confirmPassword,
                  obscureText: !isConfirmPasswordVisible,
                  validator: (value) => WwValidator.isInputEmpty(value),
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.lock_outline,
                      color: Colors.grey,
                    ),
                    suffixIcon: IconButton(
                      color: Colors.grey,
                      icon: Icon(
                        isConfirmPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          isConfirmPasswordVisible = !isConfirmPasswordVisible;
                        });
                      },
                    ),
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    labelText: 'Confirm-Password',
                    labelStyle: const TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              SizedBox(height: Get.height * 0.01),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  ),
                  const Text(' I agree to Privacy Policy and Term of use. '),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TermsAndConditionsPage()));
                    },
                    child: const Text(
                      'View',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: Get.height * 0.005),
              Container(
                width: Get.width * 0.8,
                height: Get.height * 0.05,
                child: ElevatedButton(
                    style: const ButtonStyle(
                        backgroundColor:
                            WidgetStatePropertyAll<Color>(Colors.blue)),
                    onPressed: () async {
                      if (!isChecked) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'You have to agree to the terms and conditions',
                              style: TextStyle(color: wwWhite),
                            ),
                            backgroundColor: Colors.red,
                          ),
                        );
                      } else {
                        if (controller.signupFormkey.currentState!.validate()) {
                          await _saveUserEmail(controller.email.text);
                          await _saveUserName(controller.firstName.text +
                              ' ' +
                              controller.lastName.text);
                          controller.signUp(); // Proceed with the signup.
                        }
                      }
                    },
                    child: const Text(
                      'SignUp',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 20),
                    )),
              ),
            ],
          ),
        ));

    // return Form(
    //     key: controller.signupFormkey,
    //     child: Column(
    //       children: [
    //         Row(children: [
    //           Expanded(
    //               child: TextFormField(
    //             controller: controller.firstName,
    //             validator: (value) => WwValidator.isInputEmpty(value),
    //             expands: false,
    //             decoration: const InputDecoration(labelText: 'firstName'),
    //           )),
    //           Expanded(
    //               child: TextFormField(
    //             controller: controller.lastName,
    //             validator: (value) => WwValidator.isInputEmpty(value),
    //             expands: false,
    //             decoration: const InputDecoration(labelText: 'lastName'),
    //           ))
    //         ]),
    //         TextFormField(
    //           expands: false,
    //           controller: controller.email,
    //           validator: (value) => WwValidator.isInputEmpty(value),
    //           decoration: const InputDecoration(labelText: 'E-mail'),
    //         ),
    //         TextFormField(
    //           expands: false,
    //           controller: controller.phoneNumber,
    //           validator: (value) => WwValidator.isInputEmpty(value),
    //           decoration: const InputDecoration(labelText: 'Phone-Number'),
    //         ),
    //         TextFormField(
    //           expands: false,
    //           controller: controller.password,
    //           obscureText: true,
    //           validator: (value) => WwValidator.isInputEmpty(value),
    //           decoration: const InputDecoration(labelText: 'Password'),
    //         ),
    //         TextFormField(
    //           expands: false,
    //           controller: controller.confirmPassword,
    //           obscureText: true,
    //           validator: (value) => WwValidator.isInputEmpty(value),
    //           decoration: const InputDecoration(labelText: 'Confirm-Password'),
    //         ),
    //         const SizedBox(height: 20),
    //         Row(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: [
    //             Checkbox(
    //               value: true,
    //               onChanged: (value) {},
    //             ),
    //             const Text("I agree to Privacy Policy and Term of use.")
    //           ],
    //         ),
    //         const SizedBox(height: 20),
    //         ElevatedButton(
    //             style: const ButtonStyle(
    //                 backgroundColor:
    //                     MaterialStatePropertyAll<Color>(Colors.blue)),
    //             onPressed: () {
    //               controller.signUp();
    //             },
    //             child: const Padding(
    //               padding: EdgeInsets.all(16),
    //               child: Text(
    //                 'SignUp',
    //                 style: TextStyle(
    //                     color: Colors.white,
    //                     fontWeight: FontWeight.bold,
    //                     fontSize: 16),
    //               ),
    //             ))
    //       ],
    //     ));
  }
}
