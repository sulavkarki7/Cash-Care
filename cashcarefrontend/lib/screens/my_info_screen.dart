import 'package:cashcarefrontend/constants/app_constant.dart';
import 'package:cashcarefrontend/models/user.dart';
import 'package:cashcarefrontend/navigation_menu.dart';
import 'package:cashcarefrontend/theme/theme_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyInfoScreen extends StatefulWidget {
  const MyInfoScreen({super.key});

  @override
  State<MyInfoScreen> createState() => _MyInfoScreenState();
}

class _MyInfoScreenState extends State<MyInfoScreen> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  String _userEmail = '';
  User? user;
  String _userName = '';
  String _userPhone = '';
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
      _userPhone = prefs.getString('user_phone') ?? 'No phone number found';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'My Information',
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
            Container(
                height: Get.height * 0.2,
                width: Get.width * 0.98,
                decoration: BoxDecoration(
                  color: grey.withOpacity(0.2),
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
                      decoration:
                          BoxDecoration(color: ccWhite, shape: BoxShape.circle),
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
            SizedBox(height: Get.height * 0.03),
            Text(
              'Full Name :',
              style: TextStyle(
                  color: ccWhite, fontSize: 16, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: Get.height * 0.005),
            //Input Field
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border: Border.all(color: ccWhite),
                  borderRadius: BorderRadius.circular(5)),
              width: Get.width,
              // child: TextFormField(
              //   validator: (value) {
              //     if (value == null || value.isEmpty) {
              //       return 'Enter your name';
              //     } else if (!RegExp(r'[a-zA-Z]').hasMatch(value)) {
              //       return 'Name should contain at least one letter';
              //     }
              //     return null;
              //   },
              //   controller: fullNameController,
              //   decoration: InputDecoration(
              //     enabledBorder: const OutlineInputBorder(
              //         borderSide: BorderSide(color: ccWhite)),
              //     focusedBorder: const OutlineInputBorder(
              //         borderSide: BorderSide(color: ccWhite)),
              //     border: const OutlineInputBorder(),
              //     isDense: true,
              //     contentPadding: EdgeInsets.symmetric(
              //         vertical: Get.height * 0.012, horizontal: 10),
              //   ),
              // ),
              child: Text(
                _userName,
                style: TextStyle(
                    color: ccWhite, fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(height: Get.height * 0.02),
            Text(
              'Email Address :',
              style: TextStyle(
                  color: ccWhite, fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: Get.height * 0.005),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border: Border.all(color: ccWhite),
                  borderRadius: BorderRadius.circular(5)),
              width: Get.width,
              child: Text(
                _userEmail,
                style: TextStyle(
                    color: ccWhite, fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(height: Get.height * 0.02),
            Text(
              'Phone no :',
              style: TextStyle(
                  color: ccWhite, fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: Get.height * 0.005),
            //Input Field
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border: Border.all(color: ccWhite),
                  borderRadius: BorderRadius.circular(5)),
              width: Get.width,
              child: Text(
                '9800000000',
                style: TextStyle(
                    color: ccWhite, fontSize: 20, fontWeight: FontWeight.w600),
              ),
            )
          ],
        ),
      ),
    );
  }
}
