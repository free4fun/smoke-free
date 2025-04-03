import 'package:flutter/material.dart';
import 'package:no_more_smoke/routes/routes.dart';
import 'package:no_more_smoke/common/assets_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    gotoHome();
  }

  Future<void> gotoHome() async {
    await Future.delayed(const Duration(milliseconds: 2000));
    // ignore: use_build_context_synchronously
    Navigator.of(context).pushReplacementNamed(Routes.HOME_SCREEN);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Hero(
          tag: "No More Smoke",
          child: Image.asset(
            AssetsManager.icon,
            width: 150,
            height: 150,
          ),
        ),
      ),
    );
  }
}
