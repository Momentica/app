import 'package:flutter/material.dart';
import 'package:momentica/core/di/momentica_style.dart';

class MomenticaLayout extends StatelessWidget {
  final Color? backgroundColor;
  final PreferredSizeWidget? appBar;
  final Widget child;
  final Widget? floatingActionButton, bottomSheet, bottomNavigationBar;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final bool? resizeToAvoidBottomInset;

  const MomenticaLayout({
    super.key,
    required this.child,
    this.backgroundColor,
    this.appBar,
    this.floatingActionButton,
    this.bottomSheet,
    this.bottomNavigationBar,
    this.floatingActionButtonLocation,
    this.resizeToAvoidBottomInset = true,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      backgroundColor: backgroundColor ?? MomenticaColor.white,
      appBar: appBar,
      body: SafeArea(
        child: child,
      ),
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
      bottomSheet: bottomSheet,
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
