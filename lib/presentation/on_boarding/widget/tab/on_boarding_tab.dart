import 'package:flutter/material.dart';
import 'package:momentica/core/di/momentica_style.dart';
import 'package:momentica/presentation/on_boarding/provider/type/on_boarding_tab_type.dart';

class OnBoardingTab extends StatelessWidget {
  final OnBoardingTabType type;

  const OnBoardingTab({
    super.key,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Column(
        children: [
          Text(
            "나의 작은 순간들을 모은",
            style: MomenticaTextStyle.title3Regular(
              color: MomenticaColor.black,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "이야기 책",
            style: MomenticaTextStyle.title3(
              color: MomenticaColor.black,
            ),
          ),
          const SizedBox(height: 45),
          Image.asset(
            type.image,
            height: 450,
            width: 261,
          ),
          const SizedBox(height: 120),
        ],
      ),
    );
  }
}
