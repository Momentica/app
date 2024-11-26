import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:momentica/core/component/momentica_button.dart';
import 'package:momentica/core/component/momentica_text_field.dart';
import 'package:momentica/core/di/momentica_style.dart';
import 'package:momentica/core/layout/momentica_layout.dart';
import 'package:momentica/core/provider/text_field_focus_provider.dart';
import 'package:momentica/core/type/suffix_type.dart';

class PasswordResetDeepLinkScreen extends ConsumerStatefulWidget {
  const PasswordResetDeepLinkScreen({super.key});

  @override
  ConsumerState<PasswordResetDeepLinkScreen> createState() =>
      _PasswordResetDeepLinkScreenState();
}

class _PasswordResetDeepLinkScreenState
    extends ConsumerState<PasswordResetDeepLinkScreen> {
  late TextEditingController passwordController;
  late TextEditingController confirmController;

  late FocusNode passwordFocusNode;
  late FocusNode confirmFocusNode;

  @override
  void initState() {
    super.initState();
    passwordController = TextEditingController();
    confirmController = TextEditingController();

    passwordFocusNode = FocusNode();
    confirmFocusNode = FocusNode();
  }

  @override
  void dispose() {
    passwordController.dispose();
    confirmController.dispose();

    passwordFocusNode.dispose();
    confirmFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final focusValue = ref.watch(textFieldFocusProvider);
    return MomenticaLayout(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Padding(
          padding: EdgeInsets.only(top: 24, bottom: focusValue ? 0 : 12),
          child: MomenticaButton(
            event: () {},
            height: 52,
            radius: 8,
            backgroundColor: MomenticaColor.main,
            content: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "비밀번호 재설정",
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
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),

              /// Title
              Text(
                "비밀번호 재설정하기",
                style: MomenticaTextStyle.title3(
                  color: MomenticaColor.black,
                ),
              ),
              const SizedBox(height: 40),

              /// Input New Password
              MomenticaTextField(
                controller: passwordController,
                focusNode: passwordFocusNode,
                caption: "새 비밀번호",
                type: SuffixType.password,
              ),
              const SizedBox(height: 32),

              /// Input Password Confirm
              MomenticaTextField(
                controller: confirmController,
                focusNode: confirmFocusNode,
                caption: "새 비밀번호 확인",
                type: SuffixType.password,
              ),

              /// KeyBoard가 올라왔을 때 화면을 스크롤할 수 있도록 간격 부여
              SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
            ],
          ),
        ),
      ),
    );
  }
}
