import 'package:flutter/material.dart';
import 'package:momentica/core/component/momentica_gesture.dart';

class MomenticaButton extends StatelessWidget {
  final Function event;
  final double? height, width, radius;
  final Color backgroundColor;
  final Widget content;

  const MomenticaButton({
    super.key,
    required this.event,
    required this.backgroundColor,
    required this.content,
    this.height,
    this.width,
    this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return MomenticaGesture(
      event: () => event(),
      child: Container(
        width: width ?? MediaQuery.of(context).size.width,
        height: height ?? 52,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(radius ?? 8),
        ),
        child: content,
      ),
    );
  }
}
