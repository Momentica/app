import 'package:flutter/material.dart';
import 'package:momentica/core/component/momentica_button.dart';
import 'package:momentica/core/component/momentica_text_field.dart';
import 'package:momentica/core/di/momentica_style.dart';
import 'package:momentica/core/layout/momentica_layout.dart';
import 'package:momentica/core/type/suffix_type.dart';
import 'package:momentica/core/util/number_formatter.dart';

class SignUpPhoneScreen extends StatefulWidget {
  const SignUpPhoneScreen({super.key});

  @override
  State<SignUpPhoneScreen> createState() => _SignUpPhoneScreenState();
}

class _SignUpPhoneScreenState extends State<SignUpPhoneScreen> {
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
    return MomenticaLayout(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Text(
              "전화번호를\n입력해주세요",
              style: MomenticaTextStyle.title3(
                color: MomenticaColor.black,
              ),
            ),
            const SizedBox(height: 40),
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
            MomenticaTextField(
              controller: confirmController,
              focusNode: confirmFocusNode,
              caption: "인증번호",
              type: SuffixType.none,
              textInputType: TextInputType.number,
              buttonContent: "확인",
              buttonEvent: () {},
            ),
          ],
        ),
      ),
    );
  }
}
