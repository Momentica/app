import 'package:flutter/material.dart';
import 'package:momentica/core/component/momentica_gesture.dart';

class MomenticaOutlinedButton extends StatelessWidget {
  final Function event;
  final double height, radius, borderWidth;
  final double? width;
  final Color backgroundColor, color;
  final Widget content;

  const MomenticaOutlinedButton({
    super.key,
    required this.event,
    required this.backgroundColor,
    required this.color,
    required this.content,
    required this.height,
    required this.radius,
    required this.borderWidth,
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
          border: Border.all(
            color: color,
            width: borderWidth,
            strokeAlign: BorderSide.strokeAlignInside,
          ),
          borderRadius: BorderRadius.circular(radius),
        ),
        child: content,
      ),
    );
  }
}
