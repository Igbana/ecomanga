import 'package:ecomanga/features/auth/screens/register_screen.dart';
import 'package:ecomanga/features/auth/screens/login_screen.dart';
import 'package:ecomanga/features/home/root_screen.dart';
import 'package:ecomanga/controllers/controllers.dart';
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

  _init() {
    initControllers().then((_) async {
      print("Hello");
      try {
        await Controllers.profileController.getUser().then((val) {
          print(val);
          if (val)
            Utils.go(
              context: context,
              screen: const RootScreen(),
              replace: true,
            );
        });
      } catch (e) {
        if (Controllers.prefController.isLoggedin()) {
          try {
            await Controllers.loginController.refreshAuth().then((_) {
              Utils.go(
                context: context,
                screen: const RootScreen(),
                replace: true,
              );
            });
          } catch (e) {
            // Controllers.prefController.logout();
            Utils.go(
              context: context,
              screen: const LoginScreen(),
              replace: true,
            );
          }
        } else {
          // Controllers.prefController.logout();
          Utils.go(
            context: context,
            screen: const LoginScreen(),
            replace: true,
          );
        }
      }
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
