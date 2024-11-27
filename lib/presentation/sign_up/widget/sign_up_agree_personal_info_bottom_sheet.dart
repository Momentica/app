import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:momentica/core/component/momentica_button.dart';
import 'package:momentica/core/component/momentica_gesture.dart';
import 'package:momentica/core/di/momentica_style.dart';
import 'package:momentica/presentation/sign_up/provider/sign_up_agree_option_controller_provider.dart';
import 'package:momentica/presentation/sign_up/provider/type/sign_up_agree_option_type.dart';
import 'package:momentica/presentation/sign_up/widget/sign_up_agree_option_widget.dart';

class SignUpAgreePersonalInfoBottomSheet extends ConsumerWidget {
  const SignUpAgreePersonalInfoBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// 개인정보 동의 관리
    final agreeOption = ref.watch(signUpAgreeOptionControllerProvider);
    final updateAgreeOption =
        ref.watch(signUpAgreeOptionControllerProvider.notifier);
    return SafeArea(
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: MomenticaColor.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 32),
              Row(
                children: [
                  MomenticaGesture(
                    event: () {
                      /// 모든 옵션이 활성화 되어있지 않으면
                      if (!SignUpAgreeOptionType.values
                          .every((option) => agreeOption.contains(option))) {
                        updateAgreeOption.allAgree();
                      } else {
                        /// 모든 옵션이 활성화 되어있으면
                        updateAgreeOption.delAllAgree();
                      }
                    },
                    child: SvgPicture.asset(
                      "$iconCoreAsset/check_icon.svg",
                      colorFilter: ColorFilter.mode(
                        SignUpAgreeOptionType.values
                                .every((option) => agreeOption.contains(option))
                            ? MomenticaColor.main
                            : MomenticaColor.systemGray500,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Text(
                    "모든 약관에 동의합니다.",
                    style: MomenticaTextStyle.subTitle2(
                      color: MomenticaColor.main,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 36),
              const SignUpAgreeOptionWidget(type: SignUpAgreeOptionType.personal),
              const SizedBox(height: 28),
              const SignUpAgreeOptionWidget(type: SignUpAgreeOptionType.terms),
              const SizedBox(height: 36),
              Padding(
                padding: const EdgeInsets.only(top: 24, bottom: 12),
                child: MomenticaButton(
                  event: () => context.go("/signUpSuccess"),
                  height: 52,
                  radius: 8,
                  backgroundColor: MomenticaColor.main,
                  content: Text(
                    "완료하기",
                    style: MomenticaTextStyle.button1(
                      color: MomenticaColor.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
