import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:momentica/core/component/momentica_button.dart';
import 'package:momentica/core/di/momentica_asset.dart';
import 'package:momentica/core/di/momentica_style.dart';
import 'package:momentica/core/layout/momentica_layout.dart';

class SignUpSuccessScreen extends StatelessWidget {
  const SignUpSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MomenticaLayout(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: MomenticaButton(
          event: () {},
          backgroundColor: MomenticaColor.main,
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "이야기 만들기",
                style: MomenticaTextStyle.button1(
                  color: MomenticaColor.white,
                ),
              ),
              const SizedBox(width: 4),
              SvgPicture.asset("$iconCoreAsset/rightwards_arrow_icon.svg"),
            ],
          ),
        ),
      ),
      child: Center(
        child: Column(
          children: [
            const SizedBox(height: 240),
            SvgPicture.asset("$iconAuthAsset/firework_icon.svg"),
            const SizedBox(height: 28),
            Text(
              "가입 완료!",
              style: MomenticaTextStyle.subTitle2(
                color: MomenticaColor.main,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              "새로운 이야기를 만들어 보세요",
              style: MomenticaTextStyle.title4(
                color: MomenticaColor.main,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
