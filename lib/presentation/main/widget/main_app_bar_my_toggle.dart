import 'package:flutter/material.dart';
import 'package:momentica/core/di/momentica_style.dart';

class MainAppBarMyToggle extends StatelessWidget {
  const MainAppBarMyToggle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: MomenticaColor.systemGray50,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          bottomLeft: Radius.circular(30),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Padding(
          padding: const EdgeInsets.only(left: 8, right: 20),
          child: Container(
            width: 32,
            height: 32,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: MomenticaColor.white,
              shape: BoxShape.circle,
            ),
            child: Text(
              "MY",
              style: MomenticaTextStyle.button2(
                color: MomenticaColor.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
