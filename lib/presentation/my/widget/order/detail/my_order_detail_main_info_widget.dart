import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:momentica/core/component/momentica_button.dart';
import 'package:momentica/core/component/momentica_outlined_button.dart';
import 'package:momentica/core/di/momentica_router.dart';
import 'package:momentica/core/di/momentica_style.dart';

class MyOrderDetailMainInfoWidget extends StatelessWidget {
  const MyOrderDetailMainInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                "$diaryTickAsset/blue_tick_diary.svg",
                width: 60,
                height: 84,
              ),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "10/23 출고예정",
                    style: MomenticaTextStyle.body1(
                      color: MomenticaColor.systemBlue,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "해민니의 일기 (P23)",
                    style: MomenticaTextStyle.subTitle1(
                      color: MomenticaColor.systemGray800,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "19,900원",
                    style: MomenticaTextStyle.subTitle1(
                      color: MomenticaColor.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: MomenticaOutlinedButton(
                  event: () {},
                  color: MomenticaColor.systemGray300,
                  backgroundColor: MomenticaColor.white,
                  content: Text(
                    "문의하기",
                    style: MomenticaTextStyle.button2(
                      color: MomenticaColor.systemGray800,
                    ),
                  ),
                  borderWidth: 1,
                  height: 40,
                  radius: 4,
                ),
              ),
              const SizedBox(width: 18),
              Expanded(
                child: MomenticaOutlinedButton(
                  event: () => context.push("/myOrderTracking"),
                  color: MomenticaColor.systemGray300,
                  backgroundColor: MomenticaColor.white,
                  content: Text(
                    "배송 조회하기",
                    style: MomenticaTextStyle.button2(
                      color: MomenticaColor.systemGray800,
                    ),
                  ),
                  borderWidth: 1,
                  height: 40,
                  radius: 4,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
