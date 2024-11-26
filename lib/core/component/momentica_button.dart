import 'package:flutter/material.dart';
import 'package:momentica/core/component/momentica_gesture.dart';

class MomenticaButton extends StatelessWidget {
  final Function event;
  final double height, radius;
  final double? width;
  final Color backgroundColor;
  final Widget content;

  const MomenticaButton({
    super.key,
    required this.event,
    required this.backgroundColor,
    required this.content,
    required this.height,
    required this.radius,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return MomenticaGesture(
      event: () => event(),
      child: Container(
        width: width ?? MediaQuery.of(context).size.width,
        height: height,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(radius),
        ),
        child: content,
      ),
    );
  }
}
