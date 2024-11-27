import 'package:flutter/material.dart';
import 'package:momentica/core/di/momentica_style.dart';

class MyFunctionCaptionWidget extends StatelessWidget {
  final String caption;

  const MyFunctionCaptionWidget({
    super.key,
    required this.caption,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Text(
        caption,
        style: MomenticaTextStyle.label1(
          color: MomenticaColor.systemGray600,
        ),
      ),
    );
  }
}
