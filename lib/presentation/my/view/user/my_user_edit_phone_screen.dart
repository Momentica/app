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
import 'package:momentica/core/util/number_formatter.dart';

class MyUserEditPhoneScreen extends ConsumerStatefulWidget {
  const MyUserEditPhoneScreen({super.key});

  @override
  ConsumerState<MyUserEditPhoneScreen> createState() =>
      _MyUserEditPhoneScreenState();
}

class _MyUserEditPhoneScreenState extends ConsumerState<MyUserEditPhoneScreen> {
  late TextEditingController inputController;
  late TextEditingController confirmController;

  late FocusNode inputFocusNode;
  late FocusNode confirmFocusNode;

  @override
  void initState() {
    super.initState();
    inputController = TextEditingController();
    confirmController = TextEditingController();

    inputFocusNode = FocusNode();
    confirmFocusNode = FocusNode();
  }

  @override
  void dispose() {
    inputController.dispose();
    confirmController.dispose();

    inputFocusNode.dispose();
    confirmFocusNode.dispose();
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
                "휴대폰 번호",
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
            content: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "휴대폰 번호 변경",
                  style: MomenticaTextStyle.button1(
                    color: MomenticaColor.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// 전화번호 입력
              MomenticaTextField(
                controller: inputController,
                focusNode: inputFocusNode,
                caption: "전화번호",
                type: SuffixType.none,
                textInputType: TextInputType.phone,
                textInputFormatter: NumberFormatter(),
                buttonContent: "인증 요청",
                buttonEvent: () {},
              ),
              const SizedBox(height: 32),

              /// 인증번호 입력
              MomenticaTextField(
                controller: confirmController,
                focusNode: confirmFocusNode,
                caption: "인증번호",
                type: SuffixType.none,
                textInputType: TextInputType.number,
                textInputAction: TextInputAction.done,
                buttonContent: "확인",
                buttonEvent: () {},
              ),
              SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
            ],
          ),
        ),
      ),
    );
  }
}
