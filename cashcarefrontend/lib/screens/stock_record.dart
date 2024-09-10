import 'package:cashcarefrontend/controllers/stocks/stock_and_controller.dart';
import 'package:cashcarefrontend/data/stock_data.dart';
import 'package:cashcarefrontend/utils/cards/stock_portfolio_card.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class StockRecord extends StatefulWidget {
  const StockRecord({super.key});

  @override
  State<StockRecord> createState() => _StockRecordState();
}

class _StockRecordState extends State<StockRecord> {
  @override
  void initState() {
    super.initState();
    StockAddController.fetchBoughtStock();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(children: [
      Obx(() => Wrap(
            alignment: WrapAlignment.center,
            children: UserStockData.boughtStockList.map((boughtStock) {
              return StockPortfolioCard(boughtStock: boughtStock);
            }).toList(),
          )),
    ]));
  }
}
