import 'package:cashcarefrontend/api/fetcher.dart';
import 'package:cashcarefrontend/api/urls/app_urls.dart';
import 'package:cashcarefrontend/constants/token.dart';
import 'package:cashcarefrontend/features/auth/screen/login/login_view.dart';
import 'package:get/get.dart';

class LogoutController {
  LogoutController get instance => Get.find();

  static Future<void> logout() async {
    try {
      await FetchAPI(ApiUrls.logoutUrl, HttpMethod.post)
          .fetchAuthorizedAPI()
          .then((response) => handleLogout(response));
    } catch (error) {
      print('Logout failed: $error');
      // Handle error as needed
    }
  }

  static void handleLogout(response) {
    if (response.statusCode != null && response.statusCode == 200) {
      // Clear the stored authentication token
      ApiToken.authToken = null;

      // Navigate to the login screen or wherever appropriate
      Get.to(const Login());
    } else {
      print('Logout failed with status code: ${response.statusCode}');
      // Handle logout failure as needed
    }
  }
}
