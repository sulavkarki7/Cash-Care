import 'package:cashcarefrontend/models/user.dart';
import 'package:cashcarefrontend/navigation_menu.dart';

import 'package:cashcarefrontend/utils/forms/change_password.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
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
          'Settings',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.grey[900],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: Get.height * 0.01,
            ),
            ListTile(
              leading: const Icon(Icons.lock_outline, color: Colors.white),
              title: const Text(
                'Change Password',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              onTap: () {
                Get.to(const ChangePasswordForm());
              },
            ),
            Divider(color: Colors.grey[700]),
            ListTile(
              leading: Icon(
                themeController.isDarkMode.value
                    ? Icons.light_mode
                    : Icons.dark_mode,
                color: Colors.white,
              ),
              title: const Text(
                'Toggle Light/Dark Mode',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              onTap: themeController.toggleTheme,
            ),
            Divider(color: Colors.grey[700]),
          ],
        ),
      ),
    );
  }
}
