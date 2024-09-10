import 'package:cashcarefrontend/models/stock.dart';

class BoughtStock1 {
  Stock stock;
  String boughtDate;
  double boughtUnit;
  double boughtPrice;
  BoughtStock1(
      {required this.stock,
      required this.boughtDate,
      required this.boughtUnit,
      required this.boughtPrice});
}
