import 'package:cashcarefrontend/controllers/budget/asset_controller.dart';
import 'package:cashcarefrontend/theme/theme_constant.dart';
import 'package:cashcarefrontend/utils/appbar/cashcare_bar.dart';
import 'package:cashcarefrontend/utils/gaps/Xgap.dart';
import 'package:cashcarefrontend/utils/textfields/cc_submit.dart';
import 'package:cashcarefrontend/utils/textfields/ww_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddAssetForm extends StatelessWidget {
  const AddAssetForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = AssetController();
    return Theme(
      data: myTheme,
      child: Scaffold(
        appBar: CashCareBar.normalPageBar("Add Asset "),
        body: Form(
          key: controller.formKey,
          child: Center(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 300),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  gapY('md'),
                  CCTextfield(
                      label: "Name",
                      controller: controller.title,
                      icon: const Icon(Icons.title),
                      validator: (value) {
                        return null;
                      }),
                  gapY('md'),
                  CCTextfield(
                      label: "Amount",
                      controller: controller.amount,
                      icon: const Icon(Icons.attach_money),
                      validator: (value) {
                        return null;
                      }),
                  gapY("md"),
                  CCSubmit(
                    onPressed: () {
                      print(controller.formState.value);
                      controller.addAssets(context);
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
