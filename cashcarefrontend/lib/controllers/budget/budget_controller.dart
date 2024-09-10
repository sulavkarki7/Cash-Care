import 'dart:convert';

import 'package:cashcarefrontend/api/fetcher.dart';
import 'package:cashcarefrontend/api/urls/app_urls.dart';
import 'package:cashcarefrontend/models/budgets.dart';
import 'package:cashcarefrontend/models/category.dart';

class BudgetController {
  static List<Budget> budgets = [];
  static List<Category> categories = [];
  BudgetController._();
  //provides the array of budget for the ui
  static Future<dynamic> getBudgets() async {
    var response =
        await FetchAPI(ApiUrls.testUrl, HttpMethod.get).fetchAuthorizedAPI();
    if (response.statusCode == 200) {
      final List<dynamic> jsonResponse = jsonDecode(response.body);
      budgets = jsonResponse.map((item) => Budget.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load budgets');
    }
  }

  // // static Future<dynamic> getFullBudgets() async {
  // //   var response =
  // //       await FetchAPI(ApiUrls.test2Url, HttpMethod.get).fetchAuthorizedAPI();
  // //   if (response.statusCode == 200) {
  // //     final List<dynamic> jsonResponse = jsonDecode(response.body);
  // //   }
  // // }
}
