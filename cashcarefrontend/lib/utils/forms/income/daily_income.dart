import 'package:cashcarefrontend/controllers/budget/income_controller.dart';
import 'package:cashcarefrontend/data/bank_account.dart';
import 'package:cashcarefrontend/data/income_data.dart';
import 'package:cashcarefrontend/models/bank_account.dart';
import 'package:cashcarefrontend/models/income_category.dart';
import 'package:cashcarefrontend/utils/date_picker.dart';
import 'package:cashcarefrontend/utils/gaps/Xgap.dart';
import 'package:cashcarefrontend/utils/inputs/search_input.dart';
import 'package:cashcarefrontend/utils/textfields/cc_submit.dart';
import 'package:cashcarefrontend/utils/textfields/ww_textfield.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class DailyIncomeForm extends StatelessWidget {
  const DailyIncomeForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = IncomeController();

    return Builder(
      builder: (context) {
        return Form(
          key: controller.expenseFormKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                CCTextfield(
                  controller: controller.source,
                  icon: const Icon(Icons.title),
                  validator: (value) {
                    return null;
                  },
                  label: 'Source',
                ),
                gapY("md"),
                SearchInput(
                  searchList: IncomeData.allCategories,
                  searchKeyExtractor: (items) => (items as IncomeCategory).name,
                  label: "Category",
                  onSelection: (category) {
                    controller.selectedCategory =
                        category is IncomeCategory ? category : null;
                    print(category.id);
                  },
                ),
                gapY("md"),
                SearchInput(
                  searchList: BankAccountData.bankAccountList,
                  searchKeyExtractor: (items) => (items as BankAccount).name,
                  label: "Add to",
                  onSelection: (bank) {
                    controller.selectedBankAccount =
                        bank is BankAccount ? bank : null;
                    print(bank.amount);
                  },
                ),
                gapY("md"),
                CCTextfield(
                  controller: controller.amount,
                  icon: const Icon(Icons.title),
                  validator: (value) {
                    return null;
                  },
                  label: 'Amount',
                ),
                gapY("md"),
                DatePicker(
                  label: "Spent date",
                  controller:
                      controller.date, // Ensure this is a TextEditingController
                  firstDate: DateTime(2023),
                  lastDate: DateTime.now(),
                ),
                gapY("md"),
                CCSubmit(
                  onPressed: () {
                    controller.addDailyIncome(context);
                  },
                  child: Obx(
                    () => controller.formState.value == 1
                        ? const Column(
                            children: [
                              Text(
                                "Adding",
                                style: TextStyle(
                                    fontSize: 24, color: Colors.white),
                              ),
                              LinearProgressIndicator(color: Colors.white),
                            ],
                          )
                        : const Text(
                            "Add",
                            style: TextStyle(color: Colors.white, fontSize: 24),
                          ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
