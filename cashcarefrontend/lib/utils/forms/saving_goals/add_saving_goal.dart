import 'package:cashcarefrontend/controllers/budget/savinggoal_controller.dart';
import 'package:cashcarefrontend/theme/theme_constant.dart';
import 'package:cashcarefrontend/utils/appbar/cashcare_bar.dart';
import 'package:cashcarefrontend/utils/date_picker.dart';
import 'package:cashcarefrontend/utils/gaps/Xgap.dart';
import 'package:cashcarefrontend/utils/textfields/cc_submit.dart';
import 'package:cashcarefrontend/utils/textfields/ww_textfield.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class AddSavingGoalForm extends StatelessWidget {
  const AddSavingGoalForm({Key? key});
  InputDecoration inputDecoration(label, icon) {
    return InputDecoration(
        errorStyle: const TextStyle(color: Colors.red),
        prefixIcon: icon,
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ));
  }

  @override
  Widget build(BuildContext context) {
    final controller = SavinggoalController();

    return Theme(
      data: myTheme,
      child: Scaffold(
        appBar: CashCareBar.normalPageBar("Add Saving Goal"),
        body: Form(
          key: controller.formKey,
          child: Center(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 300),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  CCTextfield(
                    label: "Goal title",
                    controller: controller.name,
                    icon: const Icon(Icons.title),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter the Goal title";
                      }
                      return null;
                    },
                  ),
                  gapY("md"),
                  CCTextfield(
                    label: "Amount",
                    controller: controller.amount,
                    icon: const Icon(Icons.attach_money),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter the amount";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  DatePicker(
                    controller: controller.endDate,
                    firstDate: DateTime(2023),
                    lastDate: DateTime(2025),
                  ),
                  gapY("md"),
                  CCSubmit(
                    onPressed: () {
                      controller.addSaving(context);
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
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
