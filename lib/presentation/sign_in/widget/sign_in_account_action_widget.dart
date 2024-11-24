import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:momentica/core/component/momentica_gesture.dart';
import 'package:momentica/core/di/momentica_style.dart';

class SignInAccountActionWidget extends StatelessWidget {
  const SignInAccountActionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        /// Find Password
        MomenticaGesture(
          event: () => context.push("/password"),
          child: Text(
            "비밀번호 찾기",
            style: MomenticaTextStyle.body2(
              color: MomenticaColor.systemGray600,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            "|",
            style: MomenticaTextStyle.body2(
              color: MomenticaColor.systemGray600,
            ),
          ),
        ),

        /// Create Account
        MomenticaGesture(
          event: () => context.push("/signUp"),
          child: Text(
            "회원가입하기",
            style: MomenticaTextStyle.body2(
              color: MomenticaColor.systemGray600,
            ),
          ),
        ),
      ],
    );
  }
}
