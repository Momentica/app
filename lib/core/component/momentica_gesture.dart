import 'package:flutter/material.dart';

class MomenticaGesture extends StatelessWidget {
  final HitTestBehavior? behavior;
  final Function event;
  final Widget child;

  const MomenticaGesture({
    super.key,
    required this.event,
    required this.child,
    this.behavior = HitTestBehavior.translucent,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: behavior,
      onTap: () => event(),
      child: child,
    );
  }
}
