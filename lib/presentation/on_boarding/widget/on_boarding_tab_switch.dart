import 'package:flutter/material.dart';
import 'package:momentica/core/component/momentica_gesture.dart';
import 'package:momentica/core/di/momentica_style.dart';
import 'package:momentica/presentation/on_boarding/provider/type/on_boarding_tab_type.dart';

class OnBoardingTabSwitch extends StatelessWidget {
  final TabController controller;

  const OnBoardingTabSwitch({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    const double size = 8;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        OnBoardingTabType.values.length,
        (index) {
          return MomenticaGesture(
            event: () {
              if (controller.index != index) {
                controller.index = index;
              }
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 6),
              width: size,
              height: size,
              decoration: BoxDecoration(
                color: controller.index == index
                    ? MomenticaColor.systemGray900
                    : MomenticaColor.systemGray100,
                shape: BoxShape.circle,
              ),
            ),
          );
        },
      ),
    );
  }
}
