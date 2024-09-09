import 'package:cashcarefrontend/controllers/budget/bank_controller.dart';
import 'package:cashcarefrontend/theme/theme_constant.dart';
import 'package:cashcarefrontend/utils/appbar/cashcare_bar.dart';
import 'package:cashcarefrontend/utils/gaps/Xgap.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddBankAccForm extends StatelessWidget {
  const AddBankAccForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = BankAccController();
    return Theme(
      data: myTheme,
      child: Scaffold(
        appBar: CashCareBar.normalPageBar("Add Bank Account "),
        body: Form(
          key: controller.formKey,
          child: Center(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 300),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  CCTextfield(
                      label: "BankName",
                      controller: controller.name,
                      icon: const Icon(Icons.title),
                      validator: (value) {
                        return null;
                      }),
                  gapY("md"),
                  CCTextfield(
                      controller: controller.accountNumber,
                      label: "Account Numbers",
                      icon: const Icon(Icons.numbers),
                      validator: (value) {
                        return null;
                      }),
                  gapY("md"),
                  CCTextfield(
                      label: "Amount",
                      controller: controller.amount,
                      icon: const Icon(Icons.money),
                      validator: (value) {
                        return null;
                      }),
                  gapY("md"),
                  CCSubmit(
                    onPressed: () {
                      print(controller.formState.value);
                      controller.addBankAcc(context);
                    },
                    child: Obx(
                      () => controller.formState.value == 1
                          ? const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Adding...",
                                  style: TextStyle(
                                    fontSize: 24,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 2),
                                CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth:
                                      3, // Thinner progress indicator for a sleeker look
                                ),
                              ],
                            )
                          : const Text(
                              "Add",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
