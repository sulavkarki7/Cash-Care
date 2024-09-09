import 'package:cashcarefrontend/controllers/budget/debt_conroller.dart';
import 'package:cashcarefrontend/theme/theme_constant.dart';
import 'package:cashcarefrontend/utils/appbar/cashcare_bar.dart';
import 'package:cashcarefrontend/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddDebtForm extends StatelessWidget {
  AddDebtForm({super.key});
  final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(20), // Make the border rounded
      borderSide: const BorderSide(color: Colors.white));

  @override
  Widget build(BuildContext context) {
    final controller = DebtController();
    return Theme(
      data: myTheme,
      child: Scaffold(
        appBar: CashCareBar.normalPageBar("Add Debt"),
        body: Form(
          key: controller.formKey,
          child: Center(
            child: Container(
              constraints: BoxConstraints(maxWidth: 300),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  TextFormField(
                    validator: (value) => WwValidator.isInputEmpty(value),
                    controller: controller.title,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.title),
                      labelText: "Name",
                      border: border,
                      enabledBorder: border,
                      focusedBorder: border,
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: controller.amount,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter the amount";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.attach_money),
                        labelText: "Amount",
                        border: border,
                        enabledBorder: border,
                        focusedBorder: border),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 20),
                  Container(
                    constraints: BoxConstraints(minWidth: 327),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () {
                        print(controller.formState.value);
                        controller.addDebts(context);
                      },
                      child: Padding(
                        padding: EdgeInsets.all(4),
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
