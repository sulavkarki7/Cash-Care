import 'package:cashcarefrontend/constants/app_colors.dart';
import 'package:cashcarefrontend/controllers/stocks/stock_fetch_controller.dart';
import 'package:cashcarefrontend/models/stock.dart';
import 'package:cashcarefrontend/screens/main_screen.dart';
import 'package:cashcarefrontend/screens/stock_insights.dart';
import 'package:cashcarefrontend/theme/theme_constant.dart';
import 'package:cashcarefrontend/utils/appbar/cashcare_bar.dart';
import 'package:cashcarefrontend/utils/cards/stock_card.dart';
import 'package:cashcarefrontend/utils/charts/candle_chart.dart';
import 'package:cashcarefrontend/utils/dialogs/DialogBuilder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StockDetail extends StatelessWidget {
  const StockDetail({required this.stock, super.key});
  final Stock stock;

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: myTheme,
        child: Scaffold(
          appBar: CashCareBar.normalPageBar(stock.name),
          body: Container(
            color: AppColors.black,
            child: SingleChildScrollView(
                child: Column(children: [
              StockCard(stock: stock),
              WwCandleChart(
                stock: stock,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          StockFetchController controller =
                              StockFetchController();
                          controller.getStockChart(stock);
                          controller.getCurrentData(stock);
                          Get.to(StockInsights(stock: stock));
                        },
                        child: const Text(
                          "Insights",
                          style: TextStyle(color: Colors.white),
                        )),
                    const SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          Dialogbuilder.stockForm(context, stock.id);
                        },
                        child: const Text(
                          "Add",
                          style: TextStyle(color: Colors.white),
                        )),
                  ],
                ),
              )
            ])),
          ),
        ));
  }
}
