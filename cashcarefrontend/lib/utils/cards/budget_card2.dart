import 'package:cashcarefrontend/constants/app_icon.dart';
import 'package:cashcarefrontend/models/budgets.dart';
import 'package:cashcarefrontend/screens/category_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BudgetCard extends StatelessWidget {
  final Budget budget;

  const BudgetCard({Key? key, required this.budget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          // Navigate to the detail page when the card is tapped
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CategoryScreen(
                id: budget.category.id,
                category: budget.category.category,
                total: budget.amount,
              ),
            ),
          );
        },
        child: Card(
          elevation: 4,
          color: Colors.grey[800], // Adjusted card color to match background
          margin: const EdgeInsets.all(16),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.blue,
                  radius: 30,
                  child: Icon(
                    AppIcons.transportation,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  budget.category.category,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Text color adjusted for visibility
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "Rs ${budget.amount.toString()}",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.red,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  "Duration: Oct01 to Oct10",
                  style: TextStyle(
                      fontSize: 16,
                      color:
                          Colors.white), // Adjusted text color for visibility
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
