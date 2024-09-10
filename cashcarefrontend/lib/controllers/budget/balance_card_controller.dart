import 'dart:convert';

import 'package:cashcarefrontend/api/fetcher.dart';
import 'package:cashcarefrontend/api/urls/app_urls.dart';
import 'package:cashcarefrontend/controllers/modeloperation.dart';
import 'package:cashcarefrontend/data/balance_card.dart';

class BalanceCardController {
  static void fetchBalanceCardData() {
    ModelOperation().add(
      body: {},
      url: ApiUrls.fetchBalance,
      method: HttpMethod.get,
      successAction: (response) {
        final data = jsonDecode(response);
        BalanceCardData.balance.value = data['total_amount'];
        BalanceCardData.inAmount.value = data['in_amount'];
        BalanceCardData.outAmount.value = data['out_amount'];
      },
    );
  }
}
