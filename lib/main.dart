import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:momentica/core/di/momentica_router.dart';
import 'package:momentica/core/di/momentica_style.dart';

void main() {
  runApp(
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: momenticaRouter,
      theme: ThemeData(
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: MomenticaColor.main,
          selectionHandleColor: MomenticaColor.main,
          selectionColor: MomenticaColor.systemGray200,
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
