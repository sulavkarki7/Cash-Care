import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TermsAndConditionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.dark(),
      child: Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Get.back();
            },
          ),
          surfaceTintColor: Colors.black,
          title: const Text('Terms and Conditions'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // const Text(
                //   'Terms and Conditions',
                //   style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                // ),
                // SizedBox(height: Get.height * 0.02),
                // style: TextStyle(fontSize: 16),
                SizedBox(height: Get.height * 0.02),
                const Text(
                  'Welcome to Cash Care. By using this application, you agree to comply with and be bound by the following terms and conditions of use.',
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: Get.height * 0.02),
                // SizedBox(height: Get.height * 0.02),

                const Text(
                  textAlign: TextAlign.justify,
                  '1. Cash Care is committed to protecting your privacy and ensuring the security of your personal information. However, while we take appropriate measures to safeguard your data, we cannot guarantee that your personal information will always be secure. By using this app, you acknowledge and agree that your use of the app is at your own risk, and we cannot be held responsible for any unauthorized access to your data.',
                  style: TextStyle(fontSize: 16),
                ),

                SizedBox(height: Get.height * 0.01),
                const Text(
                  '2. The budgeting and financial management tools provided by Cash Care are intended to assist you in managing your finances. However, the accuracy and completeness of the data presented cannot be guaranteed. The app should not be used as a sole means for making financial decisions, and we recommend consulting a financial advisor for personalized advice.',
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.justify,
                ),

                SizedBox(height: Get.height * 0.01),
                const Text(
                  '3. The stock recommendations provided by Cash Care are generated based on algorithms that consider various factors such as user goals and risk preferences. These recommendations are for informational purposes only and should not be considered as financial advice. We do not guarantee the accuracy or reliability of the recommendations, and you are encouraged to perform your own research or consult a professional before making any investment decisions.',
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.justify,
                ),

                SizedBox(height: Get.height * 0.01),
                const Text(
                  '4. Cash Care shall not be liable for any direct, indirect, incidental, consequential, or punitive damages arising out of your use of the app, including but not limited to financial loss or loss of data. You agree to use the app at your own risk and accept full responsibility for any decisions made based on the information provided by the app.',
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.justify,
                ),

                SizedBox(height: Get.height * 0.01),
                const Text(
                  '5. You are responsible for maintaining the confidentiality of your account credentials and for all activities that occur under your account. You agree not to share your account information with others and to notify us immediately if you suspect any unauthorized use of your account.',
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.justify,
                ),

                SizedBox(height: Get.height * 0.01),
                const Text(
                  '6. Cash Care may integrate with third-party services to provide certain features or functionalities. These services are subject to their own terms and conditions, and Cash Care is not responsible for the content or performance of third-party services. You are encouraged to review the terms of any third-party services before using them within the app.',
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.justify,
                ),

                SizedBox(height: Get.height * 0.01),
                const Text(
                  '7. We retain your personal data for as long as necessary to provide you with our services or as required by law. If you choose to delete your account, your data will be permanently deleted, except for information we are legally obligated to retain. Please be aware that deleted data cannot be recovered.',
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.justify,
                ),

                SizedBox(height: Get.height * 0.01),
                const Text(
                  '8. All content, features, and functionality within Cash Care, including but not limited to text, graphics, logos, and software, are the intellectual property of Cash Care and are protected by copyright and other laws. Unauthorized use of any content or materials from the app is strictly prohibited.',
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.justify,
                ),

                SizedBox(height: Get.height * 0.01),
                const Text(
                  '9. We reserve the right to suspend or terminate your access to Cash Care at any time for any reason, including but not limited to violation of these terms and conditions. Upon termination, you will lose access to your account and any data associated with it.',
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.justify,
                ),

                SizedBox(height: Get.height * 0.01),
                const Text(
                  '10. Cash Care reserves the right to update or modify these terms and conditions at any time without prior notice. It is your responsibility to review these terms periodically to stay informed of any changes. Continued use of the app after any modifications indicates your acceptance of the revised terms.',
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.justify,
                ),

                SizedBox(height: Get.height * 0.01),
                const Text(
                  '11. If you have any questions or concerns regarding these terms and conditions, please contact us at support@cashcareapp.com.',
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
