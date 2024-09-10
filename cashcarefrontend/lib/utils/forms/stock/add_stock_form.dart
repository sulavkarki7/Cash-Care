import 'package:cashcarefrontend/controllers/stocks/stock_and_controller.dart';
import 'package:cashcarefrontend/utils/date_picker.dart';
import 'package:cashcarefrontend/utils/gaps/Xgap.dart';
import 'package:cashcarefrontend/utils/textfields/cc_submit.dart';
import 'package:cashcarefrontend/utils/textfields/ww_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddStockForm extends StatelessWidget {
  final int stockId;
  final dynamic controller;
  AddStockForm({required this.stockId})
      : controller = StockAddController(stockId: stockId);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CCTextfield(
            label: "No of units",
            controller: controller.unit,
            icon: const Icon(Icons.update),
            validator: (value) {
              return null;
            }),
        gapY("md"),
        DatePicker(
          label: "BoughtAt",
          controller:
              controller.boughtDate, // Ensure this is a TextEditingController
          firstDate: DateTime(2000),
          lastDate: DateTime.now(),
        ),
        gapY("md"),
        CCTextfield(
            label: "Total Price",
            controller: controller.price,
            icon: const Icon(Icons.title),
            validator: (value) {
              return null;
            }),
        gapY("md"),
        CCSubmit(
            onPressed: () {
              controller.addBoughtStock(context);
            },
            child: Obx(
              () => controller.formState.value == 1
                  ? const Column(
                      children: [
                        Text(
                          "Adding",
                          style: TextStyle(fontSize: 24, color: Colors.white),
                        ),
                        LinearProgressIndicator(color: Colors.white),
                      ],
                    )
                  : const Text(
                      "Add",
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
            ))
      ],
    );
  }
}
