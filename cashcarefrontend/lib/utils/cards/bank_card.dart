import 'package:cashcarefrontend/constants/app_colors.dart';
import 'package:cashcarefrontend/models/bank_account.dart';
import 'package:flutter/material.dart';

class BankCard extends StatelessWidget {
  final BankAccount bankAccount;

  const BankCard({Key? key, required this.bankAccount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        color: AppColors.lowDarkBlue,
        child: InkWell(
            splashColor: Colors.blue.withAlpha(30),
            onTap: () {},
            child: Padding(
                padding: const EdgeInsets.all(6),
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 330),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.account_balance, color: Colors.blue),
                          Text(
                            "  ${bankAccount.name} ",
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Text(
                        "  ${bankAccount.accountNumber!.length > 5 ? '${bankAccount.accountNumber!.substring(0, 4)}******' : bankAccount.accountNumber} ",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[600],
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Rs ${bankAccount.amount}',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ))));
  }
}
