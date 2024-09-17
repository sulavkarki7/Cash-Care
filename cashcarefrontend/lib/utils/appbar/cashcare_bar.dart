import 'package:cashcarefrontend/constants/app_constant.dart';
import 'package:cashcarefrontend/constants/app_text.dart';
import 'package:cashcarefrontend/data/user_data.dart';
import 'package:cashcarefrontend/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CashCareBar {
  static PreferredSizeWidget normalPageBar(title) {
    return AppBar(
      automaticallyImplyLeading: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Expanded(child: Text(overflow: TextOverflow.fade, title))],
      ),
    );
  }

  static PreferredSizeWidget normalBar = AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: Colors.grey[900],
    foregroundColor: Colors.white,
    title: const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppText.title,
      ],
    ),
  );

  static PreferredSizeWidget titleBar(String title) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.grey[900],
      foregroundColor: Colors.white,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title),
        ],
      ),
    );
  }

  static PreferredSizeWidget barWithProfile(
      BuildContext context, String title) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: const Text(
        "Cash Care",
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
      ),
      centerTitle: true,
      // Ensures the title is centered horizontally
      actions: [
        IconButton(
          iconSize: 30,
          icon: const Icon(Icons.person),
          color: Colors.white,
          onPressed: () {
            Get.to(ProfileScreen());
          },
        ),
      ],
    );
  }
}
