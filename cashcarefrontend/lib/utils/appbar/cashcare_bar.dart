import 'package:cashcarefrontend/constants/app_constant.dart';
import 'package:cashcarefrontend/constants/app_text.dart';
import 'package:cashcarefrontend/data/user_data.dart';
import 'package:cashcarefrontend/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      leading: GestureDetector(
        onTap: () {
          Get.to(ProfileScreen());
        },
        child: Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.yellow,
              width: 2,
            ),
            color: Colors.blue,
            // color: whiteColor,

            shape: BoxShape.circle,
            // border: Border.all(color: whiteColor, width: 1),
          ),
          child: Center(
            child: Text(
              getFirstandLastNameInitals(fullName.toString().toUpperCase()),
              style: TextStyle(color: Colors.pink, fontSize: 16),
              // TextStyle(
              //     color: primaryColor, fontSize: 16),
            ),
          ),
        ),
      ), // Ensures the title is centered horizontally
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
