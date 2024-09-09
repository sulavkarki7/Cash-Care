import 'package:cashcarefrontend/controllers/budget/transaction_record_controller.dart';
import 'package:cashcarefrontend/data/bank_account.dart';
import 'package:cashcarefrontend/models/bank_account.dart';
import 'package:cashcarefrontend/utils/date_picker.dart';
import 'package:flutter/material.dart';

class FilterTransaction extends StatefulWidget {
  final TransactionRecordController controller;

  const FilterTransaction({Key? key, required this.controller})
      : super(key: key);

  @override
  State<FilterTransaction> createState() => _FilterTransactionState();
}

class _FilterTransactionState extends State<FilterTransaction> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 300),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: DatePicker(
                  controller: widget.controller.from,
                  firstDate: DateTime(2020),
                  label: 'From',
                  lastDate: DateTime.now(),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: DatePicker(
                  controller: widget.controller.to,
                  firstDate: DateTime(2020),
                  lastDate: DateTime.now(),
                  label: 'To',
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Checkbox(
                      value: false,
                      onChanged: (value) {
                        setState(() {
                          widget.controller.isExpense = value!;
                          if (value) widget.controller.isIncome = false;
                        });
                      },
                    ),
                    const Text("Expense"),
                    const SizedBox(width: 20),
                    Checkbox(
                      value: widget.controller.isIncome,
                      onChanged: (value) {
                        setState(() {
                          widget.controller.isIncome = value!;
                          if (value) widget.controller.isExpense = false;
                        });
                      },
                    ),
                    const Text("Income"),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: 200,
            child: SearchInput(
              searchList: BankAccountData.bankAccountList,
              label: "Bank.",
              searchKeyExtractor: (items) => (items as BankAccount).name,
              onSelection: (bank) {
                widget.controller.selectedBankAccount =
                    bank is BankAccount ? bank : null;
              },
            ),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.blue),
            ),
            onPressed: () {},
            child: const Text("Apply"),
          )
        ],
      ),
    );
  }
}
