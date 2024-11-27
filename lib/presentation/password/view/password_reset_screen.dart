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

class PasswordResetScreen extends ConsumerStatefulWidget {
  const PasswordResetScreen({super.key});

  @override
  ConsumerState<PasswordResetScreen> createState() =>
      _PasswordResetScreenState();
}

class _PasswordResetScreenState extends ConsumerState<PasswordResetScreen> {
  late TextEditingController controller;
  late FocusNode focusNode;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
    focusNode = FocusNode();
  }

  @override
  void dispose() {
    controller.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final focusValue = ref.watch(textFieldFocusProvider);
    return MomenticaLayout(
      appBar: MomenticaAppBar(
        height: 32,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
          child: Row(
            children: [
              /// Page Pop
              MomenticaGesture(
                event: () {
                  context.pop();
                },
                child: SvgPicture.asset("$iconCoreAsset/left_arrow_icon.svg"),
              ),
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
                  "링크 전송",
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
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),

            /// Title
            Text(
              "비밀번호 재설정하기",
              style: MomenticaTextStyle.title3(
                color: MomenticaColor.black,
              ),
            ),
            const SizedBox(height: 8),

            /// Caption
            Text(
              "입력한 전화번호로 재설정 링크를 보내드려요",
              style: MomenticaTextStyle.subTitle2(
                color: MomenticaColor.systemGray500,
              ),
            ),
            const SizedBox(height: 32),

            /// Input Number
            MomenticaTextField(
              controller: controller,
              focusNode: focusNode,
              caption: "전화번호",
              textInputType: TextInputType.phone,
              textInputFormatter: NumberFormatter(),
              type: SuffixType.eraser,
            ),
          ],
        ),
      ),
    );
  }
}
