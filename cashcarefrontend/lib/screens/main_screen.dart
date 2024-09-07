import 'package:cashcarefrontend/controllers/budget/balance_card_controller.dart';
import 'package:cashcarefrontend/controllers/budget/bank_controller.dart';
import 'package:cashcarefrontend/controllers/budget/debt_conroller.dart';
import 'package:cashcarefrontend/controllers/budget/expense_controller.dart';
import 'package:cashcarefrontend/controllers/budget/income_controller.dart';
import 'package:cashcarefrontend/controllers/budget/transaction_record_controller.dart';
import 'package:cashcarefrontend/controllers/stocks/stock_and_controller.dart';
import 'package:cashcarefrontend/controllers/stocks/stock_fetch_controller.dart';
import 'package:cashcarefrontend/data/bank_account.dart';
import 'package:cashcarefrontend/data/payment_data.dart';
import 'package:cashcarefrontend/data/saving_goals.dart';
import 'package:cashcarefrontend/utils/cards/balance_card.dart';
import 'package:cashcarefrontend/utils/cards/bank_card.dart';
import 'package:cashcarefrontend/utils/cards/savinggoal_card.dart';
import 'package:cashcarefrontend/utils/cards/upcoming_payment_card.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key});
  Widget gap(int height) {
    return (SizedBox(height: height.toDouble()));
  }

  Padding title(String title) {
    return Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 32,
          ),
          textAlign: TextAlign.start,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator.adaptive(
      onRefresh: () async {
        IncomeController.fetchIncomes();
        BankAccController.fetchBankAccount();
        ExpenseController.fetchExpenseCategories();
        StockAddController.fetchBoughtStock();
        // SavingGoalController.fetchSavingGoals();
        DebtController.getDebt(context);
        // AssetController.fetchAssetDebt();
        BalanceCardController.fetchBalanceCardData();
        TransactionRecordController.fetchRecords();
        StockFetchController();
      },
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //balnaceCard section
                const BalanceCard(),
                gap(20),
                //ElevatedButton(
                //onPressed: () {
                //IncomeController.fetchItemForCategory();
                //StockAddController.fetchBoughtStock();
                //DebtController.getDebt(context);
                //StockFetchController().getLstmData();
                //ExpenseController.fetchItemForCategory(1);
                //IncomeController.fetchIncomes();
                //ExpenseController.fetchExpenseCategories();
                //print(ExpenseData.detailedCategory);
                //ExpenseController.fetchUserCategories();
                //BalanceCardController.fetchBalanceCardData();
                //

                //TransactionRecordController.fetchRecords();
                //IncomeController.fetchIncomes();
                //BankAccController.fetchBankAccount();
                //ExpenseController.fetchExpenseCategories();
                //StockAddController.fetchBoughtStock();
                //},
                //child: const Text("fetch")),

                //ElevatedButton(
                //onPressed: () {
                //IncomeController.fetchItemForCategory();
                //StockAddController.fetchBoughtStock();
                //DebtController.getDebt(context);
                //StockFetchController().getLstmData();
                //ExpenseController.fetchItemForCategory(1);
                //IncomeController.fetchIncomes();
                //ExpenseController.fetchExpenseCategories();
                //print(ExpenseData.detailedCategory);
                //ExpenseController.fetchUserCategories();
                //IncomeController.fetchIncomeCategories();
                //BalanceCardController.fetchBalanceCardData();
                //

                //TransactionRecordController.fetchRecords();
                //IncomeController.fetchIncomes();
                //BankAccController.fetchBankAccount();
                //ExpenseController.fetchExpenseCategories();
                //StockAddController.fetchBoughtStock();
                //},
                //child: const Text("fetch")),
                gap(20),
                //ASSETDEBT SECTION
                const AssetDebt(),
                gap(20),
                //BANKACCOUNT SECTION
                title("BankAccount"),
                gap(10),
                Obx(() => Wrap(
                      alignment: WrapAlignment.end,
                      children: BankAccountData.bankAccountList
                          .asMap()
                          .entries
                          .map((entry) => Column(
                                children: [BankCard(bankAccount: entry.value)],
                              ))
                          .toList(),
                    )),
                gap(40),

                //SAVING GOALS SECTION
                title("Saving Goals"),
                gap(10),
                Container(
                    child: Obx(
                  () => Wrap(
                    alignment: WrapAlignment.start,
                    children:
                        SavingGoalData.savinglist.asMap().entries.map((entry) {
                      return Column(
                          children: [SavingCard(saving: entry.value)]);
                    }).toList(),
                  ),
                )),

                gap(20),
                //UPCOMING PAYMENTS SECTION
                title("Upcoming Payment"),
                Obx(() => Wrap(
                    alignment: WrapAlignment.center,
                    children: PaymentData.paymentlist.map((payment) {
                      return UpcomingPaymentCard(payment: payment);
                    }).toList())),

                //gapY("md"),
                const SizedBox(
                  height: 20,
                ),
                //  constraints: BoxConstraints(maxWidth: 500),
                //  child: MyLineChart(getChartData()), // Add the line chart here
                //),
              ],
            ),
          ),
          Positioned(
            bottom: 0.0,
            right: 10.0,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                width: 56.0,
                height: 56.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  shape: BoxShape.rectangle,
                  border: Border.all(
                    color: Colors.white, // Border color
                    width: 2.0, // Border width
                  ),
                ),
                child: FloatingActionButton(
                  onPressed: () => Dialogbuilder.hello(context),
                  child: const Icon(Icons.add),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
