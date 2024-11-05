import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:momentica/core/component/momentica_app_bar.dart';
import 'package:momentica/core/di/momentica_style.dart';
import 'package:momentica/core/layout/momentica_layout.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1100))
        .then((value) => context.go("/signIn"));
  }

  @override
  Widget build(BuildContext context) {
    return MomenticaLayout(
      child: Column(
        children: [
          const SizedBox(height: 240),
          Center(
            child: Image.asset(
              "$imageCoreAsset/momentica_logo_image.png",
              width: 210,
              height: 36,
            ),
          ),
        ],
      ),
    );
  }
}
