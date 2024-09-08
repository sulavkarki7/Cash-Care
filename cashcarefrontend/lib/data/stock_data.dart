import 'package:cashcarefrontend/models/BoughtStock.dart';
import 'package:get/get.dart';

class UserStockData {
  static RxList<BoughtStock> boughtStockList = <BoughtStock>[
    //BoughtStock(
    //    date: '10/2023/5',
    //    stock: Stock(
    //      name: "Pokhara Finance",
    //      securityName: "Pokhara Finance ",
    //      symbol: "PFl",
    //      id: 23,
    //    ),
    //    unit: 100,
    //    boughtAmount: 100)
  ].obs;
  static RxList<double> lstmList = <double>[].obs;
  //list of the candle last for the selected one
  //insightData
}
