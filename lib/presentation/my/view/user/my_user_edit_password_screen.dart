import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:momentica/core/component/momentica_app_bar.dart';
import 'package:momentica/core/component/momentica_button.dart';
import 'package:momentica/core/component/momentica_gesture.dart';
import 'package:momentica/core/component/momentica_text_field.dart';
import 'package:momentica/core/di/momentica_style.dart';
import 'package:momentica/core/layout/momentica_layout.dart';
import 'package:momentica/core/provider/text_field_focus_provider.dart';
import 'package:momentica/core/type/suffix_type.dart';

class MyUserEditPasswordScreen extends ConsumerStatefulWidget {
  const MyUserEditPasswordScreen({super.key});

  @override
  ConsumerState<MyUserEditPasswordScreen> createState() =>
      _MyUserEditPasswordScreenState();
}

class _MyUserEditPasswordScreenState
    extends ConsumerState<MyUserEditPasswordScreen> {
  late TextEditingController previousController;
  late TextEditingController nextController;
  late TextEditingController confirmController;

  late FocusNode previousFocusNode;
  late FocusNode nextFocusNode;
  late FocusNode confirmFocusNode;

  @override
  void initState() {
    super.initState();
    previousController = TextEditingController();
    nextController = TextEditingController();
    confirmController = TextEditingController();

    previousFocusNode = FocusNode();
    nextFocusNode = FocusNode();
    confirmFocusNode = FocusNode();
  }

  @override
  void dispose() {
    previousController.dispose();
    nextController.dispose();
    confirmController.dispose();

    previousFocusNode.dispose();
    nextFocusNode.dispose();
    nextFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final focusValue = ref.watch(textFieldFocusProvider);
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
                "비밀번호",
                style: MomenticaTextStyle.caption1(
                  color: MomenticaColor.black,
                ),
              )
            ],
          ),
        ),
      ),
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
            content: Text(
              "비밀번호 변경",
              style: MomenticaTextStyle.button1(
                color: MomenticaColor.white,
              ),
            ),
          ),
        ),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /// 이전 비밀번호 입력
              MomenticaTextField(
                controller: previousController,
                focusNode: previousFocusNode,
                caption: "이전 비밀번호",
                hintText: "8자 이상, 영어 숫자 조합입니다.",
                type: SuffixType.password,
              ),
              const SizedBox(height: 32),

              /// 새 비밀번호 입력
              MomenticaTextField(
                controller: nextController,
                focusNode: nextFocusNode,
                caption: "새 비밀번호",
                hintText: "새로운 비밀번호를 입력해주세요.",
                type: SuffixType.password,
              ),
              const SizedBox(height: 32),

              /// 새 비밀번호 재입력
              MomenticaTextField(
                controller: confirmController,
                focusNode: confirmFocusNode,
                caption: "새 비밀번호 확인",
                hintText: "새 비밀번호를 다시 입력해주세요.",
                type: SuffixType.password,
                textInputAction: TextInputAction.done,
              ),
              const SizedBox(height: 36),

              /// 비밀번호 찾기 버튼
              Text(
                "비밀번호 찾기",
                style: MomenticaTextStyle.body1(
                  color: MomenticaColor.systemGray600,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
            ],
          ),
        ),
      ),
    );
  }
}
