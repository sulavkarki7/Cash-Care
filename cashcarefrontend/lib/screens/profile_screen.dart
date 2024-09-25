import 'package:cashcarefrontend/constants/app_constant.dart';
import 'package:cashcarefrontend/controllers/auth/logout_controller.dart';
import 'package:cashcarefrontend/features/auth/screen/terms_&_conditions/terms_and_conditions_page.dart';
import 'package:cashcarefrontend/models/user.dart';
import 'package:cashcarefrontend/navigation_menu.dart';
import 'package:cashcarefrontend/screens/my_info_screen.dart';
import 'package:cashcarefrontend/screens/settings_screen.dart';
import 'package:cashcarefrontend/theme/theme_constant.dart';
import 'package:cashcarefrontend/utils/forms/change_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // final User user = User(name: 'Ram Hari', id: 20, email: "ram@gmail.com");

  String _userEmail = '';
  User? user;
  String _userName = '';
  ThemeController themeController = Get.find<ThemeController>();

  @override
  void initState() {
    super.initState();
    _loadUserEmail();
  }

  Future<void> _loadUserEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _userEmail = prefs.getString('user_email') ?? 'No email found';
      _userName = prefs.getString('user_name') ?? 'No name found';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Get.back();
          },
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Profile',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.grey[900],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  SizedBox(
                    height: Get.height * 0.01,
                  ),
                  Container(
                      height: Get.height * 0.2,
                      width: Get.width * 0.98,
                      decoration: BoxDecoration(
                        color: grey.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: SizedBox(
                          height: Get.height * 0.2,
                          width: 140,
                          // color: Colors.amber,
                          child: Container(
                            height: 130,
                            width: 130,
                            decoration: BoxDecoration(
                                color: ccWhite, shape: BoxShape.circle),
                            child: Center(
                              child: Text(
                                  getFirstandLastNameInitals(
                                      _userName.toString().toUpperCase()),
                                  style: const TextStyle(
                                      fontSize: 50,
                                      fontWeight: FontWeight.bold,
                                      color: ccBlack)),
                            ),
                          ),
                        ),
                      )),
                  const SizedBox(height: 20),
                  Text(
                    _userName,
                    style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    _userEmail,
                    style: const TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: Get.height * 0.01,
            ),
            ListTile(
              leading: const Icon(Icons.person_2_outlined, color: Colors.white),
              title: const Text(
                'My Information',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              onTap: () {
                Get.to(() => MyInfoScreen());
              },
            ),
            Divider(color: Colors.grey[700]),
            ListTile(
              leading: const Icon(Icons.settings_outlined, color: Colors.white),
              title: const Text(
                'Settings',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              onTap: () {
                Get.to(() => SettingsScreen());
              },
            ),
            Divider(color: Colors.grey[700]),
            ListTile(
              leading:
                  const Icon(Icons.description_outlined, color: Colors.white),
              title: const Text(
                'Terms and Conditions',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TermsAndConditionsPage()));
              },
            ),
            Divider(color: Colors.grey[700]),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.white),
              title: const Text(
                'Logout',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              onTap: () {
                showDialog(
                    context: context,
                    builder: (
                      BuildContext context,
                    ) {
                      return AlertDialog(
                        backgroundColor: Colors.grey[900],
                        // actionsAlignment: MainAxisAlignment.spaceEvenly,
                        title: const Text('Logout'),
                        contentTextStyle:
                            TextStyle(fontSize: 18, color: ccWhite),
                        content: const Text('Are you sure you want to logout?'),
                        actions: [
                          Container(
                            width: Get.width * 0.3,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextButton(
                              style: TextButton.styleFrom(
                                foregroundColor: ccBlack,
                                backgroundColor: ccWhite,
                              ),
                              onPressed: () {
                                LogoutController.logout();
                              },
                              child: const Text('Yes'),
                            ),
                          ),
                          Container(
                            width: Get.width * 0.3,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextButton(
                              style: TextButton.styleFrom(
                                foregroundColor: ccWhite,
                                backgroundColor: grey.withOpacity(0.2),
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('No'),
                            ),
                          ),
                        ],
                      );
                    });

                // LogoutController.logout();
              },
            ),
            Divider(color: Colors.grey[700]),
          ],
        ),
      ),
    );
  }
}
