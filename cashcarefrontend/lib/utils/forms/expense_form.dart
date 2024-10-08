import 'package:cashcarefrontend/controllers/budget/expense_controller.dart';
import 'package:cashcarefrontend/utils/tabs/tab.dart';
import 'package:flutter/material.dart';

class ExpenseForm extends StatelessWidget {
  const ExpenseForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = ExpenseController();
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: WwTab(
            tab1: "daily",
            tab2: "routine",
            tab1Screen: Text("hi"),
            tab2Screen: Text("tab2")),
        //child: Form(
        //  key: controller.expenseFormKey,
        //  // Wrap your TextFormField(s) in a Form widget
        //  child: Column(
        //    crossAxisAlignment: CrossAxisAlignment.stretch,
        //    children: [
        //      const Text(
        //        "Add Expense",
        //        style: TextStyle(
        //          fontSize: 24,
        //          fontWeight: FontWeight.bold,
        //        ),
        //      ),
        //      const SizedBox(height: 20),
        //      TextFormField(
        //        controller: controller.amount,
        //        decoration: const InputDecoration(
        //          labelText: "Amount",
        //          border: OutlineInputBorder(),
        //        ),
        //        keyboardType: TextInputType.number,
        //        validator: (value) {
        //          if (value == null || value.isEmpty) {
        //            return 'Please enter the amount';
        //          }
        //          return null;
        //        },
        //      ),
        //      const SizedBox(height: 20),
        //      TextFormField(
        //        controller: controller.item,
        //        decoration: const InputDecoration(
        //          labelText: "Item",
        //          border: OutlineInputBorder(),
        //        ),
        //        validator: (value) {
        //          if (value == null || value.isEmpty) {
        //            return 'Please enter the item';
        //          }
        //          return null;
        //        },
        //      ),
        //      const SizedBox(height: 20),
        //      TextFormField(
        //        controller: controller.category,
        //        decoration: const InputDecoration(
        //          labelText: "Category",
        //          border: OutlineInputBorder(),
        //        ),
        //        validator: (value) {
        //          if (value == null || value.isEmpty) {
        //            return 'Please enter the category';
        //          }
        //          return null;
        //        },
        //      ),
        //      const SizedBox(height: 20),
        //      DatePicker(
        //        controller: controller.date,
        //        firstDate: DateTime(2023),
        //        lastDate: DateTime.now(),
        //      ),
        //      const SizedBox(height: 20),
        //      ElevatedButton(
        //        onPressed: () {
        //          controller.add();
        //          // Implement form submission functionality
        //        },
        //        style: ElevatedButton.styleFrom(
        //          backgroundColor: Colors.red,
        //          padding: const EdgeInsets.symmetric(vertical: 15),
        //          elevation: 4,
        //          shape: RoundedRectangleBorder(
        //            borderRadius: BorderRadius.circular(10),
        //          ),
        //        ),
        //        child: const Text(
        //          "Submit",
        //          style: TextStyle(
        //            fontSize: 18,
        //            color: Colors.white,
        //          ),
        //        ),
        //      ),
        //    ],
        //  ),
      ),
    );
  }
}
