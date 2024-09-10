import 'package:cashcarefrontend/controllers/auth/logout_controller.dart';
import 'package:cashcarefrontend/features/auth/screen/terms_&_conditions/terms_and_conditions_page.dart';
import 'package:cashcarefrontend/models/user.dart';
import 'package:cashcarefrontend/utils/forms/change_password.dart';
import 'package:flutter/material.dart';
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
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/profile_pic.jpg'),
                  ),
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
              onTap: () {},
            ),
            Divider(color: Colors.grey[700]),
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
              leading: const Icon(Icons.settings_outlined, color: Colors.white),
              title: const Text(
                'Settings',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              onTap: () {},
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
                LogoutController.logout();
              },
            ),
            Divider(color: Colors.grey[700]),
          ],
        ),
      ),
    );
  }
}
