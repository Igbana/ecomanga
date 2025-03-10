import 'package:ecomanga/features/auth/screens/register_screen.dart';

import 'package:ecomanga/features/utils/utils.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _init();
    });

    super.initState();
  }

  _init() async {
    Future.delayed(const Duration(seconds: 1), () {
      Utils.go(
        context: context,
        screen: const RegisterScreen(),
        replace: true,
      );
    });

    // FirebaseAuth.instance.currentUser == null
    //     ? Utils.go(
    //         context: context,
    //         screen: const OnbordingScreen(),
    //         replace: true,
    //       )
    //     : Utils.go(
    //         context: context,
    //         screen: const OnbordingScreen(),
    //         replace: true,
    //       );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          "assets/icons/app_icon.png",
          height: 250,
          width: 250,
        ),
      ),
    );
  }
}
