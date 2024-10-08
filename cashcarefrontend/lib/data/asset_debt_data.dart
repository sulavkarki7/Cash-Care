import "package:cashcarefrontend/data/graph_data.dart";
import "package:cashcarefrontend/models/assets.dart";
import "package:cashcarefrontend/models/debt.dart";
import "package:get/get.dart";

class AssetDebtData {
  static RxString hell = "hell".obs;
  static void addAsset(Assets asset) {
    assetsData.add(asset);
    pieDataList.add(PieData(name: asset.name, value: asset.amount));
  }

  static void updateChart() {
    pieDataList.clear();
    assetsData.forEach((asset) {
      pieDataList.add(PieData(name: asset.name, value: asset.amount));
    });
  }

  static void updateDebtChart() {
    debtPieChartData.clear();
    debtData.forEach((asset) {
      debtPieChartData.add(PieData(name: asset.name, value: asset.amount));
    });
  }

  static RxList<Assets> assetsData = <Assets>[].obs;
  static RxList<PieData> pieDataList = <PieData>[].obs;

  static RxList<Debt> debtData = <Debt>[].obs;
  static RxList<PieData> debtPieChartData = <PieData>[].obs;
}
