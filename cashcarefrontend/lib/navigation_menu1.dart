import 'package:cashcarefrontend/constants/app_colors.dart';
import 'package:cashcarefrontend/screens/budget_screen.dart';
import 'package:cashcarefrontend/screens/history_screen.dart';
import 'package:cashcarefrontend/screens/main_screen.dart';
import 'package:cashcarefrontend/screens/stock_screen.dart';
import 'package:cashcarefrontend/theme/theme_constant.dart';
import 'package:cashcarefrontend/utils/appbar/cashcare_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Theme(
        data: myTheme,
        child: Scaffold(
          appBar: CashCareBar.barWithProfile(context, "Hello"),
          body: Obx(() => controller.screen[controller.selectedIndex.value]),
          bottomNavigationBar: Obx(
            () => Visibility(
              visible: !controller.hideNavigationBar.value,
              child: Container(
                child: Card(
                  color: AppColors.glass,
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  margin: EdgeInsets.all(10),
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: Container(
                      constraints: BoxConstraints(maxHeight: 40),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Expanded(
                                  child: Icon(Icons.home),
                                ),
                                SizedBox(height: 2, width: 2),
                                Expanded(
                                  child: Center(
                                    child: Text(
                                      "Home",
                                      style: TextStyle(
                                        color: controller.selectedIndex.value ==
                                                0
                                            ? Colors
                                                .lightGreen // Set light green when selected
                                            : Colors
                                                .black, // Set black when not selected
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // Other navigation items follow the same pattern
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                controller.selectedIndex.value = 1;
                              },
                              child: Container(
                                child: Column(children: [
                                  Expanded(
                                    child: Icon(Icons.account_balance_wallet),
                                  ),
                                  SizedBox(height: 2, width: 2),
                                  Expanded(
                                    child: Center(
                                      child: Text(
                                        "Budgets",
                                        style: TextStyle(
                                          color: controller
                                                      .selectedIndex.value ==
                                                  1
                                              ? Colors
                                                  .lightGreen // Set light green when selected
                                              : Colors
                                                  .black, // Set black when not selected
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ]),
                              ),
                            ),
                          ),
                          // Repeat the pattern for other navigation items
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final RxBool hideNavigationBar = false.obs;

  final screen = [
    const MainScreen(),
    const BudgetScreen(),
    HistoryScreen(),
    const StockScreen(),
  ];

  @override
  void onInit() {
    ever(Get.routing.obs, (_) {
      hideNavigationBar.value = Get.currentRoute != '/';
    });
    super.onInit();
  }
}
