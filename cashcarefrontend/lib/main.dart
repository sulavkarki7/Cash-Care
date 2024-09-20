import 'package:cashcarefrontend/navigation_menu.dart';

import 'package:cashcarefrontend/routes/routes.dart';
import 'package:cashcarefrontend/theme/theme_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  Get.put(ThemeController());

  // Get.put(StockFetchController());
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ccTheme,
      darkTheme: ccTheme,
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      title: 'Cash Care',
      initialRoute: CashCareRoute.getHomeRoute(),
      getPages: CashCareRoute.routes,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Theme(
        data: myTheme,
        child: const Scaffold(
          body: BottomNavigation(),
        ));
  }
}
