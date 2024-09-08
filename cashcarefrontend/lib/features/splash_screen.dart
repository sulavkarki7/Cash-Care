import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:cashcarefrontend/welcome_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return FlutterSplashScreen.scale(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.grey[900]!,
            Colors.grey[900]!,
            // Colors.white,
          ],
        ),
        childWidget: SizedBox(
          height: 180,
          width: 180,
          child: Image.asset('assets/ccLogoDarkGrey.2.png'),
        ),
        duration: const Duration(milliseconds: 2500),
        animationDuration: const Duration(milliseconds: 2000),
        onAnimationEnd: () => debugPrint("On Scale End"),
        // nextScreen: const WelcomeScreen(),

        nextScreen: WelcomeScreen());
  }
}
