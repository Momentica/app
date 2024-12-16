import 'package:flutter/material.dart';
import 'package:momentica/core/di/momentica_style.dart';

class MyOrderTrackingProductInfoWidget extends StatelessWidget {
  const MyOrderTrackingProductInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 0.5,
            color: MomenticaColor.systemGray100,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "해민니의 일기 (P23)",
              style: MomenticaTextStyle.subTitle2(
                color: MomenticaColor.systemGray800,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "19,900원",
              style: MomenticaTextStyle.subTitle2(
                color: MomenticaColor.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
