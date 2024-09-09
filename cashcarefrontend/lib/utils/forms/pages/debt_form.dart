import 'package:cashcarefrontend/theme/theme_constant.dart';
import 'package:cashcarefrontend/utils/appbar/cashcare_bar.dart';
import 'package:flutter/material.dart';

class DebtForm extends StatelessWidget {
  const DebtForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: myTheme,
        child: Scaffold(
          appBar: CashCareBar.normalPageBar("Add Saving Goal"),
          body: Container(child: Text("Hi")),
        ));
  }
}
