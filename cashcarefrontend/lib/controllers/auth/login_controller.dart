import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';

class LoginController extends ApiToken {
  //getting the single instance of class all over the application
  static LoginController get instance => Get.find();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  Future<dynamic> login() async {
    print("wait");
    Object body = {
      'email': email.text,
      'password': password.text,
    };
    if (!loginFormKey.currentState!.validate()) {
      return;
    }

    try {
      await FetchAPI(ApiUrls.loginUrl, HttpMethod.post, body: body)
          .fetchUnauthorizedAPI()
          .then((response) => _handleSucessfullLogin(response));
    } catch (e) {
      print(e);
    }
  }

  void _handleSucessfullLogin(response) {
    //Get.to(const BottomNavigation());
    //return;
    print("yes");
    if (response.statusCode != null) {
      print("No");
      if (response.statusCode == 200) {
        print("3");
        var responseData = json.decode(response.body);

        if (responseData['status'] == true) {
          print("yes");
          //filtering token from the token
          String token = responseData['token'];
          ApiToken.authToken = token;
          Get.to(const BottomNavigation());
          BalanceCardController.fetchBalanceCardData();
          BankAccController.fetchBankAccount();
          SavinggoalController.fetchSaving();
          PaymentController.fetchPayment();
          ExpenseController.fetchExpenseCategories();
        } else {
          print("No");
        }
      } else {
        print(response.body);
      }
    }
  }
}
