import 'dart:convert';
import 'package:cashcarefrontend/api/urls/app_urls.dart';
import 'package:cashcarefrontend/controllers/budget/balance_card_controller.dart';
import 'package:cashcarefrontend/controllers/modeloperation.dart';
import 'package:cashcarefrontend/data/bank_account.dart';
import 'package:cashcarefrontend/models/bank_account.dart';
import 'package:cashcarefrontend/utils/forms/ccForm.dart';
import 'package:cashcarefrontend/utils/snackbar.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class BankAccController extends CCform {
  final TextEditingController name = TextEditingController();
  final TextEditingController accountNumber = TextEditingController();
  final TextEditingController amount = TextEditingController();

  // Method to clear form fields
  @override
  void clearFields() {
    name.clear();
    accountNumber.clear();
    amount.clear();
    formState.value = 0;
  }

  //function update the bank form response

  void update(response) async {
    try {
      print('Response: $response');
      final data = jsonDecode(response);
      print('Data: $data');
      print('Data type: ${data.runtimeType}');

      if (data.containsKey('bank_balance')) {
        BankAccount bankAccount = BankAccount.fromJson(data['bank_balance']);
        BankAccountData.bankAccountList.add(bankAccount);
        print('Bank Account Name: ${bankAccount.name}');
      } else {
        print('Error: bank_balance not found in the response');
      }
    } catch (e) {
      print('An error occurred: $e');
    }
  }

  //Upload the saving
  Future<void> addBankAcc(BuildContext context) async {
    formState.value = 1;
    if (validateForm()) {
      try {
        await ModelOperation().add(
            body: {
              "name": name.text,
              "account_number": accountNumber.text,
              "amount": amount.text
            },
            url: ApiUrls.addBankAcc,
            successAction: (response) {
              update(response);
              //refetching the updated balance
              BalanceCardController.fetchBalanceCardData();
              clearFields();
              Get.back();
              CCSnackbar.builder(
                  context, "Sucesssfully Added", CCSnackbartype.success);
            },
            errorAction: () {
              Get.back();
              formState.value = 0;
            });
      } catch (e) {
        formState.value = 0;
      }
    } else {
      CCSnackbar.builder(context, "Invalid Inputs", CCSnackbartype.error);
    }
  }

  //for fetching the bank Accounts
  static Future<void> fetchBankAccount() async {
    try {
      ModelOperation.fetchFunction(
          ApiUrls.fetchBankAcc, (json) => BankAccount.fromJson(json),
          targetList: BankAccountData.bankAccountList,
          listKey: "bank_balances");
    } catch (e) {
      print('Error: $e');
    }
  }
}
