import 'package:flutter/material.dart';
import 'package:momentica/core/di/momentica_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: momenticaRouter,
      debugShowCheckedModeBanner: false,
    );
  }
}
