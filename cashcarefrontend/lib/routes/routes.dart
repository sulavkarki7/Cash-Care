import 'package:cashcarefrontend/welcome_screen.dart';
import 'package:get/get.dart';

class CashCareRoute {
  static String home = '/';
  static String login = '/login';
  static String welcome = '/welcome';
  static String getHomeRoute() => home;
  static String getWelcomeRoute() => welcome;
  static String getLoginRoute() => login;
  static List<GetPage> routes = [
    GetPage(page: () => SplashScreen(), name: home),
    GetPage(page: () => WelcomeScreen(), name: welcome),
    GetPage(page: () => Login(), name: login)
  ];
}
