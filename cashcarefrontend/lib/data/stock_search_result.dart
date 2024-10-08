import "package:cashcarefrontend/data/graph_data.dart";
import "package:cashcarefrontend/models/stock.dart";
import "package:get/get.dart";

class StockData {
  static RxList<Stock> searchList = <Stock>[].obs;
  static RxList<Stock> hotStock = <Stock>[].obs;
  static List<OHLCdata> currentOHLCData = [
    OHLCdata('may-1', 34, 9, 10, 27),
    OHLCdata('may-2', 38, 10, 41, 29),
    OHLCdata('may-3', 38, 10, 21, 29),
    OHLCdata('may-4', 6, 7, 6, 24),
    OHLCdata('may-6', 34, 9, 10, 27),
  ];
}
