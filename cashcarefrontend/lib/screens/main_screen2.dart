import 'package:cashcarefrontend/utils/cards/profit_card.dart';
import 'package:cashcarefrontend/utils/charts/bar_chart.dart';
import 'package:cashcarefrontend/utils/date_range_picker.dart';
import 'package:cashcarefrontend/utils/forms/income_expense.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  void _hello(BuildContext context) {
    IncomeExpenseSelect form = const IncomeExpenseSelect();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Theme(
          data: ThemeData.dark(), // Use dark theme
          child: AlertDialog(
            backgroundColor: Colors.grey[900], // Dark background color
            title: const Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Center(
                    child: Text(
                  'Add new',
                  style: TextStyle(color: Colors.white), // Title text color
                ))),
            content: form,
            // actions: [
            //   TextButton(
            //     onPressed: () {
            //       Navigator.of(context).pop();
            //     },
            //     child: const Text(
            //       'Close',
            //       style: TextStyle(
            //           color: Colors.white), // Action button text color
            //     ),
            //   ),
            //   TextButton(
            //     onPressed: () {
            //       // Validate input fields and handle form submission
            //       form.submit();
            //       Navigator.of(context).pop();
            //     },
            //     child: const Text(
            //       'Save',
            //       style: TextStyle(
            //           color: Colors.white), // Action button text color
            //   ),
            // ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              width: double.infinity,
              child: Wrap(
                direction: Axis.horizontal,
                alignment: WrapAlignment.center,
                spacing: 16.0,
                runSpacing: 16.0,
                children: [
                  ProfitCard(
                    amount: "Rs 1500",
                    textColor: Colors.green,
                    icon: Icons.arrow_upward,
                    iconColor: Colors.green,
                  ),
                  ProfitCard(
                    amount: "Rs 1500",
                    textColor: Colors.red,
                    icon: Icons.arrow_downward,
                    iconColor: Colors.red,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20), // Add some space before the chart
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DateRangePicker(
                  restorationId: "restorationId",
                )
                //   Text(
                //     "Oct 20-",
                //     style: TextStyle(color: Colors.white),
                //   ),
                //   Text(
                //     "Oct 20",
                //     style: TextStyle(color: Colors.white),
                //   ),
              ],
            ),
            Expanded(
              child: MyLineChart(getChartData()), // Add the line chart here
            ),
          ],
        ),
        Positioned(
          bottom: 16.0,
          right: 16.0,
          child: Padding(
              padding: EdgeInsets.all(16),
              child: FloatingActionButton(
                onPressed: () => _hello(context),
                child: const Icon(Icons.add),
              )),
        ),
      ],
    );
  }
}
