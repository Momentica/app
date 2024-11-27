import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:momentica/core/component/momentica_app_bar.dart';
import 'package:momentica/core/component/momentica_gesture.dart';
import 'package:momentica/core/di/momentica_style.dart';
import 'package:momentica/core/layout/momentica_layout.dart';
import 'package:momentica/presentation/my/widget/user/my_user_info_widget.dart';

class MyUserScreen extends StatefulWidget {
  const MyUserScreen({super.key});

  @override
  State<MyUserScreen> createState() => _MyUserScreenState();
}

class _MyUserScreenState extends State<MyUserScreen> {
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
                "내 정보",
                style: MomenticaTextStyle.caption1(
                  color: MomenticaColor.black,
                ),
              )
            ],
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// 이름
            MyUserInfoWidget(
              event: () => context.push("/myUserEditName"),
              caption: "이름",
              value: "강해민",
            ),
            const SizedBox(height: 36),

            /// 전화번호
            MyUserInfoWidget(
              event: () => context.push("/myUserEditPhone"),
              caption: "전화번호",
              value: "010-5656-2523",
            ),
            const SizedBox(height: 36),

            /// 비밀번호 obscure character로 표기
            MyUserInfoWidget(
              event: () => context.push("/myUserEditPassword"),
              caption: "비밀번호",
              value: "강해민",
            ),
            const SizedBox(height: 32),

            /// 회원 탈퇴 버튼
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "회원 정보를 삭제하시겠어요?",
                  style: MomenticaTextStyle.caption3(
                    color: MomenticaColor.systemGray400,
                  ),
                ),
                Text(
                  "회원 탈퇴하기",
                  style: MomenticaTextStyle.caption3(
                    color: MomenticaColor.systemGray400,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
