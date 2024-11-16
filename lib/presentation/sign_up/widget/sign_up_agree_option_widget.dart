import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:momentica/core/component/momentica_gesture.dart';
import 'package:momentica/core/di/momentica_style.dart';
import 'package:momentica/presentation/sign_up/provider/sign_up_agree_option_controller_provider.dart';
import 'package:momentica/presentation/sign_up/provider/type/sign_up_agree_option_type.dart';

class SignUpAgreeOptionWidget extends ConsumerWidget {
  final SignUpAgreeOptionType type;

  const SignUpAgreeOptionWidget({
    super.key,
    required this.type,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final agreeOption = ref.watch(signUpAgreeOptionControllerProvider);
    final updateAgreeOption =
        ref.watch(signUpAgreeOptionControllerProvider.notifier);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            MomenticaGesture(
              event: () {
                /// 해당 옵션이 state에 추가되어있으면 => 활성화되어 있으면
                if (agreeOption.contains(type)) {
                  updateAgreeOption.delAgree(option: type);
                } else {
                  updateAgreeOption.addAgree(option: type);
                }
              },
              child: SvgPicture.asset(
                "$iconCoreAsset/check_icon.svg",
                colorFilter: ColorFilter.mode(
                  agreeOption.contains(type)
                      ? MomenticaColor.main
                      : MomenticaColor.systemGray500,
                  BlendMode.srcIn,
                ),
              ),
            ),
            const SizedBox(width: 16),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: type.caption,
                    style: MomenticaTextStyle.body1(
                      color: MomenticaColor.main,
                    ),
                  ),
                  if (type.essential)
                    TextSpan(
                      text: " (필수)",
                      style: MomenticaTextStyle.body1(
                        color: MomenticaColor.systemBlue,
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
        SvgPicture.asset("$iconCoreAsset/right_arrow_icon.svg"),
      ],
    );
  }
}
