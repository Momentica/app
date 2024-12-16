import 'package:flutter/material.dart';
import 'package:momentica/core/di/momentica_style.dart';

class MyOrderTrackingInfoWidget extends StatelessWidget {
  const MyOrderTrackingInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 0.5,
            color: MomenticaColor.systemGray100,
            strokeAlign: BorderSide.strokeAlignInside,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 16,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: MomenticaColor.systemGray50,
                borderRadius: BorderRadius.circular(40),
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  height: 16,
                  width: MediaQuery.of(context).size.width / 2,
                  decoration: BoxDecoration(
                    color: MomenticaColor.systemGray700,
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "준비 중",
                  style: MomenticaTextStyle.body2(
                    color: MomenticaColor.systemGray600,
                  ),
                ),
                Text(
                  "배송 중",
                  style: MomenticaTextStyle.body2(
                    color: MomenticaColor.systemGray600,
                  ),
                ),
                Text(
                  "배송 완료",
                  style: MomenticaTextStyle.body2(
                    color: MomenticaColor.systemGray600,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
