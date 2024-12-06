import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:momentica/core/component/momentica_app_bar.dart';
import 'package:momentica/core/component/momentica_gesture.dart';
import 'package:momentica/core/di/momentica_style.dart';
import 'package:momentica/core/layout/momentica_layout.dart';

class MyAddressScreen extends StatelessWidget {
  const MyAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MomenticaLayout(
      appBar: MomenticaAppBar(
        height: 56,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
          child: Row(
            children: [
              MomenticaGesture(
                event: () => context.pop(),
                child: SvgPicture.asset("$iconCoreAsset/left_arrow_icon.svg"),
              ),
              const SizedBox(width: 8),
              Text(
                "배송지",
                style: MomenticaTextStyle.caption1(
                  color: MomenticaColor.black,
                ),
              )
            ],
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: MomenticaColor.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  width: 1,
                  color: MomenticaColor.systemGray100,
                  strokeAlign: BorderSide.strokeAlignInside,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// 이름, 수정 버튼
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "강해민",
                          style: MomenticaTextStyle.subTitle2(
                            color: MomenticaColor.black,
                          ),
                        ),
                        MomenticaGesture(
                          event: () => context.push("/myAddressEdit"),
                          child: Text(
                            "수정하기",
                            style: MomenticaTextStyle.body2(
                              color: MomenticaColor.systemGray500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    /// 주소 1, 2
                    Text(
                      "충청남도 천안시 동남구 용곡4길 20",
                      style: MomenticaTextStyle.caption2(
                        color: MomenticaColor.systemGray900,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "현대아이파크아파트 101동 804호",
                      style: MomenticaTextStyle.caption2(
                        color: MomenticaColor.systemGray900,
                      ),
                    ),
                    const SizedBox(height: 16),

                    /// 전화번호
                    Text(
                      "010-5656-2523",
                      style: MomenticaTextStyle.caption2(
                        color: MomenticaColor.systemGray900,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
