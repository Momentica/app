import 'package:flutter/material.dart';

class MomenticaScrollLayout extends StatelessWidget {
  final Widget child;
  final ScrollPhysics? physics;

  const MomenticaScrollLayout({
    super.key,
    required this.child,
    this.physics,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: physics ?? const BouncingScrollPhysics(),
      child: child,
    );
  }
}
