import 'package:flutter/material.dart';
import 'package:momentica/core/di/momentica_style.dart';

class MyOrderTrackingDeliveryInfoWidget extends StatelessWidget {
  const MyOrderTrackingDeliveryInfoWidget({super.key});

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
              "배송 정보",
              style: MomenticaTextStyle.subTitle2(
                color: MomenticaColor.systemGray800,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "택배사",
                      style: MomenticaTextStyle.caption3(
                        color: MomenticaColor.systemGray600,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "송장 번호",
                      style: MomenticaTextStyle.caption3(
                        color: MomenticaColor.systemGray600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "우체국택배",
                      style: MomenticaTextStyle.caption3(
                        color: MomenticaColor.systemGray900,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          "3456789876543234567",
                          style: MomenticaTextStyle.caption3(
                            color: MomenticaColor.systemGray900,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          "배송조회",
                          style: MomenticaTextStyle.caption3(
                            color: MomenticaColor.systemBlue,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
