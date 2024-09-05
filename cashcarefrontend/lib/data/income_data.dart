import "package:get/get.dart";

class IncomeData {
  static void updateChart() {
    itemPieDataList.clear();
    fetchedItem.forEach((item) {
      itemPieDataList
          .add(PieData(name: item.name, value: item.amount.toDouble()));
    });
  }

  static List<Expense> expenseList = [
    Expense(amount: 480, category: 'food', name: "eggs")
  ];
  static List expenseBarTest = [];
  //list of the fetchedCategory
  static RxList<Item> fetchedItem = <Item>[].obs;
  static RxList<PieData> itemPieDataList = <PieData>[].obs;
  static RxList<Category> userCategoryList = <Category>[
    //Category.withAmount(category: "food", id: 3, amount: 400),
  ].obs;

  static RxList<IncomeCategory> allCategories = <IncomeCategory>[].obs;
  //static List<IncomeCategory> categoryList = [
  //  ExpenseCategory(name: "food", id: 3),
  //  ExpenseCategory(name: "food", id: 3),
  //];

  static RxList<Category> incomeCategories = <Category>[
    //Category.withAmount(id: 1, category: "Job", amount: 2000),
    //Category.withAmount(id: 2, category: "Upwork", amount: 20000)
  ].obs;
}
