import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../main.dart';
import '../home%20screen/dash_screen.dart';
import '../onboarding%20screen/onboard_screen.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({super.key});

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  @override
  void initState() {
    checkUserLoggedIn();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: const Color.fromARGB(255, 101, 209, 190),
        child: const Center(
          child: Image(
            image: AssetImage('assets/images/splash_logo.png'),
            width: 180,
            height: 180,
          ),
        ),
      ),
    );
  }

  void gotoOnboard() async {
    await Future.delayed(
      const Duration(seconds: 4),
    );
    if (!mounted) return;
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (ctx) {
          return const ScreenOnBoard();
        },
      ),
    );
  }

  Future<void> checkUserLoggedIn() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final userLoggedIn = sharedPreferences.getString(saveKey);
    if (userLoggedIn == null || userLoggedIn.isEmpty) {
      gotoOnboard();
    } else {
      currentSelectedIntex = 0;
      await Future.delayed(
        const Duration(seconds: 3),
      );
      if (!mounted) return;

      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (ctx) {
            return const DashScreen();
          },
        ),
      );
    }
  }
}
