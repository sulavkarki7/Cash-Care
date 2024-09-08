import 'package:cashcarefrontend/controllers/modeloperation.dart';
import 'package:cashcarefrontend/data/asset_debt_data.dart';
import 'package:cashcarefrontend/models/debt.dart';
import 'package:cashcarefrontend/utils/snackbar.dart';
import 'package:flutter/material.dart';
import "package:get/get.dart";

class DebtController extends Wwform {
  final TextEditingController title = TextEditingController();
  final TextEditingController amount = TextEditingController();

  // Method to validate and create a Saving object

  // Method to clear form fields
  @override
  void clearFields() {
    amount.clear();
    title.clear();
    formState.value = 0;
  }

  //Upload the saving
  Future<void> addDebts(BuildContext context) async {
    formState.value = 1;
    if (validateForm()) {
      try {
        await ModelOperation().add(
            body: {
              "amount": int.parse(amount.text).toString(),
              "name": title.text
            },
            url: ApiUrls.addDebt,
            successAction: (response) {
              Get.back();
              clearFields();
              WwSnackbar.builder(
                  context, "Sucesssfully Added", CCSnackbartype.success);
            },
            errorAction: () {
              formState.value = 0;
            });
      } catch (e) {
        formState.value = 0;
      }
    } else {
      WwSnackbar.builder(context, "Invalid Inputs", CCSnackbartype.error);
    }
  }

  static Future<void> getDebt(BuildContext context) async {
    //formState.value = 1;
    try {
      ModelOperation.fetchFunction(ApiUrls.fetchDebt, Debt.fromJson,
          listKey: "data",
          targetList: AssetDebtData.debtData, successAction: (response) {
        try {
          //update(response);
        } catch (e) {
          throw Exception("Failed to update assets:$e");
        }
      });
      AssetDebtData.updateDebtChart();
    } catch (e) {
      //formState.value = 0;
    }
  }
}
