import 'package:cashcarefrontend/common/widgets/divider.dart';
import 'package:cashcarefrontend/common/widgets/social_buttons.dart';
import 'package:cashcarefrontend/features/auth/screen/password_config/forget_password.dart';
import 'package:cashcarefrontend/features/auth/screen/signup/signup_view.dart';
import 'package:cashcarefrontend/features/auth/screen/terms_&_conditions/terms_and_conditions_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);
  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool isChecked = true;
  bool isPasswordVisible = false;
  final controller = LoginController();

  @override
  void initState() {
    super.initState();
    _loadRememberedEmail();
  }

  Future<void> _loadRememberedEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? rememberedEmail = prefs.getString('remembered_email');
    if (rememberedEmail != null) {
      setState(() {
        controller.email.text = rememberedEmail;
        isChecked = true;
      });
    }
  }

  Future<void> _saveEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (isChecked) {
      await prefs.setString('remembered_email', controller.email.text);
    } else {
      await prefs.remove('remembered_email'); ///////saving remember me
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: controller.loginFormKey,
        child: Column(
          children: [
            SizedBox(
              height: Get.height * 0.03,
            ),
            const Text(
              'Login To Your Account',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: Get.height * 0.03,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextFormField(
                controller: controller.email,
                validator: (value) => WwValidator.isInputEmpty(value),
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    labelText: 'Email',
                    prefixIcon: Icon(
                      Icons.email_outlined,
                      color: Colors.grey,
                    ),
                    labelStyle: TextStyle(
                      color: Colors.grey,
                    )),
              ),
            ),
            SizedBox(
              height: Get.height * 0.035,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextFormField(
                controller: controller.password,
                obscureText: !isPasswordVisible,
                validator: (value) => WwValidator.isInputEmpty(value),
                decoration: InputDecoration(
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  // hintText: 'Password',
                  labelText: 'Password',
                  labelStyle: const TextStyle(
                    color: Colors.grey,
                  ),
                  prefixIcon: Icon(
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
                ),
              ),
            ),
            SizedBox(
              height: Get.height * 0.015,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Row(
                    children: [
                      Checkbox(
                        value: isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked = value!;
                            _saveEmail();
                          });
                        },
                      ),
                      const Text(
                        'Remember Me',
                        // style: TextStyle(color: Colors.white70),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: TextButton(
                    onPressed: () {
                      Get.to(() => const ForgetPassword());
                    },
                    child: const Text(
                      "Forget Password?",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: Get.height * 0.032,
            ),
            Container(
              width: Get.width * 0.8,
              height: Get.height * 0.05,
              child: ElevatedButton(
                  style: const ButtonStyle(
                      backgroundColor:
                          WidgetStatePropertyAll<Color>(Colors.blue)),
                  onPressed: () async {
                    if (controller.loginFormKey.currentState!.validate()) {
                      await _saveEmail();
                      bool loginSuccess = await controller.login();
                      // controller.login(); // Proceed with the login.
                      if (loginSuccess) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Login Successful'),
                            backgroundColor: Colors.green,
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Login Failed'),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    }
                  },
                  child: const Text(
                    "Log in",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )),
            ),
            SizedBox(
              height: Get.height * 0.01,
            ),
            Dividertext(dividerText: ' or continue with'),
            SizedBox(
              height: Get.height * 0.014,
            ),
            const Row(
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SocialButtons(),
              ],
            ),
            SizedBox(
              height: Get.height * 0.025,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Didn\'t have an account?  ',
                      style: TextStyle(
                        // color: Colors.white70,
                        fontWeight: FontWeight.w400,
                        // decoration: TextDecoration.underline,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUpScreen()));
                      },
                      child: const Text(
                        'Register Here',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  height: Get.height * 0.06,
                ),

                // ElevatedButton(
                //     onPressed: () => (Get.to(() => const SignUpScreen())),
                //     child: const Text(
                //       "Create Account",
                //       style: TextStyle(
                //           fontSize: 20,
                //           fontWeight: FontWeight.bold,
                //           color: Colors.green),
                //     )),
                const Text('Joining our app means you agree with our'),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TermsAndConditionsPage()));
                  },
                  child: const Text(
                    'Terms and Conditions',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ));
  }

  void _togglePasswordView() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }
}
