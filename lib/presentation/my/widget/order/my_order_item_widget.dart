import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:momentica/core/component/momentica_gesture.dart';
import 'package:momentica/core/di/momentica_router.dart';
import 'package:momentica/core/di/momentica_style.dart';

class MyOrderItemWidget extends StatelessWidget {
  const MyOrderItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: MomenticaColor.white,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "2024. 08. 12",
                  style: MomenticaTextStyle.subTitle3(
                    color: MomenticaColor.systemGray900,
                  ),
                ),
                MomenticaGesture(
                  event: () => context.push("/myOrderDetail"),
                  child: Row(
                    children: [
                      Text(
                        "주문 상세",
                        style: MomenticaTextStyle.body2(
                          color: MomenticaColor.systemGray700,
                        ),
                      ),
                      const SizedBox(width: 2),
                      SvgPicture.asset(
                        "$iconCoreAsset/right_arrow_icon.svg",
                        width: 12,
                        height: 12,
                        colorFilter: const ColorFilter.mode(
                          MomenticaColor.systemGray700,
                          BlendMode.srcIn,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                SvgPicture.asset(
                  "$diaryTickAsset/yellow_tick_diary.svg",
                  width: 48,
                  height: 68,
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "10/23 출고예정",
                      style: MomenticaTextStyle.body2(
                        color: MomenticaColor.systemBlue,
                      ),
                    ),
                    const SizedBox(height: 8),
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
